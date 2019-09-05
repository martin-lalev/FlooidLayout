//
//  LayoutConstraintXAxisEdgesBuilder.swift
//  FlooidUI
//
//  Created by Martin Lalev on 30.06.19.
//  Copyright © 2019 Martin Lalev. All rights reserved.
//

import Foundation
import UIKit

public struct NSLayoutXAxisEdgesConstraints {
    public let leading: NSLayoutConstraint
    public let trailing: NSLayoutConstraint
}

public extension NSLayoutXAxisEdges {
    
    @discardableResult
    static func == (lhs: NSLayoutXAxisEdges, rhs: XAxisEdgesConstraintParametersProvider) -> NSLayoutXAxisEdgesConstraints {
        return .init(leading: lhs.leadingAxisAnchor == rhs.leadingProperties, trailing: lhs.trailingAxisAnchor == rhs.trailingProperties)
    }
    
}
