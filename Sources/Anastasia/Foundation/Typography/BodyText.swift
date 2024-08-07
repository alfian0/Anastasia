//
//  File.swift
//  
//
//  Created by alfian on 07/08/24.
//

import SwiftUI

public struct BodyText: View {
  public enum BodyType {
    case body1
    case body2
    
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
  }
}

struct BodyText_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      BodyText(type: .body1, text: "Body 1")
      
      BodyText(type: .body2, text: "Body 2")
    }
    .previewLayout(.sizeThatFits)
  }
}
