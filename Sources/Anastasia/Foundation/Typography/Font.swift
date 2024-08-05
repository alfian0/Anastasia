//
//  File.swift
//  
//
//  Created by alfian on 05/08/24.
//

import SwiftUI

public extension Font {
  // MARK: Naming id based on Android Material Design
  struct Anastasia {
    // MARK: size 31
    // TextAppearance.MaterialComponents.Display1
    static let display1 = Font.largeTitle
    // MARK: size 25
    // TextAppearance.MaterialComponents.Headline1
    static let headline1 = Font.title
    // TextAppearance.MaterialComponents.Headline2
    static let headline2 = Font.system(size: 19)
    // TextAppearance.MaterialComponents.Headline3
    static let headline3 = Font.system(size: 17)
    // MARK: size 14 weight: semibold
    // TextAppearance.MaterialComponents.Headline4
    static let headline4 = Font.headline
    // MARK: size 12
    // TextAppearance.MaterialComponents.Subtitle1
    static let subtitle1 = Font.subheadline
    // MARK: size 14
    // TextAppearance.MaterialComponents.Body1
    static let body1 = Font.body
    // MARK: size 13
    // TextAppearance.MaterialComponents.Body2
    static let body2 = Font.callout
    // MARK: size 12
    // TextAppearance.MaterialComponents.Caption
    static let caption = Font.footnote
    // TextAppearance.MaterialComponents.Overline
    static let overline = Font.system(size: 11)
  }
}
