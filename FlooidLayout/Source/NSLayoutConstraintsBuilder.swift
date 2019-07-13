//
//  NSLayoutConstraintsBuilder.swift
//  FlooidUI
//
//  Created by Martin Lalev on 1.07.19.
//  Copyright © 2019 Martin Lalev. All rights reserved.
//

import Foundation
import UIKit



// Function builder helper type

public protocol NSLayoutConstraintsAccumulation {
    var asMultipleConstraints: [NSLayoutConstraint] { get }
}

extension NSLayoutConstraint: NSLayoutConstraintsAccumulation {
    public var asMultipleConstraints: [NSLayoutConstraint] { return [self] }
}
extension Array: NSLayoutConstraintsAccumulation where Element: NSLayoutConstraint {
    public var asMultipleConstraints: [NSLayoutConstraint] { return self }
}

extension NSLayoutEdgeConstraints: NSLayoutConstraintsAccumulation {
    public var asMultipleConstraints: [NSLayoutConstraint] { return [self.leading, self.trailing, self.top, self.bottom] }
}
extension NSLayoutSizeConstraints: NSLayoutConstraintsAccumulation {
    public var asMultipleConstraints: [NSLayoutConstraint] { return [self.width, self.height] }
}
extension NSLayoutLocationConstraints: NSLayoutConstraintsAccumulation {
    public var asMultipleConstraints: [NSLayoutConstraint] { return [self.x, self.y] }
}
extension NSLayoutXAxisEdgesConstraints: NSLayoutConstraintsAccumulation {
    public var asMultipleConstraints: [NSLayoutConstraint] { return [self.leading, self.trailing] }
}
extension NSLayoutYAxisEdgesConstraints: NSLayoutConstraintsAccumulation {
    public var asMultipleConstraints: [NSLayoutConstraint] { return [self.top, self.bottom] }
}



// Custom operator

infix operator --|: LogicalDisjunctionPrecedence

extension Array where Element == NSLayoutConstraint {
    
    public static func --| (lpred: [NSLayoutConstraint], rpred: NSLayoutConstraintsAccumulation) -> [NSLayoutConstraint] {
        var result = Array(lpred)
        result.append(contentsOf: rpred.asMultipleConstraints)
        return result
    }
    
}



// Custom operator usage

public extension NSLayoutConstraint {
    
    static func activate(_ constraintsBuilder: ([NSLayoutConstraint]) -> NSLayoutConstraintsAccumulation) {
        NSLayoutConstraint.activate(constraintsBuilder([]).asMultipleConstraints)
    }
    
    static func make(_ constraintsBuilder: ([NSLayoutConstraint]) -> NSLayoutConstraintsAccumulation) -> [NSLayoutConstraint] {
        return constraintsBuilder([]).asMultipleConstraints
    }
    
}

public extension UIView {
    
    func constraints(_ constraintsBuilder: ([NSLayoutConstraint], UIView) -> NSLayoutConstraintsAccumulation) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraintsBuilder([], self).asMultipleConstraints)
    }
    
}

public extension UILayoutGuide {
    
    func constraints(_ constraintsBuilder: ([NSLayoutConstraint], UILayoutGuide) -> NSLayoutConstraintsAccumulation) {
        NSLayoutConstraint.activate(constraintsBuilder([], self).asMultipleConstraints)
    }
    
}
