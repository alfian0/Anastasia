//
//  File.swift
//  
//
//  Created by alfian on 07/08/24.
//

import UIKit

extension CGFloat {
  func toPixels() -> CGFloat {
    let scale = UIScreen.main.scale
    return self * scale
  }
  
  func toPoints() -> CGFloat {
      let scale = UIScreen.main.scale
      return self / scale
  }
}
