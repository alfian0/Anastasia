//
//  SwiftUIView.swift
//  
//
//  Created by alfian on 08/08/24.
//

import SwiftUI

public struct AnastasiaTabItem: View {
  @Binding var currentIndex: Int
//  let namespace: Namespace.ID
  let systemName: String?
  let title: LocalizedStringKey
  let tabIndex: Int
  
  init(
    currentIndex: Binding<Int>,
    systemName: String?,
    title: LocalizedStringKey,
    tabIndex: Int
  ) {
    self._currentIndex = currentIndex
    self.systemName = systemName
    self.title = title
    self.tabIndex = tabIndex
  }
  
  public var body: some View {
    Button {
      currentIndex = tabIndex
    } label: {
      VStack(spacing: Spacing.medium) {
        if let systemName = systemName {
          Image(systemName: systemName)
        } else {
          Image(systemName: "trash.slash")
            .foregroundColor(.clear)
        }
        ButtonText(text: title)
          .padding(.horizontal, Spacing.medium)
        if currentIndex == tabIndex {
//          if #available(iOS 14.0, *) {
//            Color.Anastasia.togglePrimaryBackground
//              .frame(height: Spacing.small)
//              .matchedGeometryEffect(id: "underline", in: namespace, properties: .frame)
//          } else {
            Color.Anastasia.togglePrimaryBackground
              .frame(height: 2)
//          }
        } else {
          Color.clear
            .frame(height: 2)
        }
      }
      .foregroundColor(.Anastasia.textPrimaryForeground)
//      .animation(.spring(), value: currentIndex)
    }
  }
}

public struct TabModel {
  let systemName: String?
  let title: String
  
  init(systemName: String? = nil, title: String) {
    self.systemName = systemName
    self.title = title
  }
}

public struct AnastasiaTabs: View {
  @Binding var currentIndex: Int
  let tabs: [TabModel]
  
  init(currentIndex: Binding<Int>, tabs: [TabModel]) {
    self._currentIndex = currentIndex
    self.tabs = tabs
  }
  
  public var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack {
        ForEach(Array(zip(tabs.indices, tabs)), id:\.0) { (offset, item) in
          AnastasiaTabItem(
            currentIndex: $currentIndex,
            systemName: item.systemName,
            title: LocalizedStringKey(item.title),
            tabIndex: offset
          )
        }
      }
    }
  }
}

struct AnastasiaTabsPreview: View {
  @State var currentIndex: Int = 0
  let tabs: [TabModel] = [
    TabModel(systemName: "airplane", title: "Flights"),
    TabModel(systemName: "briefcase.fill", title: "Trips"),
    TabModel(systemName: "safari.fill", title: "Explore")
  ]
  
  var body: some View {
    VStack {
      AnastasiaTabs(currentIndex: $currentIndex, tabs: tabs)
      AnastasiaTabs(currentIndex: $currentIndex, tabs: [
        TabModel(title: "Overview"),
        TabModel(title: "Specifications"),
        TabModel(title: "Overview")
      ])
      Spacer()
    }
  }
}

struct AnastasiaTabs_Previews: PreviewProvider {
  static var previews: some View {
    AnastasiaTabsPreview()
  }
}
