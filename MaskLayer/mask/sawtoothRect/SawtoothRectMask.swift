//
//  SawtoothMask.swift
//  MaskLayer
//
//  Created by Tung on 3/9/2024.
//

import SwiftUI

struct SawtoothRectMask: View {
    var body: some View {
        VStack {
            Image("penguin")
                .resizable()
                .overlay(
                    Sawtooth4Rectangle().stroke(Color.white, lineWidth: 2)
                )
//                .aspectRatio(contentMode: .fit)
                .clipShape(Sawtooth4Rectangle())
                .frame(width: 300, height: 300)
                .shadow(radius: 7)
            
            Image("penguin")
                .resizable()
                .overlay(
                    Sawtooth2Rectangle().stroke(Color.white, lineWidth: 2)
                )
                .aspectRatio(contentMode: .fit)
                .clipShape(Sawtooth2Rectangle())
                .frame(width: 300, height: 300)
                .shadow(radius: 7)
        }
       
    }
}

#Preview {
    SawtoothRectMask()
}


