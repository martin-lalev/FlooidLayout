//
//  DimensionConstraintParametersProvider.swift
//  FlooidLayout
//
//  Created by Martin Lalev on 12.07.19.
//  Copyright © 2019 Martin Lalev. All rights reserved.
//

import Foundation
import UIKit


@MainActor
public protocol DimensionConstraintParametersProvider {
    var anchor: NSLayoutDimension { get }
    var constant: CGFloat { get }
    var multiplyer: CGFloat { get }
}

public struct DimensionConstraintParameters: DimensionConstraintParametersProvider {
    public let anchor: NSLayoutDimension
    public let constant: CGFloat
    public let multiplyer: CGFloat
}

extension NSLayoutDimension: DimensionConstraintParametersProvider {
    public var anchor: NSLayoutDimension { return self }
    public var constant: CGFloat { return 0 }
    public var multiplyer: CGFloat { return 1 }
}



infix operator ++: AdditionPrecedence
infix operator --: AdditionPrecedence

extension DimensionConstraintParametersProvider {
    func expand(by value: CGFloat) -> DimensionConstraintParameters { return .init(anchor: self.anchor, constant: value, multiplyer: self.multiplyer) }
    func scale(by value: CGFloat) -> DimensionConstraintParameters { return .init(anchor: self.anchor, constant: self.constant, multiplyer: value) }
}

@MainActor
public func + (lhs: DimensionConstraintParametersProvider, rhs: CGFloat) -> DimensionConstraintParameters { return lhs.expand(by: rhs) }
@MainActor
public func ++ (lhs: DimensionConstraintParametersProvider, rhs: CGFloat) -> DimensionConstraintParameters { return lhs.expand(by: 2*rhs) }
@MainActor
public func - (lhs: DimensionConstraintParametersProvider, rhs: CGFloat) -> DimensionConstraintParameters { return lhs.expand(by: -rhs) }
@MainActor
public func -- (lhs: DimensionConstraintParametersProvider, rhs: CGFloat) -> DimensionConstraintParameters { return lhs.expand(by: -2*rhs) }
@MainActor
public func * (lhs: DimensionConstraintParametersProvider, rhs: CGFloat) -> DimensionConstraintParameters { return lhs.scale(by: rhs) }
