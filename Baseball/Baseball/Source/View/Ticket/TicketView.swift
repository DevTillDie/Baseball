//
//  TicketView.swift
//  Baseball
//
//  Created by hyebin on 4/18/24.
//

import SwiftUI

struct TicketView: View {
    @StateObject private var viewModel = TicketViewModel()
    
    @Binding var moveTicketView: Bool
    
    let data: Ticket
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack {
               backButton
                
                ticket
                
                shareButton
            }
            .padding(.horizontal, 24)
            .foregroundColor(.text)
        }
    }
}

// MARK: - UI
extension TicketView {
    private var backButton: some View {
        Button {
            withAnimation {
                moveTicketView = false
            }
        } label: {
            HStack(spacing: 4) {
                Image(systemName: "chevron.left")
                Text("메인화면")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 40)
    }
    
    private var ticket: some View {
        VStack(spacing: 0) {
            resultview
            
            dividerView
                      
            reviewView
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private var shareButton: some View {
        Button {
            viewModel.shareInstagram()
        } label: {
            Text("공유하기")
                .padding()
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.white, lineWidth: 2)
                }
        }
    }
}

extension TicketView {
    private var resultview: some View {
        VStack(spacing: 6) {
            Text(data.date)
                .font(.system(size: 15))
            
            Text("\(data.ourTeamScore) : \(data.opponentTeamScore)")
                .font(.system(size: 48))
            
            teamInfoView
            
            Divider()
                .frame(minHeight: 1)
                .background(.white)
                .padding()
               
            resultInfoView
        }
        .padding(.top, 60)
        .padding(.bottom, 30)
        .background {
            LinearGradient(gradient: Gradient(colors: [Color.colorTeam(data.ourTeam), Color.colorTeam(data.opponentTeam)]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
        }
        .modifier(TicketStroke(cornerRadius: 8, cutRadius: 40))
    }
    
    private var teamInfoView: some View {
        HStack {
            Text(data.ourTeam)
                .font(.system(size: 15))
                .fontWeight(.semibold)
                .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            
            HLine()
                .stroke(style: .init(dash: [3]))
                .foregroundStyle(.line)
                .frame(height: 1)
            
            Text(data.opponentTeam)
                .font(.system(size: 15))
                .fontWeight(.semibold)
                .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        }
        .padding(.horizontal)
    }
    
    private var resultInfoView: some View {
        HStack {
            Spacer()
            
            resultInfo(
                teamTitle: "Our team",
                team: data.ourTeam,
                image: "cloud.sleet",
                infoTitle: "Location",
                info: data.place
            )
            
            Spacer(minLength: 30)
            
            resultInfo(
                teamTitle: "Opposing team",
                team: data.opponentTeam,
                image: "envelope.open",
                infoTitle: "Lucky",
                info: "승요"
            )
            Spacer()
        }
        .frame(maxWidth: .infinity)
        
    }
    
    private var dividerView: some View {
        HLine()
            .stroke(style: .init(dash: [6]))
            .foregroundStyle(.line)
            .frame(height: 1)
            .background {
                LinearGradient(gradient: Gradient(colors: [Color.colorTeam(data.ourTeam), Color.colorTeam(data.opponentTeam)]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
            }
            .padding(.horizontal, 8)
            .zIndex(1)
    }
    
    private var reviewView: some View {
        VStack {
            Text(data.title)
                .padding(.bottom, 4)
            
            Text(data.review)
                .multilineTextAlignment(.leading)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(28)
        .background {
            LinearGradient(gradient: Gradient(colors: [Color.colorTeam(data.ourTeam), Color.colorTeam(data.opponentTeam)]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
        }
        .modifier(TicketStroke(cornerRadius: 8, cutRadius: 0))
        .padding(.bottom, 32)
    }
}

// MARK: - ViewBuilder
extension TicketView {
    @ViewBuilder
    private func resultInfo(
        teamTitle: String, team: String, image: String,
        infoTitle: String, info: String
    ) -> some View {
        VStack(spacing: 6) {
            Text(teamTitle)
                .font(.system(size: 20))
            
            Text(team)
                .font(.system(size: 16))
            
            Image(systemName: image)
                .font(.system(size: 30))
                .padding(.bottom, 30)
            
            Text(infoTitle)
                .font(.system(size: 20))
            
            Text(info)
                .font(.system(size: 16))
        }
    }
}

#Preview {
    MainView()
}
