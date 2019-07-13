//
//  XAxisConstraintParametersProvider.swift
//  FlooidLayout
//
//  Created by Martin Lalev on 12.07.19.
//  Copyright © 2019 Martin Lalev. All rights reserved.
//

import Foundation
import UIKit


public protocol XAxisConstraintParametersProvider {
    var anchor: NSLayoutXAxisAnchor { get }
    var constant: CGFloat { get }
}

public struct XAxisConstraintParameters: XAxisConstraintParametersProvider {
    public let anchor: NSLayoutXAxisAnchor
    public let constant: CGFloat
}

extension NSLayoutXAxisAnchor: XAxisConstraintParametersProvider {
    public var anchor: NSLayoutXAxisAnchor { return self }
    public var constant: CGFloat { return 0 }
}



extension XAxisConstraintParametersProvider {
    func move(by value: CGFloat) -> XAxisConstraintParameters { return .init(anchor: self.anchor, constant: value) }
}

public func + (lhs: XAxisConstraintParametersProvider, rhs: CGFloat) -> XAxisConstraintParameters { return lhs.move(by: rhs) }
public func - (lhs: XAxisConstraintParametersProvider, rhs: CGFloat) -> XAxisConstraintParameters { return lhs.move(by: -rhs) }
