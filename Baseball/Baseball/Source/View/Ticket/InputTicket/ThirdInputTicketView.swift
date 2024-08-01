//
//  ThirdInputTicketView.swift
//  Baseball
//
//  Created by hyebin on 4/18/24.
//

import SwiftUI

struct ThirdInputTicketView: View {
    @EnvironmentObject var viewModel: InputTicketViewModel
    
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        VStack(alignment: .leading) {
            titleText
            
            teamsGrid
            
            Spacer()
            
            NextButton(isActive: !viewModel.opponentTeam.isEmpty) {
                viewModel.currentPage += 1
            }
        }
    }
}

// MARK: - UI

extension ThirdInputTicketView {
    private var titleText: some View {
        VStack {
            Text("어떤 팀과 경기를 했나요?")
            
            Text("상대팀을 선택해주세요.")
        }
        .foregroundColor(.white)
    }
    
    private var teamsGrid: some View {
        LazyVGrid(columns: columns) {
            ForEach(viewModel.teams, id: \.self) { team in
                VStack {
                    Image(systemName: team.imageName)
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .modifier(SelectedCircle(isSelected: viewModel.opponentTeam == team.teamName))
                    
                    Text(team.teamName)
                        .foregroundColor(.white)
                }
                .onTapGesture {
                    if viewModel.opponentTeam == team.teamName {
                        viewModel.opponentTeam = ""
                    } else {
                        viewModel.opponentTeam = team.teamName
                    }
                }
            }
        }
    }
}

#Preview {
    InputTicketView(moveTicketView: .constant(false))
}
