//
//  File.swift
//  
//
//  Created by alfian on 05/08/24.
//

import SwiftUI

public struct AnastasiaButtonStyle: ButtonStyle {
  private let foreground: Color
  private let background: Color
  private let horizontalPadding: CGFloat
  private let verticalPadding: CGFloat
  private let borderRadius: CGFloat
  
  public init(
    foreground: Color = .white,
    background: Color = Color.Anastasia.buttonPrimaryBackground,
    horizontalPadding: CGFloat = Spacing.large,
    verticalPadding: CGFloat = Spacing.medium,
    borderRadius: CGFloat = BorderRadius.medium
  ) {
    self.foreground = foreground
    self.background = background
    self.horizontalPadding = horizontalPadding
    self.verticalPadding = verticalPadding
    self.borderRadius = borderRadius
  }
  
  public func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .font(.body)
      .padding(.vertical, verticalPadding)
      .padding(.horizontal, horizontalPadding)
      .background(
        RoundedRectangle(cornerRadius: borderRadius)
          .fill(configuration.isPressed ? background.opacity(0.5) : background)
      )
      .foregroundColor(foreground)
      .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
      .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
  }
}

extension ButtonStyle where Self == AnastasiaButtonStyle {
  public static var anastasiaPrimary: Self { Self() }
  public static var anastasiaSecondary: Self {
    AnastasiaButtonStyle(
      foreground: Color.Anastasia.buttonSecondaryForeground,
      background: Color.Anastasia.buttonSecondaryBackground
    )
  }
  public static var anastasiaLink: Self {
    AnastasiaButtonStyle(
      foreground: Color.Anastasia.buttonLinkSecondaryForeground,
      background: Color.Anastasia.buttonLinkSecondaryBackground
    )
  }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
      VStack {
        Button {

        } label: {
          Text("Primary Button")
            .font(.Anastasia.body1.weight(.bold))
        }
        .buttonStyle(.anastasiaPrimary)
        
        Button {

        } label: {
          Text("Secondary Button")
            .font(.Anastasia.body1.weight(.bold))
        }
        .buttonStyle(.anastasiaSecondary)
        
        Button {

        } label: {
          Text("Link Button")
            .font(.Anastasia.body1.weight(.bold))
        }
        .buttonStyle(.anastasiaLink)
      }
      .previewLayout(.sizeThatFits)
    }
}
