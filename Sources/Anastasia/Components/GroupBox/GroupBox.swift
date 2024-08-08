//
//  SwiftUIView.swift
//  
//
//  Created by alfian on 08/08/24.
//

import SwiftUI

@available(iOS, deprecated: 14, message: "Use ProgressView instead")
@MainActor
public struct GroupBox<Label: View, Content: View>: View {
  @ViewBuilder let label: () -> Label
  @ViewBuilder let content: () -> Content
  
  public init(label: @escaping () -> Label, content: @escaping () -> Content) {
    self.label = label
    self.content = content
  }
  
  public var body: some View {
    VStack(alignment: .leading, spacing: Spacing.medium) {
      label()
      
      content()
    }
    .padding(Spacing.large)
  }
}

struct GroupBox_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      GroupBox(label: {
        HStack {
          Image(systemName: "bookmark.fill")
          
          HeadlineText(type: .h6, text: "Headline 6")
        }
      }, content: {
        BodyText(type: .body1(scale: .small), text: "In publishing and graphic design, Lorem ipsum (/ˌlɔː.rəm ˈɪp.səm/) is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.")
      })
      .modifier(FilledBackground())
      
      GroupBox(label: {
        HStack {
          Image(systemName: "sunset.fill")
          
          HeadlineText(type: .h6, text: "Headline 6")
        }
      }, content: {
        BodyText(type: .body1(scale: .small), text: "In publishing and graphic design, Lorem ipsum (/ˌlɔː.rəm ˈɪp.səm/) is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.")
      })
      .modifier(OutlinedBackground())
      
      GroupBox(label: {
        HStack {
          Image(systemName: "music.quarternote.3")
          
          HeadlineText(type: .h6, text: "Headline 6")
        }
      }, content: {
        BodyText(type: .body1(scale: .large), text: "In publishing and graphic design, Lorem ipsum (/ˌlɔː.rəm ˈɪp.səm/) is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.")
      })
      .modifier(ElevatedBackground())
    }
    .padding()
  }
}

public struct FilledBackground: ViewModifier {
  let fillColor: Color
  
  init(fillColor: Color = Color(UIColor.systemGray6)) {
    self.fillColor = fillColor
  }
  
  public func body(content: Content) -> some View {
    content
      .background(
        RoundedRectangle(cornerRadius: BorderRadius.medium).fill(fillColor)
      )
  }
}

public struct OutlinedBackground: ViewModifier {
  let borderColor: Color
  
  public init(borderColor: Color = Color(UIColor.systemGray)) {
    self.borderColor = borderColor
  }
  
  public func body(content: Content) -> some View {
    content
      .background(
        RoundedRectangle(cornerRadius: BorderRadius.medium, style: .continuous)
          .stroke(
            borderColor,
            lineWidth: BorderWidth.thin
          )
      )
  }
}

public struct ElevatedBackground: ViewModifier {
  let fillColor: Color
  
  init(fillColor: Color = Color.white) {
    self.fillColor = fillColor
  }
  
  public func body(content: Content) -> some View {
    content
      .background(
        RoundedRectangle(cornerRadius: BorderRadius.medium).fill(fillColor)
      )
      .cornerRadius(BorderRadius.medium)
      .shadow(color: Color(UIColor.systemGray4), radius: 3, x: 2, y: 2)
  }
}
