//
//  File.swift
//  
//
//  Created by alfian on 05/08/24.
//

import SwiftUI

public extension Font {
  // MARK: Naming id based on Android Material Design
  struct Anastasia {
    // In the type scale, headlines span from a range of 1 through 6. Headlines are the largest text on the screen, reserved for short, important text or numerals.
    static let headline1 = Font.system(size: UIFontMetrics.default.scaledValue(for: 96), weight: .light)
    static let headline2 = Font.system(size: UIFontMetrics.default.scaledValue(for: 60), weight: .light)
    static let headline3 = Font.system(size: UIFontMetrics.default.scaledValue(for: 48), weight: .regular)
    static let headline4 = Font.system(size: UIFontMetrics.default.scaledValue(for: 34), weight: .regular)
    static let headline5 = Font.system(size: UIFontMetrics.default.scaledValue(for: 24), weight: .regular)
    static let headline6 = Font.system(size: UIFontMetrics.default.scaledValue(for: 20), weight: .regular)
    
    // Subtitles are smaller than headlines. They are typically reserved for medium-emphasis text that is shorter in length. Serif or sans serif typefaces work well for subtitles.
    static let subtitle1 = Font.system(size: UIFontMetrics.default.scaledValue(for: 16), weight: .regular)
    static let subtitle2 = Font.system(size: UIFontMetrics.default.scaledValue(for: 14), weight: .medium)
    
    // Body text comes in ranges 1-2, and it’s typically used for long-form writing as it works well for small text sizes. For longer sections of text, a serif or sans serif typeface is recommended.
    static let body1 = Font.system(size: UIFontMetrics.default.scaledValue(for: 16), weight: .regular)
    static let body2 = Font.system(size: UIFontMetrics.default.scaledValue(for: 14), weight: .regular)
    
    static let button = Font.system(size: UIFontMetrics.default.scaledValue(for: 14), weight: .semibold)
    
    // Caption and overline text (text with a line above it) are the smallest font sizes. They are used sparingly to annotate imagery or to introduce a headline.
    static let caption = Font.system(size: UIFontMetrics.default.scaledValue(for: 12), weight: .regular)
    static let overline = Font.system(size: UIFontMetrics.default.scaledValue(for: 10), weight: .regular)
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
          BodyText(type: .body1, text: "Body 1")
          
          BodyText(type: .body2, text: "Body 2")
        }
        
        ButtonText(text: "Button")
        
        CaptionText(text: "Caption")
        
        OverlineText(text: "Overline")
      }
    }
    .previewLayout(.sizeThatFits)
  }
}

struct Headline_Previews: PreviewProvider {
  static var previews: some View {
    VStack(spacing: Spacing.medium) {
      ZStack {
        Color.Anastasia.primaryColor
        
        HStack {
          HeadlineText(type: .h6, text: "Headline 6")
          
          Spacer()
          
          Button {
            
          } label: {
            Image(systemName: "magnifyingglass")
              .foregroundColor(.Anastasia.primaryTextColor)
          }
        }
        .padding()
        .padding(.top, 32)
      }
      .frame(height: 88)
      
      Image(systemName: "photo")
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .background(Color.Anastasia.surfaceColor)
      
      VStack(alignment: .leading, spacing: Spacing.large) {
        VStack(alignment: .leading, spacing: 0) {
          OverlineText(text: "US - Politics")
          
          HeadlineText(type: .h2, text: "Spring Styles")
        }
        
        BodyText(type: .body1, text: "In publishing and graphic design, Lorem ipsum (/ˌlɔː.rəm ˈɪp.səm/) is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available. It is also used to temporarily replace text in a process called greeking, which allows designers to consider the form of a webpage or publication, without the meaning of the text influencing the design.")
        
        Button {

        } label: {
          Text("Login".uppercased())
            .font(.Anastasia.button)
            .frame(maxWidth: .infinity, maxHeight: 32)
        }
        .buttonStyle(.anastasiaPrimary)
      }
      .padding(.horizontal, Spacing.large)
      
      VStack(alignment: .leading) {
        HeadlineText(type: .h5, text: "Headline 5")
          .padding(.horizontal, Spacing.large)
        
        List {
          HStack(alignment: .top, spacing: Spacing.large) {
            VStack {
              Image(systemName: "photo")
                .frame(width: 100, height: 100)
                .background(Color.Anastasia.surfaceColor)
              
              CaptionText(text: "Caption")
            }
            
            VStack(alignment: .leading) {
              OverlineText(text: "Overline")
              
              HeadlineText(type: .h5, text: "Headline 5")
              
              BodyText(type: .body2, text: "Body 2")
              
              HStack {
                Stepper {
                  SubtitleText(type: .subtitle1, text: "Subtitle 1")
                } onIncrement: {
                  
                } onDecrement: {
                  
                } onEditingChanged: { _ in
                  
                }
              }
            }
          }
          
          HStack(alignment: .top, spacing: Spacing.large) {
            VStack {
              Image(systemName: "photo")
                .frame(width: 100, height: 100)
                .background(Color.Anastasia.surfaceColor)
              
              CaptionText(text: "Caption")
            }
            
            VStack(alignment: .leading) {
              OverlineText(text: "Overline")
              
              HeadlineText(type: .h5, text: "Headline 5")
              
              BodyText(type: .body2, text: "Body 2")
              
              HStack {
                Stepper {
                  SubtitleText(type: .subtitle1, text: "Subtitle 1")
                } onIncrement: {
                  
                } onDecrement: {
                  
                } onEditingChanged: { _ in
                  
                }
              }
            }
          }
        }
        .listStyle(.plain)
      }
    }
    .frame(maxWidth: .infinity)
    .previewLayout(.sizeThatFits)
  }
}
