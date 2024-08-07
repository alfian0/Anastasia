//
//  File.swift
//  
//
//  Created by alfian on 07/08/24.
//

import SwiftUI

struct ChipModel: Identifiable {
  let id = UUID()
  let systemImage: String
  let titleKey: LocalizedStringKey
  @State var isSelected: Bool
}

public struct Chips: View {
  let systemName: String
  let text: LocalizedStringKey
  let action: (Bool) -> Void
  @State var isSelected: Bool
  
  init(
    systemName: String,
    text: LocalizedStringKey,
    action: @escaping (Bool) -> Void,
    isSelected: Bool = false
  ) {
    self.systemName = systemName
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
            Color(UIColor.systemGray4),
            lineWidth: BorderWidth.thin
          )
        
        HStack {
          Image(systemName: systemName)
            .foregroundColor(isSelected ? Color.white : Color.Anastasia.buttonPrimaryBackground)
          
          Text(text)
            .foregroundColor(isSelected ? Color.white : Color.Anastasia.buttonPrimaryBackground)
        }
        .padding(.vertical, Spacing.medium)
        .padding(.leading, Spacing.small)
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
      Chips(systemName: "heart", text: "Hear") { _ in
        
      }
    }
}
