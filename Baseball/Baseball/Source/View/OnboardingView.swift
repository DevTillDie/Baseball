//
//  OnboardingView.swift
//  Baseball
//
//  Created by Nayeon Kim on 8/4/24.
//

import SwiftUI

struct OnboardingView: View {
    @State private var isMoveToLast = false
    @State private var isButtonVisible: Bool = true
    @State private var timer: Timer?
    
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
            Image(.logo)
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 90)
                .padding(.top, 65)
            
            Text("간단히 기록하는\n트렌디한 야구 다이어리")
                .foregroundStyle(.headline)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.top, 20)
            
            onboardingTags
                .padding(.top, 54)
            
            Image(.baseball)
                .resizable()
                .scaledToFit()
                .frame(width: 243, height: 227)
                .padding(.top, 40)
            
            Spacer()
            
            Button { isMoveToLast.toggle() }
        label: {
            Image(.onboardingSkipButton)
                .resizable()
                .scaledToFit()
                .frame(width: 74, height: 22)
                .opacity(isButtonVisible ? 1 : 0)
        }
        .onAppear {
            startBlinking()
        }
        .onDisappear {
            stopBlinking()
        }
            
            Spacer()
        }
        .foregroundStyle(.text)
        .frame(height: UIScreen.main.bounds.height - 40)
    }
    
    private var onboardingTags: some View {
        VStack(spacing: 11) {
            HStack {
                OnboardingTag(content: .text("야구 기록"))
                OnboardingTag(content: .text("# 간단"))
                OnboardingTag(content: .image(Image(.onboardingTagArrow)))
                OnboardingTag(content: .text("트렌디한"))
            }
            .frame(maxWidth: .infinity)
            HStack {
                OnboardingTag(content: .text(">>"))
                OnboardingTag(content: .text("간편한 야구 다이어리"))
                OnboardingTag(content: .text("오늘의 기록 내일"))
            }
        }
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
    
    private func startBlinking() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            withAnimation(.easeInOut(duration: 0.5)) {
                isButtonVisible.toggle()
            }
        }
    }
    
    private func stopBlinking() {
        timer?.invalidate()
        timer = nil
    }
}

#Preview {
    OnboardingView()
}
