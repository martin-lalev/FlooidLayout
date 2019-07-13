//
//  LocationConstraintParametersProvider.swift
//  FlooidLayout
//
//  Created by Martin Lalev on 12.07.19.
//  Copyright © 2019 Martin Lalev. All rights reserved.
//

import Foundation
import UIKit


public protocol LocationConstraintParametersProvider {
    var xAxisProperties: XAxisConstraintParametersProvider { get }
    var yAxisProperties: YAxisConstraintParametersProvider { get }
}

public struct LocationConstraintParameters: LocationConstraintParametersProvider {
    public let xAxisProperties: XAxisConstraintParametersProvider
    public let yAxisProperties: YAxisConstraintParametersProvider
}

extension NSLayoutLocation: LocationConstraintParametersProvider {
    public var xAxisProperties: XAxisConstraintParametersProvider { return self.xAxisAnchor }
    public var yAxisProperties: YAxisConstraintParametersProvider { return self.yAxisAnchor }
}



extension LocationConstraintParametersProvider {
    func move(horizontally: CGFloat, vertically: CGFloat) -> LocationConstraintParameters { return .init(xAxisProperties: self.xAxisProperties.move(by: horizontally), yAxisProperties: self.yAxisProperties.move(by: vertically)) }
    func move(by value: CGFloat) -> LocationConstraintParameters { return self.move(horizontally: value, vertically: value) }
}

public func + (lhs: LocationConstraintParametersProvider, rhs: CGFloat) -> LocationConstraintParameters { return lhs.move(by: rhs) }
public func - (lhs: LocationConstraintParametersProvider, rhs: CGFloat) -> LocationConstraintParameters { return lhs.move(by: -rhs) }
public func + (lhs: LocationConstraintParametersProvider, rhs: (CGFloat,CGFloat)) -> LocationConstraintParameters { return lhs.move(horizontally: rhs.0, vertically: rhs.1) }
public func - (lhs: LocationConstraintParametersProvider, rhs: (CGFloat,CGFloat)) -> LocationConstraintParameters { return lhs.move(horizontally: -rhs.0, vertically: -rhs.1) }
