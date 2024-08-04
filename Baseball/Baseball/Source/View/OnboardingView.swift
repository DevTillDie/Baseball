//
//  OnboardingView.swift
//  Baseball
//
//  Created by Nayeon Kim on 8/4/24.
//

import SwiftUI

struct OnboardingView: View {
    @State private var isMoveToLast = false
    
    var body: some View {
        ZStack {
            Color(.background)
                .ignoresSafeArea()
            
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(spacing: 0) {
                        onboardingMain
                        
                        onboardingDescriptionOne
                        
                        onboardingDescriptionTwo
                        
                        onboardingTeamSelection
                            .id("TeamSelection")
                    }
                }
                .scrollTargetBehavior(.paging)
                .onChange(of: isMoveToLast) {
                    withAnimation {
                        proxy.scrollTo("TeamSelection", anchor: .bottom)
                    }
                }
            }
        }
    }
}

// MARK: - ScrollSubViews

extension OnboardingView {
    private var onboardingMain: some View {
        VStack {
            
            Text("간단히 기록하는\n트렌디한 야구 다이어리")
                .foregroundStyle(.headline)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.top, 20)
            Button { isMoveToLast.toggle() }
        label: {
            Image(.onboardingSkipButton)
                .resizable()
                .scaledToFit()
                .frame(width: 74, height: 22)
        }
            Spacer()
        }
        .foregroundStyle(.text)
        .frame(height: UIScreen.main.bounds.height - 40)
    }
    
    private var onboardingDescriptionOne: some View {
        VStack {
            Text("오늘 본 경기\n간편하게 기록해봐요")
                .font(.system(size: 24))
                .bold()
                .multilineTextAlignment(.center)
            
            Spacer()
        }
        .foregroundStyle(.text)
        .frame(height: UIScreen.main.bounds.height * 1/2)
    }
    
    private var onboardingDescriptionTwo: some View {
        VStack {
            Spacer()
            
            Text("기록해서 모은")
            Text("내 경기 티켓 공유해봐요")
            
            Spacer()
        }
        .foregroundStyle(.text)
        .frame(height: UIScreen.main.bounds.height * 1/2)
    }
    
    private var onboardingTeamSelection: some View {
        Text("가장 응원하는 구단은 어디인가요?")
            .foregroundStyle(.text)
            .frame(height: UIScreen.main.bounds.height * 1/2)
    }
}

#Preview {
    OnboardingView()
}
