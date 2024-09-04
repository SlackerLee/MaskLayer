//
//  StarMask.swift
//  MaskLayer
//
//  Created by Tung on 3/9/2024.
//

import SwiftUI

struct StarMask: View {
    var body: some View {
        Image("penguin")
            .resizable()
//            .aspectRatio(contentMode: .fit)
            .clipShape(StarShape())
            .frame(width: 300, height: 300)
            .scaledToFit()
            .overlay(
                StarShape().stroke(Color.white, lineWidth: 2)
            )
            .shadow(radius: 7)
            .padding()
    }
}

#Preview {
    StarMask()
}

