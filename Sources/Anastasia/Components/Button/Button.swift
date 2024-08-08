//
//  File.swift
//  
//
//  Created by alfian on 05/08/24.
//

import SwiftUI

@MainActor
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
      .font(.Anastasia.button)
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
  @MainActor
  public static var anastasiaPrimary: Self { Self() }
  @MainActor
  public static var anastasiaSecondary: Self {
    AnastasiaButtonStyle(
      foreground: Color.Anastasia.buttonSecondaryForeground,
      background: Color.Anastasia.buttonSecondaryBackground
    )
  }
  @MainActor
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
          ButtonText(text: "Primary Button")
        }
        .buttonStyle(.anastasiaPrimary)
        
        Button {

        } label: {
          HStack {
            ButtonText(text: "Secondary Button")
            
            Image(systemName: "square.and.arrow.up")
              .resizable()
              .scaledToFit()
              .frame(width: 18, height: 18)
          }
        }
        .buttonStyle(.anastasiaSecondary)
        
        Button {

        } label: {
          Image(systemName: "square.and.arrow.up")
        }
        .buttonStyle(.anastasiaSecondary)
        
        Button {

        } label: {
          ButtonText(text: "Link Button")
        }
        .buttonStyle(.anastasiaLink)
      }
      .previewLayout(.sizeThatFits)
    }
}
