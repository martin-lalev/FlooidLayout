//
//  LayoutConstraintSizeBuilder.swift
//  FlooidUI
//
//  Created by Martin Lalev on 30.06.19.
//  Copyright © 2019 Martin Lalev. All rights reserved.
//

import Foundation
import UIKit

public struct NSLayoutSizeConstraints {
    public let width: NSLayoutConstraint
    public let height: NSLayoutConstraint
}

public extension NSLayoutSize {
    
    @discardableResult
    static func == (lhs: NSLayoutSize, rhs: NSLayoutSize) -> NSLayoutSizeConstraints {
        return .init(width: lhs.widthAnchor == rhs.widthProperties, height: lhs.heightAnchor == rhs.heightProperties)
    }
    
    @discardableResult
    static func <= (lhs: NSLayoutSize, rhs: NSLayoutSize) -> NSLayoutSizeConstraints {
        return .init(width: lhs.widthAnchor <= rhs.widthProperties, height: lhs.heightAnchor <= rhs.heightProperties)
    }
    
    @discardableResult
    static func >= (lhs: NSLayoutSize, rhs: NSLayoutSize) -> NSLayoutSizeConstraints {
        return .init(width: lhs.widthAnchor >= rhs.widthProperties, height: lhs.heightAnchor >= rhs.heightProperties)
    }
    
    @discardableResult
    static func == (lhs: NSLayoutSize, rhs: SizeConstraintParametersProvider) -> NSLayoutSizeConstraints {
        return .init(width: lhs.widthAnchor == rhs.widthProperties, height: lhs.heightAnchor == rhs.heightProperties)
    }
    
    @discardableResult
    static func <= (lhs: NSLayoutSize, rhs: SizeConstraintParametersProvider) -> NSLayoutSizeConstraints {
        return .init(width: lhs.widthAnchor <= rhs.widthProperties, height: lhs.heightAnchor <= rhs.heightProperties)
    }
    
    @discardableResult
    static func >= (lhs: NSLayoutSize, rhs: SizeConstraintParametersProvider) -> NSLayoutSizeConstraints {
        return .init(width: lhs.widthAnchor >= rhs.widthProperties, height: lhs.heightAnchor >= rhs.heightProperties)
    }
    
    @discardableResult
    static func == (lhs: NSLayoutSize, rhs: CGSize) -> NSLayoutSizeConstraints {
        return .init(width: lhs.widthAnchor == rhs.width, height: lhs.heightAnchor == rhs.height)
    }
    
    @discardableResult
    static func <= (lhs: NSLayoutSize, rhs: CGSize) -> NSLayoutSizeConstraints {
        return .init(width: lhs.widthAnchor <= rhs.width, height: lhs.heightAnchor <= rhs.height)
    }
    
    @discardableResult
    static func >= (lhs: NSLayoutSize, rhs: CGSize) -> NSLayoutSizeConstraints {
        return .init(width: lhs.widthAnchor >= rhs.width, height: lhs.heightAnchor >= rhs.height)
    }
    
}
