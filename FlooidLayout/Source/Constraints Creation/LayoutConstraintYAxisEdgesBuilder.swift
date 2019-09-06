//
//  LayoutConstraintYAxisEdgesBuilder.swift
//  FlooidUI
//
//  Created by Martin Lalev on 30.06.19.
//  Copyright © 2019 Martin Lalev. All rights reserved.
//

import Foundation
import UIKit

public struct NSLayoutYAxisEdgesConstraints {
    public let top: NSLayoutConstraint
    public let bottom: NSLayoutConstraint
}

public extension NSLayoutYAxisEdges {
    
    @discardableResult
    static func == (lhs: NSLayoutYAxisEdges, rhs: YAxisEdgesConstraintParametersProvider) -> NSLayoutYAxisEdgesConstraints {
        return .init(top: lhs.topAxisAnchor == rhs.topProperties, bottom: lhs.bottomAxisAnchor == rhs.bottomProperties)
    }
    
}
