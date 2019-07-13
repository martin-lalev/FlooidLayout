//
//  NSLayoutYAxisEdges.swift
//  FlooidUI
//
//  Created by Martin Lalev on 1.07.19.
//  Copyright © 2019 Martin Lalev. All rights reserved.
//

import Foundation
import UIKit

public struct NSLayoutYAxisEdges {
    let topAxisAnchor: NSLayoutYAxisAnchor
    let bottomAxisAnchor: NSLayoutYAxisAnchor
}


public protocol LayoutYAxisEdgesProvider {
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
}
extension UIView: LayoutYAxisEdgesProvider {}
extension UILayoutGuide: LayoutYAxisEdgesProvider {}

public extension LayoutYAxisEdgesProvider {
    var verticalEdgesAnchor: NSLayoutYAxisEdges { .init(topAxisAnchor: self.topAnchor, bottomAxisAnchor: self.bottomAnchor) }
}
