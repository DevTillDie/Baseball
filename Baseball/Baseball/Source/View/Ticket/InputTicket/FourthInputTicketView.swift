//
//  FourthInputTicketView.swift
//  Baseball
//
//  Created by hyebin on 4/18/24.
//

import SwiftUI

struct FourthInputTicketView: View {
    @State private var todayCommet = ""
    @State private var currentEmotion = ""
    
    @Binding var currentPage: Int
    
    private let emotions: [(img: String, text: String)] = [
        ("", "화나요"),
        ("", "평범해요"),
        ("", "신나요")
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("지금 기분이 어떤가요?")
            
            LazyHGrid(rows: [GridItem(.flexible())]) {
                ForEach(0..<3, id: \.self) { index in
                    VStack {
                        Image(systemName: emotions[index].img)
                            .resizable()
                            .scaledToFit()
                            .background(
                                Circle()
                                    .fill(currentEmotion == emotions[index].text ? .gray.opacity(0.8) : .gray.opacity(0.4))
                                    .stroke(currentEmotion == emotions[index].text ? .black : .clear)
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
        
            Text("오늘의 경기 한마디!")
            RoundedRectangle(cornerRadius: 8)
                .fill(.gray.opacity(0.5))
                .overlay(alignment: .top) {
                    TextField("", text: $todayCommet, axis: .vertical)
                        .padding()
                }
                
            Spacer()
            
            Button {
                // TODO: Save Data
                // TODO: Move To ComplteTicketView
            } label: {
                Text("저장하기")
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    InputTicketView()
}
