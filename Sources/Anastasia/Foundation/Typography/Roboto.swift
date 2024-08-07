//
//  File.swift
//  
//
//  Created by alfian on 07/08/24.
//

import SwiftUI

public enum Roboto: String, CaseIterable {
  case thin = "Roboto-Thin"
  case bold = "Roboto-Bold"
  case light = "Roboto-Light"
  case black = "Roboto-Black"
  case medium = "Roboto-Medium"
  case regular = "Roboto-Regular"
}

public struct RobotoFont {
  public static func registerFonts() {
    Roboto.allCases.forEach {
      registerFont(bundle: .module, fontName: $0.rawValue, fontExtension: "ttf")
    }
  }

  fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
    guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
          let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
          let font = CGFont(fontDataProvider) else {
      fatalError("Couldn't ceate font from filename: \(fontName) with extension \(fontExtension)")
    }
    var error: Unmanaged<CFError>?
    CTFontManagerRegisterGraphicsFont(font, &error)
  }
}
