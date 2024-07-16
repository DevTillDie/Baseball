//
//  NextButton.swift
//  Baseball
//
//  Created by hyebin on 6/25/24.
//

import SwiftUI

struct NextButton: View {
    let isActive: Bool
    let action: () -> Void
    let gradients: [Color] = [.gradient1, .gradient2, .gradient3, .gradient4, .gradient5]
    
    var text = "다음으로"
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundStyle(isActive ? .white : .gray)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.clear)
                        .stroke(LinearGradient(colors: gradients, startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 8)
                        .blur(radius: 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.black)
                                .stroke(LinearGradient(colors: gradients, startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2)
                        )
                )
        }
        .padding()
        .disabled(!isActive)
    }
}

#Preview {
    NextButton(isActive: true, action: {})
}
