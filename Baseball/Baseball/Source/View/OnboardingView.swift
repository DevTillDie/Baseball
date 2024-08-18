//
//  OnboardingView.swift
//  Baseball
//
//  Created by Nayeon Kim on 8/4/24.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject private var viewModel = OnboardingViewModel()
    
    @Binding var isFirstLaunching: Bool
    @State private var isMoveToLast = false
    @State private var isButtonVisible: Bool = true
    @State private var timer: Timer?
    @State private var scrollOffset: CGFloat = 0
    
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        ZStack {
            Color(.background)
                .ignoresSafeArea()
            
            ScrollViewReader { proxy in
                ScrollView {
                    VStack {
                        onboardingMain
                        
                        onboardingDescriptionOne
                        
                        onboardingDescriptionTwo

                        onboardingTeamSelection
                            .id("TeamSelection")
                    }
                }
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
                .frame(maxWidth: 243, maxHeight: 227)
                .padding(.top, 40)
            
            Spacer(minLength: 100)
            
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
            
            Spacer(minLength: 20)
        }
        .foregroundStyle(.text)
        .frame(height: UIScreen.main.bounds.height - 60)
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
                .font(.custom("Pretendard-Bold", size: 24))
                .bold()
                .multilineTextAlignment(.center)
            
            Text("간단한 기록으로 경기 티켓을\n모을 수 있어요")
                .foregroundStyle(.body)
                .multilineTextAlignment(.center)
                .padding(.top, 20)
            
            Spacer(minLength: 100)
            
            Image(.record)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 275, maxHeight: 212)
            
            Spacer(minLength: 100)
        }
        .foregroundStyle(.text)
        .frame(height: UIScreen.main.bounds.height * 0.7)
    }
    
    private var onboardingDescriptionTwo: some View {
        VStack {
            Text("기록해서 모은\n내 경기 티켓 공유해봐요")
                .font(.custom("Pretendard-Bold", size: 24))
                .bold()
                .multilineTextAlignment(.center)
            
            Text("인스타그램 스토리에 공유하면\n근사한 결과물을 볼 수 있어요!")
                .foregroundStyle(.body)
                .multilineTextAlignment(.center)
                .padding(.top, 20)
            
            Spacer(minLength: 100)
            
            Image(.share)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 287, maxHeight: 277)
            
            Spacer(minLength: 100)
        }
        .foregroundStyle(.text)
        .frame(height: UIScreen.main.bounds.height * 0.7)
    }
    
    private var onboardingTeamSelection: some View {
        VStack {
            Text("가장 응원하는 구단은\n어디인가요?")
                .font(.custom("Pretendard-Bold", size: 24))
                .bold()
                .multilineTextAlignment(.center)
            
            Text("선호 구단에 맞추어 콘텐츠를\n제공받을 수 있어요!")
                .foregroundStyle(.body)
                .multilineTextAlignment(.center)
                .padding(.top, 20)
            
            teamSelectionButtons
                .padding(.top, 60)
            
            Spacer()
            
            Button {
                isFirstLaunching = false
            } label: {
                Text("시작하기")
                    .fontWeight(.medium)
                    .foregroundStyle(viewModel.myTeam.isEmpty ? .caption : .text)
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 15.0)
                            .fill(.clear)
                            .stroke(viewModel.myTeam.isEmpty ? .caption : .text, lineWidth: 1.5)
                    }
            }
            .padding(.horizontal, 36)
        }
        .foregroundStyle(.text)
        .frame(height: UIScreen.main.bounds.height * 0.85)
    }
    
    private var teamSelectionButtons: some View {
        LazyVGrid(columns: columns) {
            ForEach(viewModel.teams, id: \.self) { team in
                VStack {
                    Image(systemName: team.imageName)
                        .resizable()
                        .padding(32)
                        .scaledToFit()
                        .modifier(SelectedCircle(isSelected: viewModel.myTeam == team.teamName))
                        .frame(width: 100, height: 100)
                    
                    Text(team.teamName)
                        .font(.system(size: 12))
                        .foregroundColor(.caption)
                }
                .onTapGesture {
                    if viewModel.myTeam == team.teamName {
                        viewModel.myTeam = ""
                    } else {
                        viewModel.myTeam = team.teamName
                    }
                }
            }
            .padding(.vertical, 4)
        }
        .padding(.horizontal, 33)
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
    OnboardingView(isFirstLaunching: .constant(true))
}
