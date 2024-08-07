//
//  File.swift
//  
//
//  Created by alfian on 05/08/24.
//

import SwiftUI

public struct AnastasiaToggleStyle: ToggleStyle {
  private let isOnImage: String
  private let isOffImage: String
  
  init(
    isOnImage: String = "checkmark.square",
    isOffImage: String = "square"
  ) {
    self.isOnImage = isOnImage
    self.isOffImage = isOffImage
  }
  
  public func makeBody(configuration: Configuration) -> some View {
    Button(action: {
      configuration.isOn.toggle()
    }, label: {
      HStack(alignment: .top) {
        Image(systemName: configuration.isOn ? isOnImage : isOffImage)
          .foregroundColor(.Anastasia.togglePrimaryBackground)
        configuration.label
          .multilineTextAlignment(.leading)
      }
      .padding(.vertical, Spacing.small)
    })
  }
}

extension ToggleStyle where Self == AnastasiaToggleStyle {
  public static var anastasiaCheckbox: Self { Self() }
  public static var anastasiaRadioButton: Self { .init(isOnImage: "circle.circle.fill", isOffImage: "circle") }
}

struct Checkbox_Previews: PreviewProvider {
    static var previews: some View {
      VStack(spacing: Spacing.extraLarge) {
        VStack {
          Toggle(isOn: .constant(true)) {
            Text("I agree to the term and condition")
              .font(.Anastasia.caption)
              .foregroundColor(.Anastasia.textSecondaryForeground)
          }
          .toggleStyle(.anastasiaRadioButton)
          Toggle(isOn: .constant(false)) {
            Text("I agree to the term and condition")
              .font(.Anastasia.caption)
              .foregroundColor(.Anastasia.textSecondaryForeground)
          }
          .toggleStyle(.anastasiaRadioButton)
        }
        VStack {
          Toggle(isOn: .constant(true)) {
            Text("I agree to the term and condition")
              .font(.Anastasia.caption)
              .foregroundColor(.Anastasia.textSecondaryForeground)
          }
          .toggleStyle(.anastasiaCheckbox)
          Toggle(isOn: .constant(false)) {
            Text("I agree to the term and condition")
              .font(.Anastasia.caption)
              .foregroundColor(.Anastasia.textSecondaryForeground)
          }
          .toggleStyle(.anastasiaCheckbox)
        }
      }
      .previewLayout(.sizeThatFits)
    }
}
