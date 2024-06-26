//
//  GroupSelectionView.swift
//  Baseball
//
//  Created by Nayeon Kim on 2/21/24.
//

import SwiftUI

// TODO: 파일 분리하기
enum Team: String {
    case lions = "삼성 라이온즈"
    case twins = "LG 트윈스"
    case giants = "롯데 자이언츠"
    case tigers = "기아 타이거즈"
    case eagles = "한화 이글스"
    case bears = "두산 베어스"
}

struct TeamSelectionView: View {
    @AppStorage("myTeam") var myTeam: Team?
    
    private var columns = [
        GridItem(spacing: 12),
        GridItem(spacing: 12),
        GridItem(spacing: 12),
    ]
    private let teams: [Team] = [.lions, .twins, .giants, .tigers, .eagles, .bears]
    
    var body: some View {
        VStack(spacing: 72) {
            selectionDesciption
            groupSelectionSection
        }
        .padding(20)
    }
}

extension TeamSelectionView {
    @ViewBuilder private var selectionDesciption: some View {
        VStack(spacing: 20) {
            Text("어느 팀을 응원하세요?")
                .font(.title)
                .bold()
            
            VStack {
                Text("팀을 선택하고")
                Text("나에게 맞는 홈을 받아보세요.")
            }
        }
    }
}

extension TeamSelectionView {
    @ViewBuilder private var groupSelectionSection: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(teams, id: \.self) { team in
                VStack(spacing: 8) {
                    Button {
                        myTeam = team
                    } label: {
                        VStack {
                            ZStack {
                                Circle()
                                    .fill(myTeam == team ? Color(UIColor.systemGray) : Color(UIColor.systemGray4))
                                Text("🏁")
                                    .font(.largeTitle)
                            }
                            Text(team.rawValue)
                                .font(.caption)
                                .foregroundColor(myTeam == team ? .black : .gray)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    TeamSelectionView()
}
