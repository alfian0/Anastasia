//
//  File.swift
//  
//
//  Created by alfian on 07/08/24.
//

import SwiftUI

public struct OverlineText: View {
  let text: LocalizedStringKey
  
  public init(text: LocalizedStringKey) {
    self.text = text
  }
  
  public var body: some View {
    Text(text)
      .font(.Anastasia.overline)
      .kerning(1.5)
  }
}

struct OverlineText_Previews: PreviewProvider {
  static var previews: some View {
    OverlineText(text: "Caption")
      .previewLayout(.sizeThatFits)
  }
}
