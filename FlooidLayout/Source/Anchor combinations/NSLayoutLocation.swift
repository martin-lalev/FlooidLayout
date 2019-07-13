//
//  NSLayoutLocation.swift
//  FlooidUI
//
//  Created by Martin Lalev on 1.07.19.
//  Copyright © 2019 Martin Lalev. All rights reserved.
//

import Foundation
import UIKit

public struct NSLayoutLocation {
    let xAxisAnchor: NSLayoutXAxisAnchor
    let yAxisAnchor: NSLayoutYAxisAnchor
}


public protocol LayoutLocationProvider {
    var centerXAnchor: NSLayoutXAxisAnchor { get }
    var leadingAnchor: NSLayoutXAxisAnchor { get }
    var trailingAnchor: NSLayoutXAxisAnchor { get }
    var leftAnchor: NSLayoutXAxisAnchor { get }
    var rightAnchor: NSLayoutXAxisAnchor { get }
    var centerYAnchor: NSLayoutYAxisAnchor { get }
    var topAnchor: NSLayoutYAxisAnchor { get }
    var bottomAnchor: NSLayoutYAxisAnchor { get }
}
extension UIView: LayoutLocationProvider {}
extension UILayoutGuide: LayoutLocationProvider {}

public extension LayoutLocationProvider {
    var leadingTopAnchor: NSLayoutLocation { .init(xAxisAnchor: self.leadingAnchor, yAxisAnchor: self.topAnchor) }
    var leadingCenterAnchor: NSLayoutLocation { .init(xAxisAnchor: self.leadingAnchor, yAxisAnchor: self.centerYAnchor) }
    var leadingBottomAnchor: NSLayoutLocation { .init(xAxisAnchor: self.leadingAnchor, yAxisAnchor: self.bottomAnchor) }
    
    var centerTopAnchor: NSLayoutLocation { .init(xAxisAnchor: self.centerXAnchor, yAxisAnchor: self.topAnchor) }
    var centerAnchor: NSLayoutLocation { .init(xAxisAnchor: self.centerXAnchor, yAxisAnchor: self.centerYAnchor) }
    var centerBottomAnchor: NSLayoutLocation { .init(xAxisAnchor: self.centerXAnchor, yAxisAnchor: self.bottomAnchor) }
    
    var trailingTopAnchor: NSLayoutLocation { .init(xAxisAnchor: self.trailingAnchor, yAxisAnchor: self.topAnchor) }
    var trailingCenterAnchor: NSLayoutLocation { .init(xAxisAnchor: self.trailingAnchor, yAxisAnchor: self.centerYAnchor) }
    var trailingBottomAnchor: NSLayoutLocation { .init(xAxisAnchor: self.trailingAnchor, yAxisAnchor: self.bottomAnchor) }
    
    var leftTopAnchor: NSLayoutLocation { .init(xAxisAnchor: self.leftAnchor, yAxisAnchor: self.topAnchor) }
    var leftCenterAnchor: NSLayoutLocation { .init(xAxisAnchor: self.leftAnchor, yAxisAnchor: self.centerYAnchor) }
    var leftBottomAnchor: NSLayoutLocation { .init(xAxisAnchor: self.leftAnchor, yAxisAnchor: self.bottomAnchor) }
    
    var rightTopAnchor: NSLayoutLocation { .init(xAxisAnchor: self.rightAnchor, yAxisAnchor: self.topAnchor) }
    var rightCenterAnchor: NSLayoutLocation { .init(xAxisAnchor: self.rightAnchor, yAxisAnchor: self.centerYAnchor) }
    var rightBottomAnchor: NSLayoutLocation { .init(xAxisAnchor: self.rightAnchor, yAxisAnchor: self.bottomAnchor) }
}
