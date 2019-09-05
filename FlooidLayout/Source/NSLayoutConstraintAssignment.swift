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

public protocol InlineAssignable {}

extension InlineAssignable {
    
    @discardableResult
    public static func --> (lpred: Self, rpred: inout Self) -> Self {
        rpred = lpred
        return lpred
    }
    
    @discardableResult
    public static func --> (lpred: Self, rpred: inout Self?) -> Self {
        rpred = lpred
        return lpred
    }
    
}

extension NSLayoutConstraint: InlineAssignable {}
extension NSLayoutSizeConstraints: InlineAssignable {}
extension NSLayoutLocationConstraints: InlineAssignable {}
extension NSLayoutEdgeConstraints: InlineAssignable {}
extension NSLayoutXAxisEdgesConstraints: InlineAssignable {}
extension NSLayoutYAxisEdgesConstraints: InlineAssignable {}
