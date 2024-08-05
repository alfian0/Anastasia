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
    
    public static let buttonPrimaryBackground = accentColor
    public static let buttonPrimarySubtleBackground = accentColor.withAlphaComponent(0.5)
    
    public static let buttonSecondaryForeground = primaryTextColor
    public static let buttonSecondaryBackground = surfaceColor
    
    public static let buttonLinkSecondaryForeground = accentColor
    public static let buttonLinkSecondaryBackground = UIColor.white.withAlphaComponent(0.5)
    
    public static let buttonCriticalBackground = errorColor
    public static let buttonCriticalSubtleBackground = errorColor.withAlphaComponent(0.5)
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
