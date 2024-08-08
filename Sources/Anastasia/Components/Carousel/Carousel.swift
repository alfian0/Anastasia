//
//  SwiftUIView.swift
//  
//
//  Created by alfian on 08/08/24.
//

import SwiftUI

struct AnastasiCarouselView: View {
  @State private var currentIndex: Int = 0
  @GestureState private var dragOffset: CGFloat = 0
  let images: [String] = ["avatartion", "avatartion-2", "avatartion-3", "avatartion-4", "avatartion", "avatartion-2"]
  
  var body: some View {
    let width: CGFloat = 200
    let height: CGFloat = 200
    ZStack {
      ForEach(0..<images.count, id: \.self) { index in
        Image(images[index], bundle: .module)
          .resizable()
          .scaledToFit()
          .frame(width: width, height: height)
          .opacity(currentIndex == index ? 1.0 : 0.5)
          .scaleEffect(currentIndex == index ? 1.2 : 0.8)
          .offset(x: CGFloat(index - currentIndex) * width + dragOffset, y: 0)
      }
      .gesture(
        DragGesture()
          .onEnded({ value in
            let threshold: CGFloat = 50
            if value.translation.width > threshold {
              withAnimation {
                currentIndex = max(0, currentIndex - 1)
              }
            } else if (value.translation.width < -threshold) {
              withAnimation {
                currentIndex = min(images.count - 1, currentIndex + 1)
              }
            }
          })
      )
    }
  }
}

struct AnastasiCarouselView_Previews: PreviewProvider {
    static var previews: some View {
      AnastasiCarouselView()
    }
}
