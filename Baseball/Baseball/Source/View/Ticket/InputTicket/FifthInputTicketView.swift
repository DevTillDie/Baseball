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
    
    @State private var todayComment: String = ""
    @State private var currentEmotion = ""
    
    @Binding var currentStatus: InputStatus
    
    private let characterLimit = 95
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("지금 기분이 어떤가요?")
                .foregroundColor(.white)
            
            emotionsGrid
            
            Text("오늘의 경기 한마디!")
                .foregroundColor(.white)
            
            inputComment
            
            Spacer()
            
            NextButton(isActive: true, text: "저장하기") {
                // TODO: Save Data
                isFocused = false
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
                    Image(systemName: viewModel.emotions[index].img)
                        .resizable()
                        .scaledToFit()
                        .background(
                            Circle()
                                .fill(.gray.opacity(0.4))
                                .stroke(currentEmotion == viewModel.emotions[index].text ? .white : .clear)
                        )
                    
                    Text(viewModel.emotions[index].text)
                }
                .onTapGesture {
                    if currentEmotion == viewModel.emotions[index].text {
                        currentEmotion = ""
                    } else {
                        currentEmotion = viewModel.emotions[index].text
                    }
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
    }
    
    private var inputComment: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(.gray.opacity(0.5))
            .overlay(alignment: .top) {
                TextField("", text: $todayComment, axis: .vertical)
                    .focused($isFocused)
                    .colorScheme(.dark)
                    .padding()
                    .onReceive(todayComment.publisher.collect()) {
                        todayComment = String($0.prefix(characterLimit))
                    }
            }
            .overlay(alignment: .bottomTrailing) {
                Text("\(todayComment.count)/95")
                    .foregroundColor(.white)
                    .padding()
            }
            .frame(height: 300)
    }
}

#Preview {
    InputTicketView()
}
