//
//  SecondInputTicketView.swift
//  Baseball
//
//  Created by hyebin on 4/18/24.
//

import SwiftUI

struct SecondInputTicketView: View {
    @EnvironmentObject var viewModel: InputTicketViewModel
    
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        VStack(alignment: .leading) {
            titleText
            
            teamsGrid
            
            Spacer()
            
            NextButton(isActive: !viewModel.ourTeam.isEmpty) {
                viewModel.currentPage += 1
            }
        }
    }
}

// MARK: - UI

extension SecondInputTicketView {
    private var titleText: some View {
        VStack {
            Text("어떤 팀과 경기를 했나요?")
            
            Text("우리팀을 선택해주세요.")
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
                        .modifier(SelectedCircle(isSelected: viewModel.ourTeam == team.teamName))
                    
                    Text(team.teamName)
                        .foregroundColor(.white)
                }
                .onTapGesture {
                    if viewModel.ourTeam == team.teamName {
                        viewModel.ourTeam = ""
                    } else {
                        viewModel.ourTeam = team.teamName
                    }
                }
            }
        }
    }
}

#Preview {
    InputTicketView(moveTicketView: .constant(false))
}
