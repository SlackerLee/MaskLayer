//
//  SawtoothRectangle.swift
//  MaskLayer
//
//  Created by Tung on 3/9/2024.
//

import SwiftUI

struct Sawtooth4Rectangle: Shape {
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        let toothWidth = 10.0
        let toothHeight = 10.0
        
        // Start at the top-left corner
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        
        // Top edge
        for i in stride(from: rect.minX, to: rect.maxX, by: toothWidth * 2) {
            path.addLine(to: CGPoint(x: i + toothWidth, y: rect.minY + toothHeight))
            path.addLine(to: CGPoint(x: i + toothWidth * 2, y: rect.minY))
        }
        
        // Right edge
        for i in stride(from: rect.minY, to: rect.maxY, by: toothHeight * 2) {
            path.addLine(to: CGPoint(x: rect.maxX - toothWidth, y: i + toothHeight))
            path.addLine(to: CGPoint(x: rect.maxX, y: i + toothHeight * 2))
        }
        
        // Bottom edge
        for i in stride(from: rect.maxX, to: rect.minX, by: -toothWidth * 2) {
            path.addLine(to: CGPoint(x: i - toothWidth, y: rect.maxY - toothHeight))
            path.addLine(to: CGPoint(x: i - toothWidth * 2, y: rect.maxY))
        }
        
        // Left edge
        for i in stride(from: rect.maxY, to: rect.minY, by: -toothHeight * 2) {
            path.addLine(to: CGPoint(x: rect.minX + toothWidth, y: i - toothHeight))
            path.addLine(to: CGPoint(x: rect.minX, y: i - toothHeight * 2))
        }
        
        path.closeSubpath()
        return path
    }
}
#Preview {
    Sawtooth4Rectangle().stroke(Color.blue, lineWidth: 2).frame(width: 300, height: 300)
}
