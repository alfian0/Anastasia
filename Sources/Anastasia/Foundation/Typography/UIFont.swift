//
//  File.swift
//  
//
//  Created by alfian on 07/08/24.
//

import UIKit
import SwiftUI

public extension UIFont {
  struct Anastasia {
    // In the type scale, headlines span from a range of 1 through 6. Headlines are the largest text on the screen, reserved for short, important text or numerals.
    static let headline1 = UIFont.systemFont(ofSize: UIFontMetrics.default.scaledValue(for: 96), weight: .light)
    static let headline2 = UIFont.systemFont(ofSize: UIFontMetrics.default.scaledValue(for: 60), weight: .light)
    static let headline3 = UIFont.systemFont(ofSize: UIFontMetrics.default.scaledValue(for: 48), weight: .regular)
    static let headline4 = UIFont.systemFont(ofSize: UIFontMetrics.default.scaledValue(for: 34), weight: .regular)
    static let headline5 = UIFont.systemFont(ofSize: UIFontMetrics.default.scaledValue(for: 24), weight: .regular)
    static let headline6 = UIFont.systemFont(ofSize: UIFontMetrics.default.scaledValue(for: 20), weight: .regular)
    
    // Subtitles are smaller than headlines. They are typically reserved for medium-emphasis text that is shorter in length. Serif or sans serif typefaces work well for subtitles.
    static let subtitle1 = UIFont.systemFont(ofSize: UIFontMetrics.default.scaledValue(for: 16), weight: .regular)
    static let subtitle2 = UIFont.systemFont(ofSize: UIFontMetrics.default.scaledValue(for: 14), weight: .medium)
    
    // Body text comes in ranges 1-2, and it’s typically used for long-form writing as it works well for small text sizes. For longer sections of text, a serif or sans serif typeface is recommended.
    static let body1 = UIFont.systemFont(ofSize: UIFontMetrics.default.scaledValue(for: 16), weight: .regular)
    static let body2 = UIFont.systemFont(ofSize: UIFontMetrics.default.scaledValue(for: 14), weight: .regular)
    
    static let button = UIFont.systemFont(ofSize: UIFontMetrics.default.scaledValue(for: 14), weight: .semibold)
    
    // Caption and overline text (text with a line above it) are the smallest font sizes. They are used sparingly to annotate imagery or to introduce a headline.
    static let caption = UIFont.systemFont(ofSize: UIFontMetrics.default.scaledValue(for: 12), weight: .regular)
    static let overline = UIFont.systemFont(ofSize: UIFontMetrics.default.scaledValue(for: 10), weight: .regular)
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
        
        ButtonText(text: "Button".uppercased())
        
        CaptionText(text: "Caption")
        
        OverlineText(text: "Overline")
      }
    }
    .previewLayout(.sizeThatFits)
  }
}
