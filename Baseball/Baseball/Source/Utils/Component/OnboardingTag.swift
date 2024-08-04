//
//  OnboardingTag.swift
//  Baseball
//
//  Created by Nayeon Kim on 8/4/24.
//

import SwiftUI

enum OnboardingTagContent {
    case text(String)
    case image(Image)
}

struct OnboardingTag: View {
    let content: OnboardingTagContent
    
    var body: some View {
        Group {
            switch content {
            case .text(let text):
                Text(text)
                    .font(.system(size: 20))
            case .image(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20)
            }
        }
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
    OnboardingTag(content: .text("# 간단"))
}
