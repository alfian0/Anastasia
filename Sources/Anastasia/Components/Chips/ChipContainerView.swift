//
//  File.swift
//  
//
//  Created by alfian on 07/08/24.
//

import SwiftUI

// MARK: https://medium.com/@askvasim/building-custom-chips-in-swiftui-a28ba65715a2
public struct ChipModel: Identifiable {
  public let id = UUID()
  public let type: Chips.ChipsType
  public let titleKey: LocalizedStringKey
  @State public var isSelected: Bool
  
  public init(
    type: Chips.ChipsType,
    titleKey: LocalizedStringKey,
    isSelected: State<Bool>
  ) {
    self.type = type
    self.titleKey = titleKey
    self._isSelected = isSelected
  }
}

@MainActor
public struct ChipContainerView: View {
  let models: [ChipModel]
  
  public init(models: [ChipModel]) {
    self.models = models
  }
  
  public var body: some View {
    var width = CGFloat.zero
    var height = CGFloat.zero
    return GeometryReader { geo in
      ZStack(alignment: .topLeading) {
        ForEach(models) { model in
          Chips(
            type: model.type,
            text: model.titleKey,
            isSelected: model.$isSelected
          ) {
            model.isSelected.toggle()
          }
          .padding(.all, Spacing.small)
            .alignmentGuide(.leading) { dimension in
                if (abs(width - dimension.width) > geo.size.width) {
                    width = 0
                    height -= dimension.height
                }
                let result = width
                if model.id == models.last!.id {
                    width = 0
                } else {
                    width -= dimension.width
                }
                return result
            }
            .alignmentGuide(.top) { dimension in
                let result = height
                if model.id == models.last!.id {
                    height = 0
                }
                return result
            }
        }
      }
    }
  }
}

struct ChipContainerView_Previews: PreviewProvider {
    static var previews: some View {
      VStack {
        ChipContainerView(models: [
          ChipModel(type: .assist(systemName: "airplane"), titleKey: "airplane", isSelected: .init(initialValue: false)),
          ChipModel(type: .assist(systemName: "heart"), titleKey: "heart", isSelected: .init(initialValue: true)),
          ChipModel(type: .assist(systemName: "square.and.arrow.up"), titleKey: "share", isSelected: .init(initialValue: false)),
          ChipModel(type: .filter, titleKey: "share", isSelected: .init(initialValue: false)),
          ChipModel(type: .input, titleKey: "heart", isSelected: .init(initialValue: false)),
          ChipModel(type: .suggestion, titleKey: "airplane", isSelected: .init(initialValue: false))
        ])
      }
      .background(Color(.systemGray6))
    }
}
