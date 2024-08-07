//
//  File.swift
//  
//
//  Created by alfian on 07/08/24.
//

import SwiftUI

public struct SubtitleText: View {
  public enum SubtitleType {
    case subtitle1
    case subtitle2
    
    var font: Font {
      switch self {
      case .subtitle1:
        return .Anastasia.subtitle1
      case .subtitle2:
        return .Anastasia.subtitle2
      }
    }
    
    var kerning: CGFloat {
      switch self {
      case .subtitle1:
        return 0.15
      case .subtitle2:
        return 0.1
      }
    }
  }
  
  let type: SubtitleType
  let text: String
  
  public init(type: SubtitleType, text: String) {
    self.type = type
    self.text = text
  }
  
  public var body: some View {
    Text(text)
      .font(type.font)
      .kerning(type.kerning)
  }
}

struct SubtitleText_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      SubtitleText(type: .subtitle1, text: "Subtitle 1")
      
      SubtitleText(type: .subtitle2, text: "Subtitle 2")
    }
    .previewLayout(.sizeThatFits)
  }
}
