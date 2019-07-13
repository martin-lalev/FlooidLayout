//
//  LayoutConstraintEdgesBuilder.swift
//  FlooidUI
//
//  Created by Martin Lalev on 30.06.19.
//  Copyright © 2019 Martin Lalev. All rights reserved.
//

import Foundation
import UIKit

public struct NSLayoutEdgeConstraints {
    let leading: NSLayoutConstraint
    let trailing: NSLayoutConstraint
    let top: NSLayoutConstraint
    let bottom: NSLayoutConstraint
}

public extension NSLayoutEdges {
    
    @discardableResult
    static func == (lhs: NSLayoutEdges, rhs: EdgesConstraintParametersProvider) -> NSLayoutEdgeConstraints {
        return .init(leading: lhs.leadingAxisAnchor == rhs.leadingProperties, trailing: lhs.trailingAxisAnchor == rhs.trailingProperties, top: lhs.topAxisAnchor == rhs.topProperties, bottom: lhs.bottomAxisAnchor == rhs.bottomProperties)
    }
    
}
