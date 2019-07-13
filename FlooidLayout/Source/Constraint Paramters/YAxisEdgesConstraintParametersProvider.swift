//
//  YAxisEdgesConstraintParametersProvider.swift
//  FlooidLayout
//
//  Created by Martin Lalev on 12.07.19.
//  Copyright © 2019 Martin Lalev. All rights reserved.
//

import Foundation
import UIKit


public protocol YAxisEdgesConstraintParametersProvider {
    var topProperties: YAxisConstraintParametersProvider { get }
    var bottomProperties: YAxisConstraintParametersProvider { get }
}

public struct YAxisEdgesConstraintParameters: YAxisEdgesConstraintParametersProvider {
    public let topProperties: YAxisConstraintParametersProvider
    public let bottomProperties: YAxisConstraintParametersProvider
}

extension NSLayoutYAxisEdges: YAxisEdgesConstraintParametersProvider {
    public var topProperties: YAxisConstraintParametersProvider { return self.topAxisAnchor }
    public var bottomProperties: YAxisConstraintParametersProvider { return self.bottomAxisAnchor }
}



extension YAxisEdgesConstraintParametersProvider {
    func expand(top: CGFloat, bottom: CGFloat) -> YAxisEdgesConstraintParameters { return .init(topProperties: self.topProperties.move(by: -top), bottomProperties: self.bottomProperties.move(by: bottom)) }
    func expand(by value: CGFloat) -> YAxisEdgesConstraintParameters { return self.expand(top: value, bottom: value) }
}

public func ++ (lhs: YAxisEdgesConstraintParametersProvider, rhs: CGFloat) -> YAxisEdgesConstraintParameters { return lhs.expand(by: rhs) }
public func -- (lhs: YAxisEdgesConstraintParametersProvider, rhs: CGFloat) -> YAxisEdgesConstraintParameters { return lhs.expand(by: -rhs) }
public func ++ (lhs: YAxisEdgesConstraintParametersProvider, rhs: (CGFloat,CGFloat)) -> YAxisEdgesConstraintParameters { return lhs.expand(top: rhs.0, bottom: rhs.1) }
public func -- (lhs: YAxisEdgesConstraintParametersProvider, rhs: (CGFloat,CGFloat)) -> YAxisEdgesConstraintParameters { return lhs.expand(top: -rhs.0, bottom: -rhs.1) }
