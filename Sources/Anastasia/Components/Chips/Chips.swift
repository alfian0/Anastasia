//
//  File.swift
//  
//
//  Created by alfian on 07/08/24.
//

import SwiftUI

public struct Chips: View {
  let type: ChipsType
  let text: LocalizedStringKey
  let action: (Bool) -> Void
  @State var isSelected: Bool
  
  enum ChipsType: Equatable {
    case assist(systemName: String)
    case filter
    case input
    case suggestion
  }
  
  init(
    type: ChipsType,
    text: LocalizedStringKey,
    action: @escaping (Bool) -> Void,
    isSelected: Bool = false
  ) {
    self.type = type
    self.text = text
    self.isSelected = isSelected
    self.action = action
  }
  
  public var body: some View {
    Button {
      isSelected.toggle()
      action(isSelected)
    } label: {
      ZStack {
        RoundedRectangle(cornerRadius: BorderRadius.medium, style: .continuous)
          .stroke(
            isSelected ? Color.Anastasia.buttonPrimaryBackground : Color(UIColor.systemGray4),
            lineWidth: BorderWidth.thin
          )
        
        HStack(spacing: Spacing.small) {
          switch type {
          case .assist(let systemName):
            Image(systemName: systemName)
              .foregroundColor(isSelected ? Color.white : Color.Anastasia.buttonPrimaryBackground)
            
            Text(text)
              .foregroundColor(isSelected ? Color.white : Color.Anastasia.buttonPrimaryBackground)
          case .filter:
            Image(systemName: "checkmark")
              .foregroundColor(isSelected ? Color.white : Color.Anastasia.buttonPrimaryBackground)
            
            Text(text)
              .foregroundColor(isSelected ? Color.white : Color.Anastasia.buttonPrimaryBackground)
          case .input:
            Text(text)
              .foregroundColor(isSelected ? Color.white : Color.Anastasia.buttonPrimaryBackground)
            
            Image(systemName: "xmark")
              .foregroundColor(isSelected ? Color.white : Color.Anastasia.buttonPrimaryBackground)
          default:
            Text(text)
              .foregroundColor(isSelected ? Color.white : Color.Anastasia.buttonPrimaryBackground)
          }
        }
        .padding(.vertical, Spacing.medium)
        .padding(.leading, (type == .suggestion ) ? Spacing.medium : Spacing.small)
        .padding(.trailing, Spacing.medium)
      }
      .fixedSize(horizontal: true, vertical: true)
    }
    .background(
      RoundedRectangle(cornerRadius: Spacing.medium)
        .fill(isSelected ? Color.Anastasia.buttonPrimaryBackground : Color.white)
    )
  }
}

struct Chips_Previews: PreviewProvider {
    static var previews: some View {
      VStack {
        Chips(type: .assist(systemName: "heart"), text: "Hear") { _ in
          
        }
        
        Chips(type: .input, text: "Hear") { _ in
          
        }
        
        Chips(type: .filter, text: "Hear") { _ in
          
        }
        
        Chips(type: .suggestion, text: "Hear") { _ in
          
        }
      }
    }
}
