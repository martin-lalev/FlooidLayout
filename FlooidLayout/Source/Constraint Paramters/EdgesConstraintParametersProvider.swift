//
//  EdgesConstraintParametersProvider.swift
//  FlooidLayout
//
//  Created by Martin Lalev on 12.07.19.
//  Copyright © 2019 Martin Lalev. All rights reserved.
//

import Foundation
import UIKit


@MainActor
public protocol EdgesConstraintParametersProvider {
    var leadingProperties: XAxisConstraintParametersProvider { get }
    var trailingProperties: XAxisConstraintParametersProvider { get }
    var topProperties: YAxisConstraintParametersProvider { get }
    var bottomProperties: YAxisConstraintParametersProvider { get }
}

public struct EdgesConstraintParameters: EdgesConstraintParametersProvider {
    public let leadingProperties: XAxisConstraintParametersProvider
    public let trailingProperties: XAxisConstraintParametersProvider
    public let topProperties: YAxisConstraintParametersProvider
    public let bottomProperties: YAxisConstraintParametersProvider
}

extension NSLayoutEdges: EdgesConstraintParametersProvider {
    public var leadingProperties: XAxisConstraintParametersProvider { return self.leadingAxisAnchor }
    public var trailingProperties: XAxisConstraintParametersProvider { return self.trailingAxisAnchor }
    public var topProperties: YAxisConstraintParametersProvider { return self.topAxisAnchor }
    public var bottomProperties: YAxisConstraintParametersProvider { return self.bottomAxisAnchor }
}



extension EdgesConstraintParametersProvider {
    func expand(leading: CGFloat, trailing: CGFloat, top: CGFloat, bottom: CGFloat) -> EdgesConstraintParameters {
        return .init(
            leadingProperties: self.leadingProperties.move(by: -leading),
            trailingProperties: self.trailingProperties.move(by: trailing),
            topProperties: self.topProperties.move(by: -top),
            bottomProperties: self.bottomProperties.move(by: bottom)
        )
    }
    func expand(horizontally: CGFloat, vertically: CGFloat) -> EdgesConstraintParameters { return self.expand(leading: horizontally, trailing: horizontally, top: vertically, bottom: vertically) }
    func expand(by value: CGFloat) -> EdgesConstraintParameters { return self.expand(leading: value, trailing: value, top: value, bottom: value) }
    func inset(leading: CGFloat, trailing: CGFloat, top: CGFloat, bottom: CGFloat) -> EdgesConstraintParameters { return self.expand(leading: -leading, trailing: -trailing, top: -top, bottom: -bottom) }
    func inset(horizontally: CGFloat, vertically: CGFloat) -> EdgesConstraintParameters { return self.expand(horizontally: -horizontally, vertically: -vertically) }
    func inset(by value: CGFloat) -> EdgesConstraintParameters { return self.expand(by: -value) }
}

@MainActor
public func ++ (lhs: EdgesConstraintParameters, rhs: CGFloat) -> EdgesConstraintParameters { return lhs.expand(by: rhs) }
@MainActor
public func -- (lhs: EdgesConstraintParameters, rhs: CGFloat) -> EdgesConstraintParameters { return lhs.expand(by: -rhs) }
@MainActor
public func ++ (lhs: EdgesConstraintParameters, rhs: (CGFloat,CGFloat)) -> EdgesConstraintParameters { return lhs.expand(horizontally: rhs.0, vertically: rhs.1) }
@MainActor
public func -- (lhs: EdgesConstraintParameters, rhs: (CGFloat,CGFloat)) -> EdgesConstraintParameters { return lhs.expand(horizontally: -rhs.0, vertically: -rhs.1) }
@MainActor
public func ++ (lhs: EdgesConstraintParameters, rhs: (CGFloat,CGFloat,CGFloat,CGFloat)) -> EdgesConstraintParameters { return lhs.expand(leading: rhs.0, trailing: rhs.1, top: rhs.2, bottom: rhs.3) }
@MainActor
public func -- (lhs: EdgesConstraintParameters, rhs: (CGFloat,CGFloat,CGFloat,CGFloat)) -> EdgesConstraintParameters { return lhs.expand(leading: -rhs.0, trailing: -rhs.1, top: rhs.2, bottom: rhs.3) }
@MainActor
public func ++ (lhs: EdgesConstraintParameters, rhs: NSDirectionalEdgeInsets) -> EdgesConstraintParameters { return lhs.expand(leading: rhs.leading, trailing: rhs.trailing, top: rhs.top, bottom: rhs.bottom) }
@MainActor
public func -- (lhs: EdgesConstraintParameters, rhs: NSDirectionalEdgeInsets) -> EdgesConstraintParameters { return lhs.expand(leading: -rhs.leading, trailing: -rhs.trailing, top: rhs.top, bottom: rhs.bottom) }
