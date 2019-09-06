//
//  LayoutConstraintLocationBuilder.swift
//  FlooidUI
//
//  Created by Martin Lalev on 30.06.19.
//  Copyright © 2019 Martin Lalev. All rights reserved.
//

import Foundation
import UIKit

public struct NSLayoutLocationConstraints {
    public let x: NSLayoutConstraint
    public let y: NSLayoutConstraint
}

public extension NSLayoutLocation {
    
    @discardableResult
    static func == (lhs: NSLayoutLocation, rhs: LocationConstraintParametersProvider) -> NSLayoutLocationConstraints {
        return .init(x: lhs.xAxisAnchor == rhs.xAxisProperties, y: lhs.yAxisAnchor == rhs.yAxisProperties)
    }
    
    @discardableResult
    static func <= (lhs: NSLayoutLocation, rhs: LocationConstraintParametersProvider) -> NSLayoutLocationConstraints {
        return .init(x: lhs.xAxisAnchor <= rhs.xAxisProperties, y: lhs.yAxisAnchor <= rhs.yAxisProperties)
    }
    
    @discardableResult
    static func >= (lhs: NSLayoutLocation, rhs: LocationConstraintParametersProvider) -> NSLayoutLocationConstraints {
        return .init(x: lhs.xAxisAnchor >= rhs.xAxisProperties, y: lhs.yAxisAnchor >= rhs.yAxisProperties)
    }
    
}
