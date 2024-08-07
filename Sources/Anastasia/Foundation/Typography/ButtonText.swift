//
//  File.swift
//  
//
//  Created by alfian on 07/08/24.
//

import SwiftUI

public struct ButtonText: View {
  let text: String
  
  public init(text: String) {
    self.text = text
  }
  
  public var body: some View {
    Text(text)
      .font(.Anastasia.button)
      .kerning(1.25)
  }
}

struct ButtonText_Previews: PreviewProvider {
  static var previews: some View {
    ButtonText(text: "Button")
      .previewLayout(.sizeThatFits)
  }
}
