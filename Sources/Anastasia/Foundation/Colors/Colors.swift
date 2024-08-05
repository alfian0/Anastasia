//
//  File.swift
//  
//
//  Created by alfian on 05/08/24.
//

import SwiftUI

public extension Color {
  struct Anastasia {
    // ColorPrimary
    static let primaryColor = Color("primaryColor", bundle: .module)
    // ColorPrimaryDark
    static let primaryDarkColor = Color("primaryDarkColor", bundle: .module)
    // ColorAccent
    static let accentColor = Color("accentColor", bundle: .module)
    // TextColorPrimary
    static let primaryTextColor = Color(.label)
    // TextColorSecondary
    static let secondaryTextColor = Color(.secondaryLabel)
    // ColorBackground
    static let backgroundColor = Color("backgroundColor", bundle: .module)
    // ColorSurface
    static let surfaceColor = Color(UIColor.systemGroupedBackground)
    // ColorError
    static let errorColor = Color(.systemRed)
    
    public static let buttonPrimaryBackground = accentColor
    public static let buttonPrimarySubtleBackground = accentColor.opacity(0.5)
    
    public static let buttonSecondaryForeground = primaryTextColor
    public static let buttonSecondaryBackground = surfaceColor
    
    public static let buttonLinkSecondaryForeground = accentColor
    public static let buttonLinkSecondaryBackground = Color.white.opacity(0)
    
    public static let buttonCriticalBackground = errorColor
    public static let buttonCriticalSubtleBackground = errorColor.opacity(0.5)
  }
}
