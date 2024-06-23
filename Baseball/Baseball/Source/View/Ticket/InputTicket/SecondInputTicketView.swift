//
//  SecondInputTicketView.swift
//  Baseball
//
//  Created by hyebin on 4/18/24.
//

import SwiftUI

struct Team: Hashable {
    var imageName: String
    var teamName: String
}

struct SecondInputTicketView: View {
    @State private var selectedTeam = ""
    @Binding var currentPage: Int
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    var teams: [Team] = [
        Team(imageName: "house", teamName: "삼성 라이온즈"),
        Team(imageName: "house", teamName: "LG 트윈스"),
        Team(imageName: "house", teamName: "롯데 자이언트"),
        Team(imageName: "house", teamName: "기아 타이거즈"),
        Team(imageName: "house", teamName: "한화 이글스"),
        Team(imageName: "house", teamName: "두산 베어스")
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("어떤 팀과 경기를 했나요?")
            Text("상대팀을 선택해주세요.")
            
            LazyVGrid(columns: columns) {
                ForEach(teams, id: \.self) { team in
                    VStack {
                        Image(systemName: team.imageName)
                            .resizable()
                            .scaledToFit()
                            .padding()
                            .background(
                                Circle()
                                    .fill(selectedTeam == team.teamName ? .gray.opacity(0.8) : .gray.opacity(0.4))
                                    .stroke(selectedTeam == team.teamName ? .black : .clear)
                            )
                        
                        Text(team.teamName)
                    }
                    .onTapGesture {
                        if selectedTeam == team.teamName {
                            selectedTeam = ""
                        } else {
                            selectedTeam = team.teamName
                        }
                    }
                }
            }
            
            Spacer()
            
            Button {
                currentPage += 1
            } label: {
                Text("다음")
                    .frame(maxWidth: .infinity)
            }
            .disabled(selectedTeam.isEmpty)
        }
    }
}

#Preview {
    InputTicketView()
}
