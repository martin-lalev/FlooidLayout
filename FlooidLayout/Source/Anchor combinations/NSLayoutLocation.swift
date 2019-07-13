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
    var leadingTopAnchor: NSLayoutLocation { return .init(xAxisAnchor: self.leadingAnchor, yAxisAnchor: self.topAnchor) }
    var leadingCenterAnchor: NSLayoutLocation { return .init(xAxisAnchor: self.leadingAnchor, yAxisAnchor: self.centerYAnchor) }
    var leadingBottomAnchor: NSLayoutLocation { return .init(xAxisAnchor: self.leadingAnchor, yAxisAnchor: self.bottomAnchor) }
    
    var centerTopAnchor: NSLayoutLocation { return .init(xAxisAnchor: self.centerXAnchor, yAxisAnchor: self.topAnchor) }
    var centerAnchor: NSLayoutLocation { return .init(xAxisAnchor: self.centerXAnchor, yAxisAnchor: self.centerYAnchor) }
    var centerBottomAnchor: NSLayoutLocation { return .init(xAxisAnchor: self.centerXAnchor, yAxisAnchor: self.bottomAnchor) }
    
    var trailingTopAnchor: NSLayoutLocation { return .init(xAxisAnchor: self.trailingAnchor, yAxisAnchor: self.topAnchor) }
    var trailingCenterAnchor: NSLayoutLocation { return .init(xAxisAnchor: self.trailingAnchor, yAxisAnchor: self.centerYAnchor) }
    var trailingBottomAnchor: NSLayoutLocation { return .init(xAxisAnchor: self.trailingAnchor, yAxisAnchor: self.bottomAnchor) }
    
    var leftTopAnchor: NSLayoutLocation { return .init(xAxisAnchor: self.leftAnchor, yAxisAnchor: self.topAnchor) }
    var leftCenterAnchor: NSLayoutLocation { return .init(xAxisAnchor: self.leftAnchor, yAxisAnchor: self.centerYAnchor) }
    var leftBottomAnchor: NSLayoutLocation { return .init(xAxisAnchor: self.leftAnchor, yAxisAnchor: self.bottomAnchor) }
    
    var rightTopAnchor: NSLayoutLocation { return .init(xAxisAnchor: self.rightAnchor, yAxisAnchor: self.topAnchor) }
    var rightCenterAnchor: NSLayoutLocation { return .init(xAxisAnchor: self.rightAnchor, yAxisAnchor: self.centerYAnchor) }
    var rightBottomAnchor: NSLayoutLocation { return .init(xAxisAnchor: self.rightAnchor, yAxisAnchor: self.bottomAnchor) }
}
