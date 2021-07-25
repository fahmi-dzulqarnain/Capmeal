//
//  ProgressBar.swift
//  SwiftUIExplore
//
//  Created by Edwin Niwarlangga on 23/07/21.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(.clear).overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color("Primary"), lineWidth: 2)
                    )
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("Primary"), Color("Secondary")]), startPoint: .leading, endPoint: .trailing))
                    .foregroundColor(.clear)
                    .animation(.easeIn(duration: 5))
            }.cornerRadius(15.0)
        }
    }
}
