//
//  File.swift
//  
//
//  Created by alfian on 08/08/24.
//

import SwiftUI

public struct AnastasiaProgressView: View {
  let progress: CGFloat
  

  public var body: some View {
    GeometryReader { geometry in
      ZStack(alignment: .leading) {
        Rectangle()
          .frame(width: geometry.size.width, height: Spacing.small)
          .opacity(0.3)
          .foregroundColor(.gray)

        Rectangle()
          .frame(
            width: min(progress * geometry.size.width, geometry.size.width),
            height: Spacing.small
          )
          .foregroundColor(.Anastasia.togglePrimaryBackground)
      }
    }
  }
}

struct AnastasiaProgressView_Previews: PreviewProvider {
    static var previews: some View {
      VStack {
        AnastasiaProgressView(progress: 0.3)
      }
      .padding()
    }
}
