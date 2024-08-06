//
//  File.swift
//  
//
//  Created by alfian on 06/08/24.
//

import UIKit
import SwiftUI

@available(iOS, deprecated: 14, message: "Use ProgressView instead")
public struct ActivityIndicator: UIViewRepresentable {
  @Binding var isAnimating: Bool

  public init(isAnimating: Binding<Bool>) {
    self._isAnimating = isAnimating
  }
  
  public func makeUIView(context: Context) -> UIActivityIndicatorView {
    let indicator = UIActivityIndicatorView(style: .medium)
    indicator.hidesWhenStopped = true
    return indicator
  }

  public func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
    if isAnimating {
      uiView.startAnimating()
    } else {
      uiView.stopAnimating()
    }
  }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
      VStack {
        ActivityIndicator(isAnimating: .constant(true))
      }
      .previewLayout(.sizeThatFits)
    }
}
