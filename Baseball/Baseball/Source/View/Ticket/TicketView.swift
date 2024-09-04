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
    
    //TODO: Model로 처리하기
    private let date = "24.02.22"
    private let ourTeam = "SAMSUNG LIONS"
    private let opponentTeam = "LG TWINS"
    private let ourTeamScore = "3"
    private let opponentTeamScore = "1"
    private let location = "고척돔"
    private let title = "제목"
    private let review = "내용"
    
    private let ourTeamColor: Color = .lions
    private let opponentTeamColor: Color = .twins
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack {
               backButton
                
                ticket(isShare: false)
                
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
    
    @ViewBuilder
    private func ticket(isShare: Bool) -> some View {
        VStack(spacing: 0) {
            resultview(isShare)
            
            dividerView(isShare)
                      
            reviewView(isShare)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private var shareButton: some View {
        Button {
            if let img = renderShareView() {
                viewModel.shareInstagram(image: img)
            }
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
    @ViewBuilder
    private func resultview(_ isShare: Bool) -> some View {
        VStack(spacing: 6) {
            Text(date)
                .font(.system(size: 15))
            
            Text("\(ourTeamScore) : \(opponentTeamScore)")
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
            if isShare {
                Color.black.opacity(0.15)
            } else {
                LinearGradient(gradient: Gradient(colors: [ourTeamColor, opponentTeamColor]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
            }
        }
        .modifier(TicketStroke(cornerRadius: 8, cutRadius: 40, isShare: isShare))
    }
    
    private var teamInfoView: some View {
        HStack {
            Text(ourTeam)
                .font(.system(size: 15))
                .fontWeight(.semibold)
                .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            
            HLine()
                .stroke(style: .init(dash: [3]))
                .foregroundStyle(.line)
                .frame(height: 1)
            
            Text(opponentTeam)
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
                team: ourTeam,
                image: "cloud.sleet",
                infoTitle: "Location",
                info: location
            )
            
            Spacer(minLength: 30)
            
            resultInfo(
                teamTitle: "Opposing team",
                team: opponentTeam,
                image: "envelope.open",
                infoTitle: "Lucky",
                info: "승요"
            )
            Spacer()
        }
        .frame(maxWidth: .infinity)
        
    }
    
    @ViewBuilder
    private func dividerView(_ isShare: Bool) -> some View {
        HLine()
            .stroke(style: .init(dash: [6]))
            .foregroundStyle(.line)
            .frame(height: 1)
            .background {
                if isShare {
                    Color.black.opacity(0.15)
                } else {
                    LinearGradient(gradient: Gradient(colors: [ourTeamColor, opponentTeamColor]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                }
            }
            .padding(.horizontal, 8)
            .zIndex(1)
    }
    
    @ViewBuilder
    private func reviewView(_ isShare: Bool) -> some View {
        VStack {
            Text(title)
                .padding(.bottom, 4)
            
            Text(review)
                .multilineTextAlignment(.leading)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(28)
        .background {
            if isShare {
                Color.black.opacity(0.15)
            } else {
                LinearGradient(gradient: Gradient(colors: [ourTeamColor, opponentTeamColor]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
            }
        }
        .modifier(TicketStroke(cornerRadius: 8, cutRadius: 0, isShare: isShare, isRemoveTop: true))
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

// MARK: - Share Image
extension TicketView {
    private func renderShareView() -> UIImage? {
        return ticket(isShare: true)
            .foregroundColor(.text)
            .padding()
            .background(.clear)
            .render(scale: 2)
    }
}

#Preview {
    MainView()
}
