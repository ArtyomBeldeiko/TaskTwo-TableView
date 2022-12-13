//
//  Extension + Array.swift
//  ClvrtcTaskTwo
//
//  Created by Artyom Beldeiko on 14.12.22.
//

import Foundation

extension Array {
    
  init(repeating: [Element], count: Int) {
    self.init([[Element]](repeating: repeating, count: count).flatMap{$0})
  }

  func repeated(count: Int) -> [Element] {
    return [Element](repeating: self, count: count)
  }
}
