//
//  StarShape.swift
//  MaskLayer
//
//  Created by Tung on 3/9/2024.
//

import SwiftUI

struct StarShape: Shape {
    func path(in rect: CGRect) -> Path {
        let starExtrusion: CGFloat = rect.width / 5   // Adjust extrusion relative to size
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let pointsOnStar = 5

        var angle: CGFloat = -CGFloat.pi / 2
        let angleIncrement = .pi * 2 / CGFloat(pointsOnStar * 2)
        let radius = rect.width / 2

        var path = Path()

        for i in 0..<pointsOnStar * 2 {
            let point = CGPoint(
                x: center.x + cos(angle) * (i % 2 == 0 ? radius : radius - starExtrusion),
                y: center.y + sin(angle) * (i % 2 == 0 ? radius : radius - starExtrusion)
            )
            if i == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
            angle += angleIncrement
        }
        path.closeSubpath()

        return path
    }
}

#Preview {
    StarShape().stroke(Color.blue, lineWidth: 2)
        .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 4 )
}
