//
//  MainView.swift
//  Baseball
//
//  Created by Nayeon Kim on 2/21/24.
//

import SwiftUI

struct MainView: View {
    @State private var moveInputTicketView = false
    @State private var moveTicketView = false
    @State private var data: TicketData?
    @State private var isAnimating = false
    
    // TODO: 티켓 데이터 대한 임시 변수 -> Realm 연결 후 삭제
    private let ticketData = [TicketData(), TicketData(), TicketData(), TicketData(), TicketData()]
//    private let ticketData: [TicketData] = []
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.background)
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 0) {
                        mainHeader
                        
                        addTicketSection
                        
                        ticketDisplayView
                    }
                    .padding(16)
                }
                
                VStack {
                    Spacer()
                    
                    VisualEffectView(effect: UIBlurEffect(style: .dark))
                        .mask(LinearGradient(colors: [
                            Color.black,
                            Color.black,
                            Color.black.opacity(0.9),
                            Color.black.opacity(0.8),
                            Color.black.opacity(0.6),
                            Color.black.opacity(0.4),
                            Color.black.opacity(0.2),
                            Color.clear
                        ], startPoint: .bottom, endPoint: .top))
                        .frame(height: 154)
                }
                .ignoresSafeArea()
                
                if moveTicketView {
                    TicketView(moveTicketView: $moveTicketView)
                        .zIndex(2)
                        .transition(.asymmetric(insertion: .move(edge: .bottom).combined(with: .opacity), removal: .move(edge: .trailing).combined(with: .opacity)))
                        .animation(.easeInOut, value: moveTicketView)
                }
                
                addTicketButton
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                    .padding(.trailing, 17)
            }
        }
    }
}

// MARK: - mainHeader

extension MainView {
    private var mainHeader: some View {
        Text("RUSH!")
            .font(.system(size: 20))
            .italic()
            .fontWeight(.heavy)
            .foregroundStyle(.text)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 12)
            .padding(.bottom, 20)
    }
}

// MARK: - addTicketSection

extension MainView {
    private var addTicketSection: some View {
        ZStack {
            ZStack {
                Path { path in
                    path.move(to: CGPoint(x: 15, y: 0))
                    
                    path.addLine(to: CGPoint(x: 343, y: 0))
                    path.addArc(center: CGPoint(x: 343, y: 15), radius: 15, startAngle: .degrees(-90), endAngle: .degrees(0), clockwise: false)
                    
                    path.addLine(to: CGPoint(x: 358, y: 160))
                    path.addArc(center: CGPoint(x: 343, y: 160), radius: 15, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: false)
                    
                    path.addLine(to: CGPoint(x: 194, y: 175))
                    path.addArc(center: CGPoint(x: 209, y: 160), radius: 15, startAngle: .degrees(90), endAngle: .degrees(180), clockwise: false)
                    
                    path.addLine(to: CGPoint(x: 194, y: 129))
                    path.addArc(center: CGPoint(x: 167, y: 156), radius: 27, startAngle: .degrees(0), endAngle: .degrees(-90), clockwise: true)
                    
                    path.addLine(to: CGPoint(x: 15, y: 129))
                    path.addArc(center: CGPoint(x: 15, y: 114), radius: 15, startAngle: .degrees(90), endAngle: .degrees(180), clockwise: false)
                    
                    path.addLine(to: CGPoint(x: 0, y: 15))
                    path.addArc(center: CGPoint(x: 15, y: 15), radius: 15, startAngle: .degrees(180), endAngle: .degrees(270), clockwise: false)
                    
                    path.closeSubpath()
                }
                .fill(.box)
                
                ZStack {
                    VStack(spacing: 8) {
                        Text("새로운 경기를 봤나요?")
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("기록해서 티켓을 만들어요!")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .foregroundStyle(.text)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding(.top, 12)
                    
                    Image(.addTicket)
                        .resizable()
                        .frame(maxWidth: 189, maxHeight: 137)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.top, 25)
                }
                .padding(.leading, 16)
                .padding(.trailing, 5)
            }
            
            VStack {
                Spacer()
                
                Button {
                    moveInputTicketView = true
                } label: {
                    Text("경기 기록하기")
                        .foregroundStyle(.label)
                        .padding(.horizontal, 47)
                        .padding(.vertical, 8)
                        .background {
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                .fill(.clear)
                                .stroke(.stroke)
                        }
                        .frame(maxWidth: .infinity, alignment: .bottomLeading)
                }
                .navigationDestination(isPresented: $moveInputTicketView) {
                    InputTicketView(moveTicketView: $moveTicketView)
                        .navigationBarBackButtonHidden()
                }
            }
            .frame(height: 175)
        }
        .padding(.bottom, 31)
    }
}

