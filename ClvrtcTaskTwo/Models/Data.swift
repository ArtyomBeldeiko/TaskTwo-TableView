//
//  Data.swift
//  ClvrtcTaskTwo
//
//  Created by Artyom Beldeiko on 13.12.22.
//

import Foundation
import UIKit

struct Data {
    
    var dataArray = [CellData(image: UIImage(named: "iconOne"), title: "1", description: "1"),
                     CellData(image: UIImage(named: "iconTwo"), title: "2", description: "2"),
                     CellData(image: UIImage(named: "iconThree"), title: "3", description: "3"),
                     CellData(image: UIImage(named: "iconFour"), title: "4", description: "4"),
                     CellData(image: UIImage(named: "iconFive"), title: "5", description: "5"),
                     CellData(image: UIImage(named: "iconSix"), title: "6", description: "6"),
                     CellData(image: UIImage(named: "iconSeven"), title: "7", description: "7"),
                     CellData(image: UIImage(named: "iconEight"), title: "8", description: "8"),
                     CellData(image: UIImage(named: "iconNine"), title: "9", description: "9"),
                     CellData(image: UIImage(named: "iconTen"), title: "10", description: "10")]
    
    init(dataArray: [CellData] = [CellData(image: UIImage(named: "iconOne"), title: "1", description: "1"),
                                  CellData(image: UIImage(named: "iconTwo"), title: "2", description: "2"),
                                  CellData(image: UIImage(named: "iconThree"), title: "3", description: "3"),
                                  CellData(image: UIImage(named: "iconFour"), title: "4", description: "4"),
                                  CellData(image: UIImage(named: "iconFive"), title: "5", description: "5"),
                                  CellData(image: UIImage(named: "iconSix"), title: "6", description: "6"),
                                  CellData(image: UIImage(named: "iconSeven"), title: "7", description: "7"),
                                  CellData(image: UIImage(named: "iconEight"), title: "8", description: "8"),
                                  CellData(image: UIImage(named: "iconNine"), title: "9", description: "9"),
                                  CellData(image: UIImage(named: "iconTen"), title: "10", description: "10")]) {
        self.dataArray = dataArray
    }
}


