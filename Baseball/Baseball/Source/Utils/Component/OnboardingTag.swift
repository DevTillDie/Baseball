//
//  OnboardingTag.swift
//  Baseball
//
//  Created by Nayeon Kim on 8/4/24.
//

import SwiftUI

struct OnboardingTag: View {
    let text: String
    
    var body: some View {
        Text("\(text)")
            .font(.system(size: 20))
            .foregroundStyle(.onboardingTag)
            .fixedSize()
            .padding(.vertical, 8)
            .padding(.horizontal, 16)
            .background {
                RoundedRectangle(cornerRadius: 19.5)
                    .fill(.clear)
                    .stroke(.onboardingTag)
            }
    }
}

#Preview {
    OnboardingTag(text: "# 간단")
}
