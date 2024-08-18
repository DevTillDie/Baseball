//
//  FifthInputTicketView.swift
//  Baseball
//
//  Created by hyebin on 6/25/24.
//

import SwiftUI

struct FifthInputTicketView: View {
    @EnvironmentObject var viewModel: InputTicketViewModel
    @FocusState private var isFocused: Bool

    @Binding var currentStatus: InputStatus
    
    private let titleLimit = 10
    private let commentLimit = 95
    private let titlePlaceholder = "오늘의 경기, 제목을 정해봐요 (10자 이내)"
    private let commentPlaceholder = "오늘의 경기, 한 줄 요약 해볼까요?"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("지금 기분이 어떤가요?")
                .foregroundColor(.white)
            
            emotionsGrid
            
            Text("오늘의 경기 한마디!")
                .foregroundColor(.white)
            
            inputTitle
            
            inputComment
            
            Spacer()
            
            NextButton(isActive: true, text: "저장하기") {
                isFocused = false
                viewModel.saveData()
                currentStatus = .saving
            }
            
        }
        .contentShape(Rectangle())
        .onTapGesture {
            isFocused = false
        }
    }
}

// MARK: - UI

extension FifthInputTicketView {
    private var emotionsGrid: some View {
        LazyHGrid(rows: [GridItem(.flexible())]) {
            ForEach(0..<3, id: \.self) { index in
                VStack {
                    Text(viewModel.emotions[index].img)
                        .font(.system(size: 32))
                        .padding()
                        .modifier(SelectedCircle(isSelected: viewModel.currentEmotion == viewModel.emotions[index].text))

                    Text(viewModel.emotions[index].text)
                        .foregroundStyle(.white)
                }
                .onTapGesture {
                    if viewModel.currentEmotion == viewModel.emotions[index].text {
                        viewModel.currentEmotion = ""
                    } else {
                        viewModel.currentEmotion = viewModel.emotions[index].text
                    }
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
    }
    
    private var inputTitle: some View {
        TextField(titlePlaceholder, text: $viewModel.todayTitle)
            .focused($isFocused)
            .padding()
            .colorScheme(.dark)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.gray.opacity(0.4))
            }
            .onChange(of: viewModel.todayTitle) {
                if viewModel.todayTitle.count > titleLimit {
                    viewModel.todayTitle = String(viewModel.todayTitle.prefix(titleLimit))
                }
            }
    }
    
    private var inputComment: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(.gray.opacity(0.5))
            .overlay(alignment: .top) {
                TextField(commentPlaceholder, text: $viewModel.todayComment, axis: .vertical)
                    .focused($isFocused)
                    .colorScheme(.dark)
                    .padding()
                    .onChange(of: viewModel.todayComment) {
                        if viewModel.todayComment.count > commentLimit {
                            viewModel.todayComment = String(viewModel.todayComment.prefix(commentLimit))
                        }
                    }
                
            }
            .overlay(alignment: .bottomTrailing) {
                Text("\(viewModel.todayComment.count)/95")
                    .foregroundColor(.white)
                    .padding()
            }
            .frame(height: 300)
    }
}

#Preview {
    InputTicketView(moveTicketView: .constant(false))
}
