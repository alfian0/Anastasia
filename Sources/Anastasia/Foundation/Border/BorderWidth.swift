//
//  File.swift
//  
//
//  Created by alfian on 05/08/24.
//

import UIKit

public enum BorderWidth {
  public static let hairline: CGFloat = 1.0 / UIScreen.main.scale
  public static let thin: CGFloat = 0.5
  public static let `default`: CGFloat = 1.0
}

public extension CGFloat {
  static let hairline: Self = BorderWidth.hairline
}
