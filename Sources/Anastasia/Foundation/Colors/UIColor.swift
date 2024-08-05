//
//  File.swift
//  
//
//  Created by alfian on 05/08/24.
//

import UIKit

public extension UIColor {
  struct Anastasia {
    static let primaryColor = fromResource(named: "primaryColor")
    static let primaryDarkColor = fromResource(named: "primaryDarkColor")
    static let accentColor = fromResource(named: "accentColor")
    static let primaryTextColor = UIColor.label
    static let secondaryTextColor = UIColor.secondaryLabel
    static let backgroundColor = fromResource(named: "backgroundColor")
    static let surfaceColor = UIColor.systemBackground
    static let errorColor = UIColor.systemRed
  }
}

extension UIColor {
  static func fromResource(named: String) -> UIColor {
    guard let color = UIColor(named: named, in: .module, compatibleWith: nil) else {
        preconditionFailure("Cannot find color definition for '\(named)' in bundle")
    }

    return color
  }
}
