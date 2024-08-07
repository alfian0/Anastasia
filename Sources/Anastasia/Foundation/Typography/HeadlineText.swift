//
//  SwiftUIView.swift
//  
//
//  Created by alfian on 07/08/24.
//

import SwiftUI

public struct HeadlineText: View {
  public enum HeadlineType {
    case h1
    case h2
    case h3
    case h4
    case h5
    case h6
    
    var font: Font {
      switch self {
      case .h1:
        return .Anastasia.headline1
      case .h2:
        return .Anastasia.headline2
      case .h3:
        return .Anastasia.headline3
      case .h4:
        return .Anastasia.headline4
      case .h5:
        return .Anastasia.headline5
      case .h6:
        return .Anastasia.headline6
      }
    }
    
    var kerning: CGFloat {
      switch self {
      case .h1:
        return -1.5
      case .h2:
        return -0.5
      case .h3:
        return 0
      case .h4:
        return 0.25
      case .h5:
        return 0
      case .h6:
        return 0.15
      }
    }
  }
  
  let type: HeadlineType
  let text: LocalizedStringKey
  
  public init(type: HeadlineType, text: LocalizedStringKey) {
    self.type = type
    self.text = text
  }
  
  public var body: some View {
    Text(text)
      .font(type.font)
      .kerning(type.kerning)
  }
}

struct HeadlineText_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      HeadlineText(type: .h1, text: "Headline")
      
      HeadlineText(type: .h2, text: "Headline 2")
      
      HeadlineText(type: .h3, text: "Headline 3")
      
      HeadlineText(type: .h4, text: "Headline 4")
      
      HeadlineText(type: .h5, text: "Headline 5")
      
      HeadlineText(type: .h6, text: "Headline 6")
    }
    .previewLayout(.sizeThatFits)
  }
}
