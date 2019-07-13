//
//  LayoutConstraintDimensionBuilder.swift
//  FlooidUI
//
//  Created by Martin Lalev on 30.06.19.
//  Copyright © 2019 Martin Lalev. All rights reserved.
//

import Foundation
import UIKit

public extension NSLayoutDimension {
    
    @discardableResult
    static func == (lhs: NSLayoutDimension, rhs: DimensionConstraintParametersProvider) -> NSLayoutConstraint {
        return lhs.constraint(equalTo: rhs.anchor, multiplier: rhs.multiplyer, constant: rhs.constant)
    }
    
    @discardableResult
    static func <= (lhs: NSLayoutDimension, rhs: DimensionConstraintParametersProvider) -> NSLayoutConstraint {
        return lhs.constraint(lessThanOrEqualTo: rhs.anchor, multiplier: rhs.multiplyer, constant: rhs.constant)
    }
    
    @discardableResult
    static func >= (lhs: NSLayoutDimension, rhs: DimensionConstraintParametersProvider) -> NSLayoutConstraint {
        return lhs.constraint(greaterThanOrEqualTo: rhs.anchor, multiplier: rhs.multiplyer, constant: rhs.constant)
    }
    
    @discardableResult
    static func == (lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
        return lhs.constraint(equalToConstant: rhs)
    }
    
    @discardableResult
    static func <= (lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
        return lhs.constraint(lessThanOrEqualToConstant: rhs)
    }
    
    @discardableResult
    static func >= (lhs: NSLayoutDimension, rhs: CGFloat) -> NSLayoutConstraint {
        return lhs.constraint(greaterThanOrEqualToConstant: rhs)
    }
    
}
