//
//  CellData.swift
//  ClvrtcTaskTwo
//
//  Created by Artyom Beldeiko on 13.12.22.
//

import Foundation
import UIKit

struct CellData {
    let image: UIImage?
    let title: String
    let description: String
    
    init(image: UIImage?, title: String, description: String) {
        self.image = image
        self.title = title
        self.description = description
    }
}
