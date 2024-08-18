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
    
    var body: some View {
        VStack {
            Text("점수가 어떻게 되었나요?")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            inputScoreView
            
            Spacer()
            
            NextButton(isActive: !viewModel.ourTeamScore.isEmpty && !viewModel.opponentTeamScore.isEmpty) {
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
            inputTeamScore(text: viewModel.ourTeam, score: $viewModel.ourTeamScore, team: .ourTeamScore)
            
            Text(":")
                .foregroundColor(.white)
                .font(.system(size: 40))
                .padding()
            
            inputTeamScore(text: viewModel.opponentTeam, score: $viewModel.opponentTeamScore, team: .opponentTeamScore)
        }
        .padding()
    }
    
    @ViewBuilder
    private func inputTeamScore(text: String, score: Binding<String>, team: Field) -> some View {
        VStack {
            Text(text)
                .foregroundColor(.white)
            
            TextField("0", text: score)
                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
                .focused($isFocused, equals: team)
                .colorScheme(.dark)
                .font(.system(size: 40))
                .padding()
                .onTapGesture {
                    isFocused = team
                }
        }
    }
}

#Preview {
    InputTicketView(moveTicketView: .constant(false))
}
