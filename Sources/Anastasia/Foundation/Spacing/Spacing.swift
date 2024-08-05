//
//  File.swift
//  
//
//  Created by alfian on 05/08/24.
//

import Foundation

public enum Spacing {
  public static let small: CGFloat = 4
  public static let medium: CGFloat = 8
  public static let large: CGFloat = 16
  public static let extraLarge: CGFloat = 32
}

public extension CGFloat {
  static let small: Self = Spacing.small
  static let medium: Self = Spacing.medium
  static let large: Self = Spacing.large
  static let extraLarge: Self = Spacing.extraLarge
}
