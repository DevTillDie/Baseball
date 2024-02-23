//
//  MainView.swift
//  Baseball
//
//  Created by Nayeon Kim on 2/21/24.
//

import SwiftUI

struct MainView: View {
    @State var sortingType = "최신순"
    
    private let sortingByNewLabel = "최신순"
    private let sortingByOldLabel = "오래된순"
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 12) {
                    addTicketSection
                        .background {
                            RoundedRectangle(cornerRadius: 15.0)
                                .fill(Color(UIColor.secondarySystemBackground))
                        }
                    
                    ticketDisplayView
                        .background {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color(UIColor.secondarySystemBackground))
                        }
                }
                .padding(16)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text("RUSH!")
                            .fontWeight(.heavy)
                            .italic()
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: TeamSelectionView()) {
                            Text("선호 구단")
                                .bold()
                        }
                    }
                }
            }
        }
    }
}

extension MainView {
    @ViewBuilder private var addTicketSection: some View {
            VStack(spacing: 12) {
                Text("새로운 경기를 봤나요?")
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Image(.ticket)
                
                Button {
                    // action
                } label: {
                    Text("티켓 추가하기")
                        .foregroundColor(.black)
                        .padding(4)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(Color(UIColor.lightGray))
            }
            .padding(20)
    }
}

extension MainView {
    @ViewBuilder private var ticketDisplayView: some View {
            VStack(spacing: 12) {
                HStack {
                    Text("티켓")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Menu {
                        Button {
                            sortingType = sortingByOldLabel
                        } label: {
                            Text(sortingByOldLabel)
                        }
                        
                        Button {
                            sortingType = sortingByNewLabel
                        } label: {
                            Text(sortingByNewLabel)
                        }
                    } label: {
                        Label(sortingType, systemImage: "chevron.down")
                    }
                }
                
                ForEach(0..<5) { _ in
                    smallTicket
                }
            }
            .padding(20)
    }
}


extension MainView {
    // TODO: 컴포넌트화
    @ViewBuilder private var smallTicket: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4.0)
            
            HStack(spacing: 32) {
                VStack(spacing: 12) {
                    Image(.team)
                    Text("패-오예주")
                }
                
                VStack {
                    Text("1 : 3")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    Text("24.02.22")
                }
                
                VStack(spacing: 12) {
                    Image(.team)
                    Text("승-유혜빈")
                }
            }
            .foregroundColor(.white)
            .padding()
        }
    }
}

#Preview {
    MainView()
}
