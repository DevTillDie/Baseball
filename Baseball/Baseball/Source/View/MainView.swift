//
//  MainView.swift
//  Baseball
//
//  Created by Nayeon Kim on 2/21/24.
//

import SwiftUI

struct MainView: View {
    // TODO: 티켓 개수에 대한 임시 변수 -> Realm 연결 후 삭제
    private let ticketCount = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.background)
                    .ignoresSafeArea()
                
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

extension MainView {
    @ViewBuilder private var mainHeader: some View {
        Text("최강 삼성!")
            .font(.system(size: 20))
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 12)
            .padding(.bottom, 15)
    }
}

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

extension MainView {
    @ViewBuilder private var divider: some View {
        Rectangle()
            .fill(.divder)
            .frame(height: 1)
            .padding(.bottom, 20)
    }
}

extension MainView {
    @ViewBuilder private var ticketDisplayView: some View {
        VStack {
            Text("티켓")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 12)
            
            ticketPreview
        }
    }
}

extension MainView {
    //TODO: Realm 연결
    @ViewBuilder private var ticketPreview: some View {
        if ticketCount == 0 {
            VStack {
                Spacer()
                
                Text("아직 저장된 티켓이 없어요!")
                Text("야구 경기를 보러 갈까요?")
                
                Spacer()
                Spacer()
            }
            .foregroundColor(.caption)
            .font(.system(size: 16))
            .frame(maxHeight: .infinity)
        } else {
            Text("티켓 있당")
        }
    }
}

#Preview {
    MainView()
}
