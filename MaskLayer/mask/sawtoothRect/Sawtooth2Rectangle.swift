//
//  SawtoothRectangle.swift
//  MaskLayer
//
//  Created by Tung on 3/9/2024.
//

import SwiftUI

struct Sawtooth2Rectangle: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let toothWidth = 10.0 //rect.width / 10
        let toothHeight = 10.0 //rect.height / 4
        path.move(to: CGPoint(x: 0, y: 0))

        for i in stride(from: 0, to: rect.width, by: toothWidth) {
            path.addLine(to: CGPoint(x: i, y: i.truncatingRemainder(dividingBy: 2 * toothWidth) == 0 ? 0 : toothHeight))
        }

        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))

        for i in stride(from: rect.width, to: 0, by: -toothWidth) {
            path.addLine(to: CGPoint(x: i, y: i.truncatingRemainder(dividingBy: 2 * toothWidth) == 0 ? rect.height : rect.height - toothHeight))
        }

        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()
        return path
    }
}
#Preview {
    Sawtooth2Rectangle().stroke(Color.blue, lineWidth: 2).frame(width: 300, height: 300)
}
