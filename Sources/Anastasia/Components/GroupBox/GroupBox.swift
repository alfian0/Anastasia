//
//  SwiftUIView.swift
//  
//
//  Created by alfian on 08/08/24.
//

import SwiftUI

@available(iOS, deprecated: 14, message: "Use ProgressView instead")
@MainActor
public struct AnastasiaGroupBox<Label: View, Content: View>: View {
  @ViewBuilder let label: () -> Label
  @ViewBuilder let content: () -> Content
  
  public init(label: @escaping () -> Label, content: @escaping () -> Content) {
    self.label = label
    self.content = content
  }
  
  public var body: some View {
    VStack(alignment: .leading, spacing: Spacing.large) {
      label()
      
      content()
    }
    .padding(Spacing.large)
  }
}

struct GroupBox_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      AnastasiaGroupBox(label: {
        HStack {
          Image(systemName: "music.note.list")
          
          HeadlineText(type: .h6, text: "Now Playing")
        }
      }, content: {
        VStack(spacing: Spacing.medium) {
          HStack(alignment: .center) {
            Image(systemName: "music")
              .frame(maxWidth: 40, maxHeight: 40)
              .background(
                RoundedRectangle(cornerRadius: Spacing.medium).fill(Color.gray)
              )
            
            VStack(alignment: .leading, spacing: Spacing.small) {
              HeadlineText(type: .h6, text: "Cool song title")
              SubtitleText(type: .subtitle1, text: "Artist Name")
            }
            
            Spacer()
          }
          
          AnastasiaProgressView(progress: 0.2)
            .frame(height: 10)
          
          HStack {
            Button {

            } label: {
              Image(systemName: "backward.fill")
            }
            .buttonStyle(.anastasiaSecondary)
            
            Button {

            } label: {
              Image(systemName: "pause.fill")
            }
            .buttonStyle(.anastasiaSecondary)
            
            Button {

            } label: {
              Image(systemName: "forward.fill")
            }
            .buttonStyle(.anastasiaSecondary)
          }
        }
      })
      .modifier(FilledBackground())
      
      AnastasiaGroupBox(label: {
        HStack {
          Image(systemName: "sunset.fill")
          
          HeadlineText(type: .h6, text: "Headline 6")
        }
      }, content: {
        BodyText(type: .body1(scale: .small), text: "In publishing and graphic design, Lorem ipsum (/ˌlɔː.rəm ˈɪp.səm/) is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.")
      })
      .modifier(OutlinedBackground())
      
      VStack(alignment: .leading) {
        Image(systemName: "person")
          .frame(maxWidth: .infinity, maxHeight: 140)
          .background(Color(UIColor.systemGray6))
        VStack(alignment: .leading, spacing: Spacing.medium) {
          HeadlineText(type: .h6, text: "Headline 6")
          SubtitleText(type: .subtitle1, text: "Supporting Subtitle 1 Text")
          BodyText(type: .body2(scale: .large), text: "In publishing and graphic design, Lorem ipsum (/ˌlɔː.rəm ˈɪp.səm/) is a placeholder")
          Divider()
          HStack {
            Spacer()
            Button {

            } label: {
              ButtonText(text: "Action")
            }
            .buttonStyle(.anastasiaSecondary)
            
            Button {

            } label: {
              ButtonText(text: "Action")
            }
            .buttonStyle(.anastasiaPrimary)
          }
        }
        .padding(Spacing.medium)
      }
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
