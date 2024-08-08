//
//  SwiftUIView.swift
//  
//
//  Created by alfian on 08/08/24.
//

import SwiftUI

public enum LineType {
  case oneline(title: LocalizedStringKey)
  case twoline(title: LocalizedStringKey, subtitle: LocalizedStringKey)
  case threeline(title: LocalizedStringKey, subtitle: LocalizedStringKey)
  
  var maxHeight: CGFloat {
    switch self {
    case .oneline:
      return 56
    case .twoline:
      return 72
    default:
      return 88
    }
  }
  
  var title: LocalizedStringKey {
    switch self {
    case .oneline(let title),
        .twoline(let title, _),
        .threeline(let title, _):
      return title
    }
  }
  
  var subtitle: LocalizedStringKey? {
    switch self {
    case .twoline(_, let subtitle),
        .threeline(_, let subtitle):
      return subtitle
    default:
      return nil
    }
  }
}

public enum ListType {
  case normal
  case icon(systemName: String)
  case avatar(image: Image)
  case smallImage(image: Image)
  case largeImage(image: Image)
  
  var imageWidth: CGFloat {
    switch self {
    case .icon:
      return 24
    case .avatar:
      return 40
    case .smallImage:
      return 56
    case .largeImage:
      return .infinity
    default:
      return .zero
    }
  }
  
  var imageHeight: CGFloat {
    switch self {
    case .icon:
      return 24
    case .avatar:
      return 40
    case .smallImage:
      return 56
    case .largeImage:
      return 64
    default:
      return .zero
    }
  }
  
  var leadingPadding: CGFloat {
    switch self {
    case .largeImage:
      return .zero
    default:
      return Spacing.large
    }
  }
  
  var trailingPadding: CGFloat {
    switch self {
    default:
      return Spacing.large
    }
  }
  
  var verticalAlignment: VerticalAlignment {
    switch self {
    case .smallImage,
        .largeImage:
      return .top
    default:
      return .center
    }
  }
  
  var backgroundColor: Color {
    switch self {
    case .avatar, .smallImage, .largeImage:
      return Color(UIColor.systemGray6)
    default:
      return .white
    }
  }
  
  var cornerRadius: CGFloat {
    switch self {
    case .avatar:
      return 20
    default:
      return .zero
    }
  }
  
  var image: Image? {
    switch self {
    case .icon(let systemName):
      return  Image(systemName: systemName)
    case .avatar(let image),
        .smallImage(let image),
        .largeImage(let image):
      return image
    default:
      return nil
    }
  }
}

public struct AnastasiaList<Suffix: View>: View {
  let type: ListType
  let lineType: LineType
  let image: Image?
  let suffix: () -> Suffix
  
  public init(
    type: ListType = .normal,
    lineType: LineType,
    image: Image? = nil,
    suffix: @escaping (() -> Suffix) = { EmptyView() }
  ) {
    self.type = type
    self.lineType = lineType
    self.image = image
    self.suffix = suffix
  }
  
  public var body: some View {
    HStack(alignment: type.verticalAlignment , spacing: Spacing.large) {
      type.image?
        .frame(maxWidth: type.imageWidth, maxHeight: type.imageHeight)
        .background(
          RoundedRectangle(cornerRadius: type.cornerRadius).fill(type.backgroundColor)
        )
      
      VStack(alignment: .leading, spacing: 0) {
        HeadlineText(type: .h6, text: lineType.title)
        if let subtitle = lineType.subtitle {
          BodyText(type: .body1(scale: .small), text: subtitle)
        }
      }
      
      Spacer()
      
      suffix()
    }
    .padding(.leading, type.leadingPadding)
    .padding(.trailing, type.trailingPadding)
    .padding(.vertical, Spacing.medium)
    .listRowInsets(EdgeInsets())
    .frame(maxHeight: lineType.maxHeight)
  }
}

struct OneLineList_Previews: PreviewProvider {
    static var previews: some View {
      List {
        AnastasiaList(lineType: .oneline(title: "Headline")) { OverlineText(text: "100+") }
        AnastasiaList(type: .icon(systemName: "person"), lineType: .twoline(title: "Headline", subtitle: "Supporting Text that is long enough to fill up multiple lines")) {
            Toggle(isOn: .constant(true)) {}
            .toggleStyle(.anastasiaCheckbox)
        }
        AnastasiaList(type: .avatar(image: Image(systemName: "person")), lineType: .twoline(title: "Headline", subtitle: "Supporting Text that is long enough to fill up multiple lines")) { OverlineText(text: "100+") }
        AnastasiaList(type: .smallImage(image: Image(systemName: "person")), lineType: .threeline(title: "Headline", subtitle: "Supporting Text that is long enough to fill up multiple lines")) { OverlineText(text: "100+") }
        AnastasiaList(type: .largeImage(image: Image(systemName: "person")), lineType: .threeline(title: "Headline", subtitle: "Supporting Text that is long enough to fill up multiple lines"))
      }
      .listStyle(.plain)
    }
}
