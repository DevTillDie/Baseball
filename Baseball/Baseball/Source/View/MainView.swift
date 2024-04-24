//
//  MainView.swift
//  Baseball
//
//  Created by Nayeon Kim on 2/21/24.
//

import SwiftUI

struct MainView: View {
    // TODO: 티켓 데이터 대한 임시 변수 -> Realm 연결 후 삭제
    private let ticketData = [TicketData(), TicketData(), TicketData(), TicketData(), TicketData()]
//    private let ticketData: [TicketData] = []
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.background)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 0) {
                        mainHeader
                        
                        addTicketSection
                        
                        divider
                        
                        ticketDisplayView
                    }
                    .padding(16)
                }
            }
        }
    }
}

// MARK: - mainHeader

extension MainView {
    @ViewBuilder private var mainHeader: some View {
        Text("최강 삼성!")
            .font(.system(size: 20))
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 12)
            .padding(.bottom, 16)
    }
}

// MARK: - addTicketSection

extension MainView {
    @ViewBuilder private var addTicketSection: some View {
        VStack {
            Text("새로운 경기를 봤나요?")
                .font(.system(size: 16))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 24)
                .padding(.vertical, 20)
            
            Spacer()
        }
        .frame(height: 180)
        .background {
            RoundedRectangle(cornerRadius: 15.0)
                .fill(.box)
        }
        .padding(.bottom, 28)
    }
}

// MARK: - divider

extension MainView {
    @ViewBuilder private var divider: some View {
        Rectangle()
            .fill(.divder)
            .frame(height: 1)
            .padding(.bottom, 20)
    }
}

// MARK: - ticketDisplayView

extension MainView {
    @ViewBuilder private var ticketDisplayView: some View {
        VStack {
            Text("티켓")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 12)
            
            if ticketData.isEmpty {
                noTicketView
            } else {
                VStack(spacing: 0) {
                    ticketTags
                    ticketPreviewStack
                }
            }
        }
    }
}

// MARK: - noTicketView

extension MainView {
    //TODO: Realm 연결
    @ViewBuilder private var noTicketView: some View {
        VStack {
            Spacer(minLength: 160)
            
            Text("아직 저장된 티켓이 없어요!")
            Text("야구 경기를 보러 갈까요?")
        }
        .foregroundColor(.caption)
        .font(.system(size: 16))
        .frame(maxHeight: .infinity)
    }
}

// MARK: - ticket

extension MainView {
    @ViewBuilder private var ticketTags: some View {
        HStack {
            Button {
                // action
            } label: {
                Text("승요")
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
            }
            .buttonStyle(.plain)
            .background {
                RoundedRectangle(cornerRadius: 15.0)
                    .fill(.tag)
            }
            
            Button {
                // action
            } label: {
                Text("우리팀")
                    .padding(.horizontal, 20)
                    .padding(.vertical, 4)
            }
            .buttonStyle(.plain)
            .background {
                RoundedRectangle(cornerRadius: 15.0)
                    .fill(.tag)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 12)
        .padding(.bottom, 16)
    }
}

// MARK: - ticketPreviewStack

extension MainView {
    @ViewBuilder private var ticketPreviewStack: some View {
        ForEach(ticketData) { data in
            VStack(spacing: 0) {
                HStack {
                    Text(data.ourTeam)
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(data.opponentTeam)
                        .font(.system(size: 15))
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(.bottom, 20)
                
                VStack(spacing: 0) {
                    Text("\(data.ourTeamScore) : \(data.opponentTeamScore)")
                        .font(.system(size: 48))
                        .fontWeight(.heavy)
                    
                    Text(data.date)
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                }
            }
            .foregroundColor(.white)
            .padding(.horizontal, 14)
            .padding(.top, 16)
            .padding(.bottom, 28)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.team)
                    
            }
            .padding(.horizontal, 9)
            .padding(.bottom, 12)
        }
    }
}

// MARK: - data

extension MainView {
    struct TicketData: Identifiable {
        let id = UUID()
        let date: String = "24.02.02"
        let place: String = "고척"
        let ourTeam: String = "SAMSUNG LIONS"
        let opponentTeam: String = "LG TWINS"
        let ourTeamScore: Int = 3
        let opponentTeamScore: Int = 1
        let feeling: String = "Good"
        let review: String = "NICE"
    }
}

#Preview {
    MainView()
}
