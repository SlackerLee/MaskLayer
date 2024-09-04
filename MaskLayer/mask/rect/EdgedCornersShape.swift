//
//  EdgedCornersShape.swift
//  MaskLayer
//
//  Created by Tung on 3/9/2024.
//

import SwiftUI

struct EdgedCornersShape: Shape {
    var cornerRadius: CGFloat
    var cornerLength: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let upperLeftPoint = CGPoint(x: rect.minX, y: rect.minY)
        let upperRightPoint = CGPoint(x: rect.maxX, y: rect.minY)
        let lowerRightPoint = CGPoint(x: rect.maxX, y: rect.maxY)
        let lowerLeftPoint = CGPoint(x: rect.minX, y: rect.maxY)
        
        path.move(to: upperLeftPoint.offsetBy(dx: 0, dy: cornerLength))
        path.addArc(center: upperLeftPoint.offsetBy(dx: cornerRadius, dy: cornerRadius), radius: cornerRadius, startAngle: .degrees(180), endAngle: .degrees(270), clockwise: false)
        path.addLine(to: upperLeftPoint.offsetBy(dx: cornerLength, dy: 0))
        
        path.move(to: upperRightPoint.offsetBy(dx: -cornerLength, dy: 0))
        path.addArc(center: upperRightPoint.offsetBy(dx: -cornerRadius, dy: cornerRadius), radius: cornerRadius, startAngle: .degrees(270), endAngle: .degrees(0), clockwise: false)
        path.addLine(to: upperRightPoint.offsetBy(dx: 0, dy: cornerLength))
        
        path.move(to: lowerRightPoint.offsetBy(dx: 0, dy: -cornerLength))
        path.addArc(center: lowerRightPoint.offsetBy(dx: -cornerRadius, dy: -cornerRadius), radius: cornerRadius, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: false)
        path.addLine(to: lowerRightPoint.offsetBy(dx: -cornerLength, dy: 0))
        
        path.move(to: lowerLeftPoint.offsetBy(dx: cornerLength, dy: 0))
        path.addArc(center: lowerLeftPoint.offsetBy(dx: cornerRadius, dy: -cornerRadius), radius: cornerRadius, startAngle: .degrees(90), endAngle: .degrees(180), clockwise: false)
        path.addLine(to: lowerLeftPoint.offsetBy(dx: 0, dy: -cornerLength))
        
        return path
    }
}

extension CGPoint {
    func offsetBy(dx: CGFloat, dy: CGFloat) -> CGPoint {
        return CGPoint(x: self.x + dx, y: self.y + dy)
    }
}

#Preview {
    EdgedCornersShape(cornerRadius: 25, cornerLength: 30).stroke(Color.blue, lineWidth: 2)
        .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 4 )
}
