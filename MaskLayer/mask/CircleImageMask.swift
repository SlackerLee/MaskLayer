//
//  CircleImageMask.swift
//  MaskLayer
//
//  Created by Tung on 3/9/2024.
//

import SwiftUI

struct CircleImageMask: View {
    var image: Image = Image("penguin")
    var body: some View {
        image.clipShape(Circle())
        .overlay {
            Circle().stroke(.white, lineWidth: 4)
        }.padding(8) // Add padding to create space between the inner and outer circles
        .overlay(
            Circle().stroke(Color.blue, lineWidth: 2)
        ).shadow(radius: 7)
    }
}

#Preview {
    CircleImageMask()
}
