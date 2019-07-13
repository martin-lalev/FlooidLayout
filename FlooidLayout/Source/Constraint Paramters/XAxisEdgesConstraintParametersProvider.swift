//
//  XAxisEdgesConstraintParametersProvider.swift
//  FlooidLayout
//
//  Created by Martin Lalev on 12.07.19.
//  Copyright © 2019 Martin Lalev. All rights reserved.
//

import Foundation
import UIKit


public protocol XAxisEdgesConstraintParametersProvider {
    var leadingProperties: XAxisConstraintParametersProvider { get }
    var trailingProperties: XAxisConstraintParametersProvider { get }
}

public struct XAxisEdgesConstraintParameters: XAxisEdgesConstraintParametersProvider {
    public let leadingProperties: XAxisConstraintParametersProvider
    public let trailingProperties: XAxisConstraintParametersProvider
}

extension NSLayoutXAxisEdges: XAxisEdgesConstraintParametersProvider {
    public var leadingProperties: XAxisConstraintParametersProvider { return self.leadingAxisAnchor }
    public var trailingProperties: XAxisConstraintParametersProvider { return self.trailingAxisAnchor }
}



extension XAxisEdgesConstraintParametersProvider {
    func expand(leading: CGFloat, trailing: CGFloat) -> XAxisEdgesConstraintParameters { return .init(leadingProperties: self.leadingProperties.move(by: -leading), trailingProperties: self.trailingProperties.move(by: trailing)) }
    func expand(by value: CGFloat) -> XAxisEdgesConstraintParameters { return self.expand(leading: value, trailing: value) }
}

public func ++ (lhs: XAxisEdgesConstraintParametersProvider, rhs: CGFloat) -> XAxisEdgesConstraintParameters { return lhs.expand(by: rhs) }
public func -- (lhs: XAxisEdgesConstraintParametersProvider, rhs: CGFloat) -> XAxisEdgesConstraintParameters { return lhs.expand(by: -rhs) }
public func ++ (lhs: XAxisEdgesConstraintParametersProvider, rhs: (CGFloat,CGFloat)) -> XAxisEdgesConstraintParameters { return lhs.expand(leading: rhs.0, trailing: rhs.1) }
public func -- (lhs: XAxisEdgesConstraintParametersProvider, rhs: (CGFloat,CGFloat)) -> XAxisEdgesConstraintParameters { return lhs.expand(leading: -rhs.0, trailing: -rhs.1) }
