//
//  SizeConstraintParametersProvider.swift
//  FlooidLayout
//
//  Created by Martin Lalev on 12.07.19.
//  Copyright © 2019 Martin Lalev. All rights reserved.
//

import Foundation
import UIKit


public protocol SizeConstraintParametersProvider {
    var widthProperties: DimensionConstraintParametersProvider { get }
    var heightProperties: DimensionConstraintParametersProvider { get }
}

public struct SizeConstraintParameters: SizeConstraintParametersProvider {
    public let widthProperties: DimensionConstraintParametersProvider
    public let heightProperties: DimensionConstraintParametersProvider
}

extension NSLayoutSize: SizeConstraintParametersProvider {
    public var widthProperties: DimensionConstraintParametersProvider { return self.widthAnchor }
    public var heightProperties: DimensionConstraintParametersProvider { return self.heightAnchor }
}



extension SizeConstraintParametersProvider {
    func expand(width: CGFloat, height: CGFloat) -> SizeConstraintParameters { return .init(widthProperties: self.widthProperties.expand(by: width), heightProperties: self.heightProperties.expand(by: height)) }
    func scale(width: CGFloat, height: CGFloat) -> SizeConstraintParameters { return .init(widthProperties: self.widthProperties.scale(by: width), heightProperties: self.heightProperties.scale(by: height)) }
    func expand(by value: CGFloat) -> SizeConstraintParameters { return self.expand(width: value, height: value) }
    func scale(by value: CGFloat) -> SizeConstraintParameters { return self.scale(width: value, height: value) }
}

public func + (lhs: SizeConstraintParametersProvider, rhs: CGFloat) -> SizeConstraintParameters { return lhs.expand(by: rhs) }
public func - (lhs: SizeConstraintParametersProvider, rhs: CGFloat) -> SizeConstraintParameters { return lhs.expand(by: -rhs) }
public func ++ (lhs: SizeConstraintParametersProvider, rhs: CGFloat) -> SizeConstraintParameters { return lhs.expand(by: 2*rhs) }
public func -- (lhs: SizeConstraintParametersProvider, rhs: CGFloat) -> SizeConstraintParameters { return lhs.expand(by: -2*rhs) }
public func * (lhs: SizeConstraintParametersProvider, rhs: CGFloat) -> SizeConstraintParameters { return lhs.scale(by: rhs) }
public func + (lhs: SizeConstraintParametersProvider, rhs: (CGFloat,CGFloat)) -> SizeConstraintParameters { return lhs.expand(width: rhs.0, height: rhs.1) }
public func - (lhs: SizeConstraintParametersProvider, rhs: (CGFloat,CGFloat)) -> SizeConstraintParameters { return lhs.expand(width: -rhs.0, height: -rhs.1) }
public func ++ (lhs: SizeConstraintParametersProvider, rhs: (CGFloat,CGFloat)) -> SizeConstraintParameters { return lhs.expand(width: 2*rhs.0, height: 2*rhs.1) }
public func -- (lhs: SizeConstraintParametersProvider, rhs: (CGFloat,CGFloat)) -> SizeConstraintParameters { return lhs.expand(width: -2*rhs.0, height: -2*rhs.1) }
public func * (lhs: SizeConstraintParametersProvider, rhs: (CGFloat,CGFloat)) -> SizeConstraintParameters { return lhs.scale(width: rhs.0, height: rhs.1) }
