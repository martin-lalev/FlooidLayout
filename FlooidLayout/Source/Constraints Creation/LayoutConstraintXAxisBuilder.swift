//
//  LayoutConstraintXAxisBuilder.swift
//  FlooidUI
//
//  Created by Martin Lalev on 30.06.19.
//  Copyright © 2019 Martin Lalev. All rights reserved.
//

import Foundation
import UIKit

public extension NSLayoutXAxisAnchor {
    
    @discardableResult
    static func == (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        return lhs.constraint(equalTo: rhs.anchor, constant: rhs.constant)
    }
    
    @discardableResult
    static func <= (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        return lhs.constraint(lessThanOrEqualTo: rhs.anchor, constant: rhs.constant)
    }
    
    @discardableResult
    static func >= (lhs: NSLayoutXAxisAnchor, rhs: NSLayoutXAxisAnchor) -> NSLayoutConstraint {
        return lhs.constraint(greaterThanOrEqualTo: rhs.anchor, constant: rhs.constant)
    }
    
    @discardableResult
    static func == (lhs: NSLayoutXAxisAnchor, rhs: XAxisConstraintParametersProvider) -> NSLayoutConstraint {
        return lhs.constraint(equalTo: rhs.anchor, constant: rhs.constant)
    }
    
    @discardableResult
    static func <= (lhs: NSLayoutXAxisAnchor, rhs: XAxisConstraintParametersProvider) -> NSLayoutConstraint {
        return lhs.constraint(lessThanOrEqualTo: rhs.anchor, constant: rhs.constant)
    }
    
    @discardableResult
    static func >= (lhs: NSLayoutXAxisAnchor, rhs: XAxisConstraintParametersProvider) -> NSLayoutConstraint {
        return lhs.constraint(greaterThanOrEqualTo: rhs.anchor, constant: rhs.constant)
    }
    
}
