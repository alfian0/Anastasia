//
//  File.swift
//  
//
//  Created by alfian on 07/08/24.
//

import SwiftUI

public struct CaptionText: View {
  let text: String
  
  public init(text: String) {
    self.text = text
  }
  
  public var body: some View {
    Text(text)
      .font(.Anastasia.caption)
      .kerning(0.4)
  }
}

struct CaptionText_Previews: PreviewProvider {
  static var previews: some View {
    CaptionText(text: "Caption")
      .previewLayout(.sizeThatFits)
  }
}
