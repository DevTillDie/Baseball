//
//  MainView.swift
//  Baseball
//
//  Created by Nayeon Kim on 2/21/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
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
                    Button {
                        // action
                    } label: {
                        Text("선호 구단")
                            .bold()
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
                Text("티켓")
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                TicketCarouselView()
            }
            .padding(20)
    }
}

#Preview {
    MainView()
}