// MARK: - ticketDisplayView

extension MainView {
private var ticketDisplayView: some View {
        VStack {
            Text("티켓")
                .font(.system(size: 20))
                .fontWeight(.medium)
                .foregroundStyle(.text)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 12)
            
            if ticketData.isEmpty {
                ticketTags
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
    private var noTicketView: some View {
        VStack {
            Text("아직 저장된 티켓이 없어요")
            Text("경기를 기록해주세요!")
        }
        .foregroundStyle(.caption)
        .frame(height: 160)
        .frame(maxWidth: .infinity)
        .background {
            LinearGradient(gradient: Gradient(colors: [.noTicketGradient1, .noTicketGradient2]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
        }
        .clipShape(TicketShape(cornerRadius: 8, cutRadius: 40))
        .modifier(TicketStroke(cornerRadius: 8, cutRadius: 40))
        .padding(.horizontal, 9)
        .padding(.bottom, 16)
    }
}

// MARK: - ticketTags

extension MainView {
    private var ticketTags: some View {
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
                    .fill(.clear)
                    .stroke(ticketData.isEmpty ? .caption : .stroke)
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
                    .fill(.clear)
                    .stroke(ticketData.isEmpty ? .caption : .stroke)
            }
        }
        .foregroundStyle(ticketData.isEmpty ? .caption : .text)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 12)
        .padding(.bottom, 16)
    }
}

// MARK: - ticketPreviewStack

extension MainView {
    private var ticketPreviewStack: some View {
        ForEach(ticketData) { data in
            Button {
                withAnimation {
                    moveTicketView = true
                }
                self.data = data
            } label: {
                VStack(spacing: 0) {
                    VStack(spacing: 0) {
                        Text(data.date)
                            .font(.system(size: 15))
                            .fontWeight(.medium)
                        
                        Text("\(data.ourTeamScore) : \(data.opponentTeamScore)")
                            .font(.system(size: 48))
                            .fontWeight(.heavy)
                    }
                    
                    HStack {
                        Text(data.ourTeam.rawValue)
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        
                        HLine()
                            .stroke(style: .init(dash: [3]))
                            .foregroundStyle(.line)
                            .frame(height: 1)
                            .padding(.horizontal, 16)
                        
                        Text(data.opponentTeam.rawValue)
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    }
                    .padding(.top, 13)
                }
                .foregroundColor(.text)
                .padding(.horizontal, 14)
                .padding(.top, 38)
                .padding(.bottom, 17)
                .frame(height: 160)
                .background {
                    LinearGradient(gradient: Gradient(colors: [data.ourTeam.colorTeam(), data.opponentTeam.colorTeam()]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                }
                .clipShape(TicketShape(cornerRadius: 8, cutRadius: 40))
                .modifier(TicketStroke(cornerRadius: 8, cutRadius: 40))
                .padding(.horizontal, 9)
                .padding(.bottom, 16)
            }
        }
    }
}

// MARK: - addTicketButton

extension MainView {
    private var addTicketButton: some View {
        Button {
            moveInputTicketView = true
        } label: {
            Image(.addTicketButton)
                .resizable()
                .frame(width: 68, height: 68)
        }
    }
}

// MARK: - data

extension MainView {
    struct TicketData: Identifiable {
        let id = UUID()
        let date: String = "24.02.02"
        let place: String = "고척"
        let ourTeam: Team = .lions
        let opponentTeam: Team = .twins
        let ourTeamScore: Int = 3
        let opponentTeamScore: Int = 1
        let feeling: String = "Good"
        let review: String = "NICE"
    }
    
    enum Team: String {
        case lions = "SAMSUNG LIONS"
        case eagles = "HANHWA EAGLES"
        case twins = "LG TWINS"
        case giants = "LOTTE GIANTS"
        case tigers = "KIA TIGERS"
        case bears = "DUSAN BEARS"
        
        func colorTeam() -> Color {
            switch self {
            case .lions:
                return Color(.lions)
            case .eagles:
                return Color(.eagles)
            case .twins:
                return Color(.twins)
            case .giants:
                return Color(.giants)
            case .tigers:
                return Color(.tigers)
            case .bears:
                return Color(.bears)
            }
        }
    }
}

#Preview {
    MainView()
}
