//
//  File.swift
//  
//
//  Created by alfian on 05/08/24.
//

import SwiftUI

public struct AnastasiaTextFieldStyle<Prefix: View, Suffix: View>: TextFieldStyle {
  private let keyboardType: UIKeyboardType
  @ViewBuilder private let prefix: Prefix
  @ViewBuilder private let suffix: Suffix
  
  init(
    keyboardType: UIKeyboardType = .default,
    prefix: Prefix = EmptyView(),
    suffix: Suffix = EmptyView()
  ) {
    self.keyboardType = keyboardType
    self.prefix = prefix
    self.suffix = suffix
  }
  
  public func _body(configuration: TextField<Self._Label>) -> some View {
    ZStack {
      RoundedRectangle(cornerRadius: BorderRadius.medium, style: .continuous)
        .stroke(
          Color(UIColor.systemGray4),
          lineWidth: BorderWidth.thin
        )
      
      HStack {
        prefix
        configuration
          .keyboardType(keyboardType)
        suffix
      }
      .padding(.vertical, Spacing.medium)
      .padding(.horizontal, Spacing.large)
    }
    .frame(height: 44)
  }
}

struct TextField_Previews: PreviewProvider {
    static var previews: some View {
      VStack(spacing: Spacing.extraLarge) {
        Text("Sign In")
          .font(.Anastasia.display1)
          .foregroundColor(.Anastasia.primaryTextColor)
        
        VStack {
          TextField("Anastasia TextField", text: .constant(""))
            .textFieldStyle(
              AnastasiaTextFieldStyle(prefix: Image(systemName: "envelope"))
            )
          SecureField("Anastasia TextField", text: .constant(""))
            .textFieldStyle(
              AnastasiaTextFieldStyle(
                prefix: Image(systemName: "lock"),
                suffix: Image(systemName: "eye.slash")
              )
            )
        }
        
        VStack(alignment: .leading) {
          Text("I agree to the term and condition")
            .font(.Anastasia.caption)
            .foregroundColor(.Anastasia.secondaryTextColor)
          
          Button {

          } label: {
            Text("Login")
              .font(.Anastasia.body1.weight(.bold))
              .frame(maxWidth: .infinity, maxHeight: 32)
          }
          .buttonStyle(.anastasiaPrimary)
          
          Button {

          } label: {
            Text("Register")
              .font(.Anastasia.body1.weight(.bold))
              .frame(maxWidth: .infinity, maxHeight: 32)
          }
          .buttonStyle(.anastasiaLink)
        }
      }
      .padding(Spacing.extraLarge)
      .previewLayout(.sizeThatFits)
    }
}
