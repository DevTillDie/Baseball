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

// TODO: ourTeam appstorage 에서 가져오기

class InputTicketViewModel: ObservableObject {
    @Published var currentPage = 0
    @Published var date = Date()
    @Published var place = ""
    @Published var ourTeam = "삼성 라이온즈"
    @Published var opponentTeam = ""
    @Published var ourTeamScore = ""
    @Published var opponentTeamScore = ""
    @Published var todayComment = ""
    @Published var currentEmotion = ""
    
    let teams: [Team] = [
        Team(imageName: "house", teamName: "삼성 라이온즈"),
        Team(imageName: "house", teamName: "LG 트윈스"),
        Team(imageName: "house", teamName: "롯데 자이언트"),
        Team(imageName: "house", teamName: "기아 타이거즈"),
        Team(imageName: "house", teamName: "한화 이글스"),
        Team(imageName: "house", teamName: "두산 베어스")
    ]
    
    let emotions: [(img: String, text: String)] = [
        ("", "화나요"),
        ("", "평범해요"),
        ("", "신나요")
    ]
    
    func saveData() {
        //TODO: Realm 저장
        
        print("date: \(date.dateToString())")
        print("place: \(place)")
        print("ourTeam: \(ourTeam)")
        print("opponentTeam: \(opponentTeam)")
        print("ourTeamScore: \(ourTeamScore)")
        print("opponentTeamScore: \(opponentTeamScore)")
        print("todayComment: \(todayComment)")
        print("currentEmotion: \(currentEmotion)")
    }
}
