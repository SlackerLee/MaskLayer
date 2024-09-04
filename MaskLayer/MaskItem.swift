//
//  Mask.swift
//  MaskLayer
//
//  Created by Tung on 3/9/2024.
//

import Foundation

struct MaskItem: Identifiable {
    var id: Int
    var name: String
    var isFavorite: Bool
    
    static func preview() -> [MaskItem] {
        return [MaskItem(id: 0, name: "Rectangle Focusing Mask", isFavorite: false),
                MaskItem(id: 1, name: "Circle Mask", isFavorite: false),
                MaskItem(id: 2, name: "Star Mask", isFavorite: false),
                MaskItem(id: 3, name: "Sawtooth Rectangle", isFavorite: false),
                MaskItem(id: 4, name: "Sawtooth Circle", isFavorite: false),
        ]
    }
}
