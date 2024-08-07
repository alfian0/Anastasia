//
//  File.swift
//  
//
//  Created by alfian on 07/08/24.
//

import SwiftUI

public enum LineHeightScale: CGFloat {
  case small = 1.2
  case large = 1.6
}

public struct BodyText: View {
  public enum BodyType {
    case body1(scale: LineHeightScale)
    case body2(scale: LineHeightScale)
    
    var font: Font {
      switch self {
      case .body1:
        return .Anastasia.body1
      case .body2:
        return .Anastasia.body2
      }
    }
    
    var kerning: CGFloat {
      switch self {
      case .body1:
        return 0.5
      case .body2:
        return 0.25
      }
    }
    
    var lineSpacing: CGFloat {
      switch self {
      case .body1(let scale):
        return ((16*scale.rawValue)-16)/2
      case .body2(let scale):
        return ((14*scale.rawValue)-14)/2
      }
    }
  }
  
  let type: BodyType
  let text: String
  
  public init(type: BodyType, text: String) {
    self.type = type
    self.text = text
  }
  
  public var body: some View {
    Text(text)
      .font(type.font)
      .kerning(type.kerning)
      .lineSpacing(type.lineSpacing)
  }
}

struct BodyText_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      BodyText(type: .body1(scale: .small), text: "Body 1")
      
      BodyText(type: .body2(scale: .small), text: "Body 2")
    }
    .previewLayout(.sizeThatFits)
  }
}
