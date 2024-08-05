//
//  File.swift
//  
//
//  Created by alfian on 05/08/24.
//

import SwiftUI

public struct AnastasiaSecureField: View {
  private let title: String
  @Binding private var text: String
  @State private var isSecured: Bool
  private let prefix: Image
  
  init(
    _ title: String,
    text: Binding<String>,
    isSecured: Bool = true,
    prefix: Image = Image(systemName: "lock")
  ) {
    self.title = title
    self.isSecured = isSecured
    self._text = text
    self.prefix = prefix
  }
  
  public var body: some View {
    Group {
      if isSecured {
        SecureField(title, text: _text)
          .textFieldStyle(
            AnastasiaTextFieldStyle(
              prefix: prefix,
              suffix: Button(action: {
                isSecured = false
              }, label: {
                Image(systemName: "eye.slash")
              })
            )
          )
      } else {
        TextField(title, text: _text)
          .textFieldStyle(
            AnastasiaTextFieldStyle(
              prefix: prefix,
              suffix: Button(action: {
                isSecured = true
              }, label: {
                Image(systemName: "eye")
              })
            )
          )
      }
    }
  }
}

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
          .foregroundColor(.Anastasia.primaryTextColor)
        configuration
          .keyboardType(keyboardType)
        suffix
          .foregroundColor(.Anastasia.primaryTextColor)
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
        AnastasiaSecureField(
          "Anastasia TextField",
          text: .constant("Password")
        )
      }
      
      VStack(alignment: .leading) {
        Toggle(isOn: .constant(true)) {
          Text("I agree to the term and condition")
            .font(.Anastasia.caption)
            .foregroundColor(.Anastasia.secondaryTextColor)
        }
        .toggleStyle(.anastasiaPrimary)
        
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
