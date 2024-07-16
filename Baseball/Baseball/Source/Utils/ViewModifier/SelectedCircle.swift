//
//  SelectedCircle.swift
//  Baseball
//
//  Created by hyebin on 7/16/24.
//

import SwiftUI

struct SelectedCircle: ViewModifier {
    private let gradients: [Color] = [.gradient1, .gradient2, .gradient3, .gradient4, .gradient5]
    var isSelected: Bool
    
    func body(content: Content) -> some View {
        if isSelected {
            content
                .background(
                    Circle()
                        .stroke(
                            LinearGradient(
                                colors: gradients,
                                startPoint: .leading,
                                endPoint: .trailing
                            ), lineWidth: 5)
                        .blur(radius: 3)
                        .overlay(
                            Circle()
                                .fill(Color.test)
                                .stroke(LinearGradient(
                                    colors: gradients,
                                    startPoint: .leading,
                                    endPoint: .trailing
                                ), lineWidth: 3)
                        )
                )
        } else {
            content
                .background(
                    Circle()
                        .fill(Color.test)
                )
        }
    }
}
