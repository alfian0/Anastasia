//
//  File.swift
//  
//
//  Created by alfian on 07/08/24.
//

import SwiftUI

// MARK: https://medium.com/@askvasim/building-custom-chips-in-swiftui-a28ba65715a2
public struct ChipContainerView: View {
  let models: [ChipModel]
  
  init(models: [ChipModel]) {
    self.models = models
  }
  
  public var body: some View {
    var width = CGFloat.zero
    var height = CGFloat.zero
    return GeometryReader { geo in
      ZStack(alignment: .topLeading) {
        ForEach(models) { model in
          Chips(
            systemName: model.systemImage,
            text: model.titleKey,
            action: { isSelected in
              model.isSelected = isSelected
            },
            isSelected: model.isSelected
          )
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
      ChipContainerView(models: [
        ChipModel(systemImage: "airplane", titleKey: "airplane", isSelected: false),
        ChipModel(systemImage: "heart", titleKey: "heart", isSelected: true),
        ChipModel(systemImage: "square.and.arrow.up", titleKey: "share", isSelected: false),
        ChipModel(systemImage: "square.and.arrow.up", titleKey: "share", isSelected: false),
        ChipModel(systemImage: "heart", titleKey: "heart", isSelected: false),
        ChipModel(systemImage: "airplane", titleKey: "airplane", isSelected: false)
      ])
    }
}
