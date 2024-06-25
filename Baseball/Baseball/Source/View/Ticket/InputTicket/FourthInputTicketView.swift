//
//  FourthInputTicketView.swift
//  Baseball
//
//  Created by hyebin on 4/18/24.
//

import SwiftUI

enum Field {
    case ourTeamScore
    case opponentTeamScore
}

struct FourthInputTicketView: View {
    @EnvironmentObject var viewModel: InputTicketViewModel
    @FocusState private var isFocused: Field?
    
    @State private var ourTeamScore = ""
    @State private var opponentTeamScore = ""
    
    var body: some View {
        VStack {
            Text("점수가 어떻게 되었나요?")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            inputScoreView
            
            Spacer()
            
            NextButton(isActive: !ourTeamScore.isEmpty && !opponentTeamScore.isEmpty) {
                isFocused = nil
                viewModel.currentPage += 1
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            isFocused = nil
        }
    }
}

// MARK: - UI

extension FourthInputTicketView {
    private var inputScoreView: some View {
        HStack(alignment: .bottom) {
            inputTeamScore(text: "삼성 라이온즈", score: $ourTeamScore, team: .ourTeamScore)
            
            Text(":")
                .foregroundColor(.white)
                .padding()
            
            inputTeamScore(text: "LG 트윈스", score: $opponentTeamScore, team: .opponentTeamScore)
        }
        .padding()
    }
    
    @ViewBuilder
    private func inputTeamScore(text: String, score: Binding<String>, team: Field) -> some View {
        VStack {
            Text(text)
                .foregroundColor(.white)
            
            TextField("", text: score)
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
                .focused($isFocused, equals: team)
                .colorScheme(.dark)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.gray)
                )
                .onTapGesture {
                    isFocused = team
                }
        }
    }
}

#Preview {
    InputTicketView()
}
