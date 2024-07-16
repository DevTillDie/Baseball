//
//  GradientProgressStyle.swift
//  Baseball
//
//  Created by hyebin on 7/16/24.
//

import SwiftUI

struct GradientProgressStyle<Background: ShapeStyle>: ProgressViewStyle {
    var fill: Background
    var cornerRadius: CGFloat = 2
    var height: CGFloat = 4
    var animation: Animation = .spring()
    init(fill: Background, height: CGFloat) {
        self.fill = fill
        self.cornerRadius = height / 2
        self.height = height
    }
    
    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0
        
        return VStack {
            ZStack(alignment: .topLeading) {
                GeometryReader { geo in
                    Rectangle()
                        .fill(.test)
                        .overlay(alignment: .leading) {
                            Capsule(style: .circular)
                                .fill(fill)
                                .frame(maxWidth: geo.size.width)
                                .mask(alignment: .leading) {
                                    Capsule(style: .circular)
                                        .frame(maxWidth: geo.size.width * CGFloat(fractionCompleted))
                                }
                                .animation(animation, value: fractionCompleted)
                        }
                   
                }
            }
            .frame(height: height)
            .cornerRadius(cornerRadius)
        }
    }
}
