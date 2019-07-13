//
//  NSLayoutConstraintAssignment.swift
//  FlooidUI
//
//  Created by Martin Lalev on 30.06.19.
//  Copyright © 2019 Martin Lalev. All rights reserved.
//

import Foundation
import UIKit


precedencegroup ConstraintAssignmentPrecedence {
    lowerThan: ComparisonPrecedence
    higherThan: LogicalConjunctionPrecedence
    associativity: left
}

infix operator -->: ConstraintAssignmentPrecedence

extension NSLayoutConstraint {
    
    @discardableResult
    public static func --> (lpred: NSLayoutConstraint, rpred: inout NSLayoutConstraint) -> NSLayoutConstraint {
        rpred = lpred
        return lpred
    }
    
    @discardableResult
    public static func --> (lpred: NSLayoutConstraint, rpred: inout NSLayoutConstraint?) -> NSLayoutConstraint {
        rpred = lpred
        return lpred
    }
    
}
