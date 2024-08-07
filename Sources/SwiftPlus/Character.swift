//
//  Character.swift
//  
//
//  Created by Kyaw Zay Ya Lin Tun on 03/07/2024.
//

import Foundation

public extension Character {
  /// A simple emoji is one scalar and presented to the user as an Emoji
  private var isSimpleEmoji: Bool {
      guard let firstScalar = unicodeScalars.first else { return false }
      return firstScalar.properties.isEmoji && firstScalar.value > 0x238C
  }

  /// Checks if the scalars will be merged into an emoji
  private var isCombinedIntoEmoji: Bool { unicodeScalars.count > 1 && unicodeScalars.first?.properties.isEmoji ?? false }

  /// Checks if the give character is emoji or not
  var isEmoji: Bool { isSimpleEmoji || isCombinedIntoEmoji }
  
  /// Convert `Character` to `String`
  func asString() -> String {
    String(self)
  }
}
