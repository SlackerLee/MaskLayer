//
//  RectFocusingMask.swift
//  MaskLayer
//
//  Created by Tung on 3/9/2024.
//

import SwiftUI

struct RectFocusingMask: View {
    var body: some View {
        Image("penguin").resizable()
                       .scaledToFit()
                       .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                       .overlay(
                            EdgedCornersShape(cornerRadius: 25, cornerLength: 30)
                                   .stroke(Color.blue, lineWidth: 5)
                       )
                       .shadow(radius: 7)
                       .padding()
    }
}


#Preview {
    RectFocusingMask()
}
