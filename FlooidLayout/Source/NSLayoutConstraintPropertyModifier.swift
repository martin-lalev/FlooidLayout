//
//  NSLayoutConstraintPropertyModifier.swift
//  FlooidUI
//
//  Created by Martin Lalev on 1.07.19.
//  Copyright © 2019 Martin Lalev. All rights reserved.
//

import Foundation
import UIKit


precedencegroup ConstraintPropertyModifierPrecedence {
    lowerThan: ComparisonPrecedence
    higherThan: ConstraintAssignmentPrecedence
    associativity: left
}

infix operator --!: ConstraintPropertyModifierPrecedence

public enum NSLayoutConstraintProperty {
    case priority(UILayoutPriority)
    case identifier(String)
    case activated
}

extension NSLayoutConstraint {
    
    @discardableResult
    public static func --! (lpred: NSLayoutConstraint, rpred: NSLayoutConstraintProperty) -> NSLayoutConstraint {
        switch rpred {
    
        case .priority(let priority):
            lpred.priority = priority
        
        case .identifier(let identifier):
            lpred.identifier = identifier
        
        case .activated:
            lpred.isActive = true
        
        }
        return lpred
    }
}
