//
//  File.swift
//  
//
//  Created by alfian on 05/08/24.
//

import SwiftUI

public struct CheckboxToggleStyle: ToggleStyle {
  public func makeBody(configuration: Configuration) -> some View {
    Button(action: {
      configuration.isOn.toggle()
    }, label: {
      HStack {
        Image(systemName: configuration.isOn ? "checkmark.square" : "square")
          .foregroundColor(.Anastasia.accentColor)
        configuration.label
      }
    })
  }
}

extension ToggleStyle where Self == CheckboxToggleStyle {
  public static var anastasiaPrimary: Self { Self() }
}

struct Checkbox_Previews: PreviewProvider {
    static var previews: some View {
      VStack {
        Toggle(isOn: .constant(false)) {
          Text("I agree to the term and condition")
            .font(.Anastasia.caption)
            .foregroundColor(.Anastasia.secondaryTextColor)
        }
        .toggleStyle(.anastasiaPrimary)
        Toggle(isOn: .constant(true)) {
          Text("I agree to the term and condition")
            .font(.Anastasia.caption)
            .foregroundColor(.Anastasia.secondaryTextColor)
        }
        .toggleStyle(.anastasiaPrimary)
      }
      .previewLayout(.sizeThatFits)
    }
}
