//
//  InputTicketViewModel.swift
//  Baseball
//
//  Created by hyebin on 6/25/24.
//

import SwiftUI

enum InputStatus {
    case writing
    case saving
    case done
}

class InputTicketViewModel: ObservableObject {
    @Published var currentPage = 0
    @Published var date = Date()
    @Published var place = ""
    @Published var ourTeam = UserDefaults.standard.string(forKey: "myTeam")!
    @Published var opponentTeam = ""
    @Published var ourTeamScore = ""
    @Published var opponentTeamScore = ""
    @Published var todayTitle = ""
    @Published var todayComment = ""
    @Published var currentEmotion = ""
    
    let teams: [Team] = [
        Team(imageName: "lionsIcon", teamName: "삼성 라이온즈"),
        Team(imageName: "twinsIcon", teamName: "LG 트윈스"),
        Team(imageName: "giantsIcon", teamName: "롯데 자이언츠"),
        Team(imageName: "tigersIcon", teamName: "기아 타이거즈"),
        Team(imageName: "eaglesIcon", teamName: "한화 이글스"),
        Team(imageName: "bearsIcon", teamName: "두산 베어스")
    ]
    
    let emotions: [(img: String, text: String)] = [
        ("😡", "화나요"),
        ("😗", "평범해요"),
        ("😍", "신나요")
    ]
    
    func getTicketData() -> Ticket {
        return Ticket(
            date: date.dateToString(),
            place: place,
            ourTeam: ourTeam,
            opponentTeam: opponentTeam,
            ourTeamScore: Int(ourTeamScore) ?? 0,
            opponentTeamScore: Int(opponentTeamScore) ?? 0,
            feeling: currentEmotion,
            result: setTodayResult(),
            title: todayTitle,
            review: todayComment
        )
    }
      
    private func setTodayResult() -> String {
        if Int(ourTeamScore) ?? 0 > Int(opponentTeamScore) ?? 0 {
            return "승요"
        } else if Int(ourTeamScore) ?? 0 < Int(opponentTeamScore) ?? 0 {
            return "패요"
        } else {
            return "동요"
        }
    }
    
    func saveData() {
        RealmManager.shared.saveTicketData(
            Ticket(
                date: date.dateToString(), 
                place: place,
                ourTeam: ourTeam,
                opponentTeam: opponentTeam,
                ourTeamScore: Int(ourTeamScore) ?? 0,
                opponentTeamScore: Int(opponentTeamScore) ?? 0,
                feeling: currentEmotion, 
                result: setTodayResult(),
                title: todayTitle,
                review: todayComment
            )
        )
    }
}
