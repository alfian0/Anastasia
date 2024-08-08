//
//  File.swift
//  
//
//  Created by alfian on 05/08/24.
//

import UIKit

public extension UIColor {
  struct Anastasia {
    private static let primaryColor = fromResource(named: "primaryColor")
    private static let colorOnPrimary = fromResource(named: "colorOnPrimary")
    private static let primaryDarkColor = fromResource(named: "primaryDarkColor")
    private static let accentColor = fromResource(named: "accentColor")
    private static let primaryTextColor = UIColor.label
    private static let secondaryTextColor = UIColor.secondaryLabel
    private static let backgroundColor = fromResource(named: "backgroundColor")
    private static let surfaceColor = UIColor.systemGray6
    private static let errorColor = UIColor.systemRed
    
    public static let buttonPrimaryBackground = accentColor
    public static let buttonPrimarySubtleBackground = accentColor.withAlphaComponent(0.5)
    
    public static let buttonSecondaryForeground = primaryTextColor
    public static let buttonSecondaryBackground = surfaceColor
    
    public static let buttonLinkSecondaryForeground = accentColor
    public static let buttonLinkSecondaryBackground = UIColor.white.withAlphaComponent(0.5)
    
    public static let buttonCriticalBackground = errorColor
    public static let buttonCriticalSubtleBackground = errorColor.withAlphaComponent(0.5)
    
    public static let navBarPrimaryBackground = primaryColor
    public static let navBarPrimaryForeground = colorOnPrimary
    
    public static let imagePrimaryBackground = surfaceColor
    
    public static let togglePrimaryBackground = accentColor
    
    public static let textPrimaryForeground = primaryTextColor
    public static let textSecondaryForeground = secondaryTextColor
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
