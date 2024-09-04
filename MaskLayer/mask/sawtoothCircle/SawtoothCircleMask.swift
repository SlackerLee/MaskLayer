//
//  SawtoothCircleMask.swift
//  MaskLayer
//
//  Created by Tung on 3/9/2024.
//

import SwiftUI

struct SawtoothCircleMask: View {
    var body: some View {
        Image("penguin")
            .resizable()
            .overlay(
                SawtoothCircle().stroke(Color.red, lineWidth: 5)
            ).padding(5)
            .overlay(
                SawtoothCircle().stroke(Color.blue, lineWidth: 5)
            )
            .clipShape(SawtoothCircle())
            .shadow(radius: 7)
            .frame(width: 200, height: 200)
           
    }
}

struct SawtoothCircle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let teeth = 50 // Number of teeth
        let angleIncrement = .pi * 2 / CGFloat(teeth)
        
        for i in 0..<teeth {
            let angle = angleIncrement * CGFloat(i)
            let outerPoint = CGPoint(
                x: center.x + radius * cos(angle),
                y: center.y + radius * sin(angle)
            )
            let innerPoint = CGPoint(
                x: center.x + (radius - 10) * cos(angle + angleIncrement / 2),
                y: center.y + (radius - 10) * sin(angle + angleIncrement / 2)
            )
            if i == 0 {
                path.move(to: outerPoint)
            }
            path.addLine(to: outerPoint)
            path.addLine(to: innerPoint)
        }
        path.closeSubpath()
        return path
    }
}

#Preview {
    SawtoothCircleMask()
}
