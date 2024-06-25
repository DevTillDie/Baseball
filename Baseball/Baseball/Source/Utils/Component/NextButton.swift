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
    
    var text = "다음으로"
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundStyle(isActive ? .white : .gray)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.clear)
                        .stroke(isActive ? .white : .gray, lineWidth: 1.5)
                )
        }
        .disabled(!isActive)
    }
}

#Preview {
    NextButton(isActive: true, action: {})
}
