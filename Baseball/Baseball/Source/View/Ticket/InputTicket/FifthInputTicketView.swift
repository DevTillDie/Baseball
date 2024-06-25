//
//  FifthInputTicketView.swift
//  Baseball
//
//  Created by hyebin on 6/25/24.
//

import SwiftUI

struct FifthInputTicketView: View {
    @FocusState private var isFocused: Bool
    
    @State private var todayCommet: String = ""
    @State private var currentEmotion = ""
    
    @Binding var currentPage: Int
    
    private let characterLimit = 95
    
    private let emotions: [(img: String, text: String)] = [
        ("", "화나요"),
        ("", "평범해요"),
        ("", "신나요")
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("지금 기분이 어떤가요?")
                .foregroundColor(.white)
            
            LazyHGrid(rows: [GridItem(.flexible())]) {
                ForEach(0..<3, id: \.self) { index in
                    VStack {
                        Image(systemName: emotions[index].img)
                            .resizable()
                            .scaledToFit()
                            .background(
                                Circle()
                                    .fill(.gray.opacity(0.4))
                                    .stroke(currentEmotion == emotions[index].text ? .white : .clear)
                            )
                        
                        Text(emotions[index].text)
                    }
                    .onTapGesture {
                        if currentEmotion == emotions[index].text {
                            currentEmotion = ""
                        } else {
                            currentEmotion = emotions[index].text
                        }
                    }
                    .padding()
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            
            Text("오늘의 경기 한마디!")
                .foregroundColor(.white)
            
            RoundedRectangle(cornerRadius: 8)
                .fill(.gray.opacity(0.5))
                .overlay(alignment: .top) {
                    TextField("", text: $todayCommet, axis: .vertical)
                        .focused($isFocused)
                        .colorScheme(.dark)
                        .padding()
                        .onReceive(todayCommet.publisher.collect()) {
                            todayCommet = String($0.prefix(characterLimit))
                        }
                }
                .overlay(alignment: .bottomTrailing) {
                    Text("\(todayCommet.count)/95")
                        .foregroundColor(.white)
                        .padding()
                }
                .frame(height: 300)
            
            Spacer()
            
            NextButton(isActive: true, text: "저장하기") {
                // TODO: Save Data
                // TODO: Move To ComplteTicketView
                isFocused = false
                currentPage += 1
            }
            
        }
        .contentShape(Rectangle())
        .onTapGesture {
            isFocused = false
        }
    }
}

#Preview {
    InputTicketView()
}
