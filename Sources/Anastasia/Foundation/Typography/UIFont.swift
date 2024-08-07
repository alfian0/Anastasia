//
//  File.swift
//  
//
//  Created by alfian on 07/08/24.
//

import UIKit
import SwiftUI

public enum FontScale {
  case headline1
  case headline2
  case headline3
  case headline4
  case headline5
  case headline6
  case subtitle1
  case subtitle2
  case body1
  case body2
  case button
  case caption
  case overline
  
  var size: CGFloat {
    switch self {
    case .headline1:
      return UIFontMetrics.default.scaledValue(for: 96)
    case .headline2:
      return UIFontMetrics.default.scaledValue(for: 60)
    case .headline3:
      return UIFontMetrics.default.scaledValue(for: 48)
    case .headline4:
      return UIFontMetrics.default.scaledValue(for: 34)
    case .headline5:
      return UIFontMetrics.default.scaledValue(for: 24)
    case .headline6:
      return UIFontMetrics.default.scaledValue(for: 20)
    case .subtitle1, .body1:
      return UIFontMetrics.default.scaledValue(for: 16)
    case .subtitle2, .body2, .button:
      return UIFontMetrics.default.scaledValue(for: 16)
    case .caption:
      return UIFontMetrics.default.scaledValue(for: 12)
    case .overline:
      return UIFontMetrics.default.scaledValue(for: 10)
    }
  }
}

public extension UIFont {
  struct Anastasia {
    // In the type scale, headlines span from a range of 1 through 6. Headlines are the largest text on the screen, reserved for short, important text or numerals.
    static let headline1 = UIFont.roboto(.light, size: FontScale.headline1.size)  ?? UIFont.systemFont(ofSize: FontScale.headline1.size, weight: .light)
    static let headline2 = UIFont.roboto(.light, size: FontScale.headline2.size)  ?? UIFont.systemFont(ofSize: FontScale.headline2.size, weight: .light)
    static let headline3 = UIFont.roboto(.regular, size: FontScale.headline3.size)  ?? UIFont.systemFont(ofSize: FontScale.headline3.size, weight: .regular)
    static let headline4 = UIFont.roboto(.regular, size: FontScale.headline4.size)  ?? UIFont.systemFont(ofSize: FontScale.headline4.size, weight: .regular)
    static let headline5 = UIFont.roboto(.regular, size: FontScale.headline5.size)  ?? UIFont.systemFont(ofSize: FontScale.headline5.size, weight: .regular)
    static let headline6 = UIFont.roboto(.regular, size: FontScale.headline6.size)  ?? UIFont.systemFont(ofSize: FontScale.headline6.size, weight: .regular)
    
    // Subtitles are smaller than headlines. They are typically reserved for medium-emphasis text that is shorter in length. Serif or sans serif typefaces work well for subtitles.
    static let subtitle1 = UIFont.roboto(.regular, size: FontScale.subtitle1.size) ?? UIFont.systemFont(ofSize: FontScale.subtitle1.size, weight: .regular)
    static let subtitle2 = UIFont.roboto(.medium, size: FontScale.subtitle2.size) ?? UIFont.systemFont(ofSize: FontScale.subtitle1.size, weight: .medium)
    
    // Body text comes in ranges 1-2, and it’s typically used for long-form writing as it works well for small text sizes. For longer sections of text, a serif or sans serif typeface is recommended.
    static let body1 = UIFont.roboto(.regular, size: FontScale.body1.size) ?? UIFont.systemFont(ofSize: FontScale.body1.size, weight: .regular)
    static let body2 = UIFont.roboto(.regular, size: FontScale.body2.size) ?? UIFont.systemFont(ofSize: FontScale.body2.size, weight: .regular)
    
    static let button = UIFont.roboto(.medium, size: FontScale.button.size) ?? UIFont.systemFont(ofSize: FontScale.button.size, weight: .semibold)
    
    // Caption and overline text (text with a line above it) are the smallest font sizes. They are used sparingly to annotate imagery or to introduce a headline.
    static let caption = UIFont.roboto(.regular, size: FontScale.caption.size) ?? UIFont.systemFont(ofSize: FontScale.caption.size, weight: .regular)
    static let overline = UIFont.roboto(.regular, size: FontScale.overline.size) ?? UIFont.systemFont(ofSize: FontScale.overline.size, weight: .regular)
  }
}

extension UIFont {
  public static func roboto(_ font: Roboto, size: CGFloat) -> UIFont? {
    return UIFont(name: font.rawValue, size: size)
  }
}

struct Font_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      VStack(spacing: Spacing.large) {
        VStack {
          HeadlineText(type: .h1, text: "Headline")
          
          HeadlineText(type: .h2, text: "Headline 2")
          
          HeadlineText(type: .h3, text: "Headline 3")
          
          HeadlineText(type: .h4, text: "Headline 4")
          
          HeadlineText(type: .h5, text: "Headline 5")
          
          HeadlineText(type: .h6, text: "Headline 6")
        }
        
        VStack {
          SubtitleText(type: .subtitle1, text: "Subtitle 1")
          
          SubtitleText(type: .subtitle2, text: "Subtitle 2")
        }
        
        VStack {
          BodyText(type: .body1(scale: .small), text: "Body 1")
          
          BodyText(type: .body2(scale: .small), text: "Body 2")
        }
        
        ButtonText(text: "Button")
        
        CaptionText(text: "Caption")
        
        OverlineText(text: "Overline")
      }
    }
    .previewLayout(.sizeThatFits)
  }
}
