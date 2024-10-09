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
        VStack(alignment: .leading) {
            Text("어떤 팀과 경기를 했나요?")
                .font(.system(size: 20, weight: .bold))
            
            Text("상대팀을 선택해주세요.")
                .font(.system(size: 16))
        }
        .foregroundColor(.white)
        .padding(.leading, 4)
    }
    
    private var teamsGrid: some View {
        LazyVGrid(columns: columns) {
            ForEach(viewModel.teams, id: \.self) { team in
                VStack {
                    Image(team.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding()
                        .modifier(SelectedCircle(isSelected: viewModel.opponentTeam == team.teamName))
                    
                    Text(team.teamName)
                        .foregroundColor(.white)
                        .font(.system(size: 12))
                }
                .aspectRatio(1, contentMode: .fit)
                .padding(.bottom)
                .onTapGesture {
                    if viewModel.opponentTeam == team.teamName {
                        viewModel.opponentTeam = ""
                    } else {
                        viewModel.opponentTeam = team.teamName
                    }
                }
            }
        }
        .padding(.top, 40)
    }
}

#Preview {
    InputTicketView(moveTicketView: .constant(false))
}
