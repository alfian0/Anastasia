//
//  File.swift
//  
//
//  Created by alfian on 07/08/24.
//

import SwiftUI

@MainActor
public struct Chips: View {
  let type: ChipsType
  let text: LocalizedStringKey
  let tintColor: Color
  @Binding var isSelected: Bool
  let action: (() -> Void)?
  
  public enum ChipsType: Equatable {
    case assist(systemName: String)
    case filter
    case input
    case suggestion
  }
  
  public init(
    type: ChipsType,
    text: LocalizedStringKey,
    tintColor: Color = Color.Anastasia.togglePrimaryBackground,
    isSelected: Binding<Bool>,
    action: (() -> Void)? = nil
  ) {
    self.type = type
    self.text = text
    self.tintColor = tintColor
    self._isSelected = isSelected
    self.action = action
  }
  
  public var body: some View {
    Button {
      action?()
    } label: {
      ZStack {
        RoundedRectangle(cornerRadius: BorderRadius.medium, style: .continuous)
          .stroke(
            isSelected ? tintColor : Color(UIColor.systemGray4),
            lineWidth: BorderWidth.thin
          )
        
        HStack(spacing: Spacing.small) {
          switch type {
          case .assist(let systemName):
            Image(systemName: systemName)
              .foregroundColor(isSelected ? Color.white : tintColor)
            
            ButtonText(text: text)
              .foregroundColor(isSelected ? Color.white : tintColor)
          case .filter:
            Image(systemName: "checkmark")
              .foregroundColor(isSelected ? Color.white : tintColor)
            
            ButtonText(text: text)
              .foregroundColor(isSelected ? Color.white : tintColor)
          case .input:
            ButtonText(text: text)
              .foregroundColor(isSelected ? Color.white : tintColor)
            
            Image(systemName: "xmark")
              .foregroundColor(isSelected ? Color.white : tintColor)
          default:
            ButtonText(text: text)
              .foregroundColor(isSelected ? Color.white : tintColor)
          }
        }
        .padding(.vertical, Spacing.medium)
        .padding(.leading, (type == .input ) ? Spacing.medium : (type == .suggestion ) ? Spacing.medium : Spacing.small)
        .padding(.trailing, (type == .input ) ? Spacing.small : Spacing.medium)
      }
      .fixedSize(horizontal: true, vertical: true)
    }
    .background(
      RoundedRectangle(cornerRadius: Spacing.medium)
        .fill(isSelected ? tintColor : Color.white)
    )
  }
}

struct Chips_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      Chips(type: .assist(systemName: "heart"), text: "Heart", isSelected: .constant(true))
      Chips(type: .input, text: "Heart", isSelected: .constant(false))
      Chips(type: .filter, text: "Heart", isSelected: .constant(false))
      Chips(type: .suggestion, text: "Heart", isSelected: .constant(false))
    }
  }
}
