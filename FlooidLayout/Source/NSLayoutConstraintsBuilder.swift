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

@MainActor
public protocol NSLayoutConstraintsAccumulation {
    var asMultipleConstraints: [NSLayoutConstraint] { get }
}

extension NSLayoutConstraint: NSLayoutConstraintsAccumulation {
    public var asMultipleConstraints: [NSLayoutConstraint] { [self] }
}
extension Array: NSLayoutConstraintsAccumulation where Element: NSLayoutConstraint {
    public var asMultipleConstraints: [NSLayoutConstraint] { self }
}

extension NSLayoutEdgeConstraints: NSLayoutConstraintsAccumulation {
    public var asMultipleConstraints: [NSLayoutConstraint] { [self.leading, self.trailing, self.top, self.bottom] }
}
extension NSLayoutSizeConstraints: NSLayoutConstraintsAccumulation {
    public var asMultipleConstraints: [NSLayoutConstraint] { [self.width, self.height] }
}
extension NSLayoutLocationConstraints: NSLayoutConstraintsAccumulation {
    public var asMultipleConstraints: [NSLayoutConstraint] { [self.x, self.y] }
}
extension NSLayoutXAxisEdgesConstraints: NSLayoutConstraintsAccumulation {
    public var asMultipleConstraints: [NSLayoutConstraint] { [self.leading, self.trailing] }
}
extension NSLayoutYAxisEdgesConstraints: NSLayoutConstraintsAccumulation {
    public var asMultipleConstraints: [NSLayoutConstraint] { [self.top, self.bottom] }
}



// Function builder

@MainActor
@resultBuilder
public struct NSLayoutConstraintsBuilder {
    
    public static func buildBlock(_ components: NSLayoutConstraintsAccumulation ...) -> NSLayoutConstraintsAccumulation {
        return components.flatMap { $0.asMultipleConstraints }
    }
    
    public static func buildIf(_ component: NSLayoutConstraintsAccumulation?) -> NSLayoutConstraintsAccumulation {
        return component ?? [NSLayoutConstraint]()
    }
    
    public static func buildEither(first: NSLayoutConstraintsAccumulation) -> NSLayoutConstraintsAccumulation {
        return first
    }
    
    public static func buildEither(second: NSLayoutConstraintsAccumulation) -> NSLayoutConstraintsAccumulation {
        return second
    }
    
}



// Function builder usage

public extension NSLayoutConstraint {
    
    static func activate(@NSLayoutConstraintsBuilder constraintsBuilder: () -> NSLayoutConstraintsAccumulation) {
        NSLayoutConstraint.activate(constraintsBuilder().asMultipleConstraints)
    }
    
    static func make(@NSLayoutConstraintsBuilder constraintsBuilder: () -> NSLayoutConstraintsAccumulation) -> [NSLayoutConstraint] {
        return constraintsBuilder().asMultipleConstraints
    }
    
}

public extension UIView {
    
    func constraints(@NSLayoutConstraintsBuilder constraintsBuilder: (UIView) -> NSLayoutConstraintsAccumulation) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraintsBuilder(self).asMultipleConstraints)
    }
    
}

public extension UILayoutGuide {
    
    func constraints(@NSLayoutConstraintsBuilder constraintsBuilder: (UILayoutGuide) -> NSLayoutConstraintsAccumulation) {
        NSLayoutConstraint.activate(constraintsBuilder(self).asMultipleConstraints)
    }
    
}
