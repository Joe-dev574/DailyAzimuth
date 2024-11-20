//
//  Tag.swift
//  DailyAzimuth
//
//  Created by Joseph DeWeese on 11/20/24.
//

import SwiftUI
import SwiftData

@Model
class Tag {
    var name: String = ""
    var color: String = "FF0000"
    var items: [Item]?
    
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
    
    var hexColor: Color {
        Color(hex: self.color) ?? .red
    }
}