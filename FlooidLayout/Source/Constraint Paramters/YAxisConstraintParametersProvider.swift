//
//  YAxisConstraintParametersProvider.swift
//  FlooidLayout
//
//  Created by Martin Lalev on 12.07.19.
//  Copyright © 2019 Martin Lalev. All rights reserved.
//

import Foundation
import UIKit


public protocol YAxisConstraintParametersProvider {
    var anchor: NSLayoutYAxisAnchor { get }
    var constant: CGFloat { get }
}

public struct YAxisConstraintParameters: YAxisConstraintParametersProvider {
    public let anchor: NSLayoutYAxisAnchor
    public let constant: CGFloat
}

extension NSLayoutYAxisAnchor: YAxisConstraintParametersProvider {
    public var anchor: NSLayoutYAxisAnchor { return self }
    public var constant: CGFloat { return 0 }
}



extension YAxisConstraintParametersProvider {
    func move(by value: CGFloat) -> YAxisConstraintParameters { return .init(anchor: self.anchor, constant: value) }
}

public func + (lhs: YAxisConstraintParametersProvider, rhs: CGFloat) -> YAxisConstraintParameters { return lhs.move(by: rhs) }
public func - (lhs: YAxisConstraintParametersProvider, rhs: CGFloat) -> YAxisConstraintParameters { return lhs.move(by: -rhs) }
