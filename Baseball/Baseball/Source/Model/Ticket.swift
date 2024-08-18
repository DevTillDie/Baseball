//
//  Ticket.swift
//  Baseball
//
//  Created by hyebin on 8/5/24.
//

import SwiftUI
import RealmSwift

/// 티켓 정보
///
/// - id: 티켓의  id
/// - date: 티켓 작성 날짜
/// - place: 관람 장소
/// - ourTeam: 우리 팀
/// - opponentTeam: 상대 팀
/// - ourTeamScore: 우리 팀 점수
/// - opponentTeamScore: 상대 팀 점수
/// - feeling: 기분
/// - title: 관람 후기 제목
/// - review: 관람 후기
///
/// - winner: 우리 팀이 이긴 경우 true
class Ticket: Object {
    @Persisted var id = UUID()
    @Persisted var date: String
    @Persisted var place: String
    @Persisted var ourTeam: String
    @Persisted var opponentTeam: String
    @Persisted var ourTeamScore: Int
    @Persisted var opponentTeamScore: Int
    @Persisted var feeling: String
    @Persisted var title: String
    @Persisted var review: String
    
    var winner: Bool {
        return ourTeamScore > opponentTeamScore
    }
    
    convenience init(date: String, place: String, ourTeam: String, opponentTeam: String, ourTeamScore: Int, opponentTeamScore: Int, feeling: String, title: String, review: String) {
        self.init()
        self.date = date
        self.place = place
        self.ourTeam = ourTeam
        self.opponentTeam = opponentTeam
        self.ourTeamScore = ourTeamScore
        self.opponentTeamScore = opponentTeamScore
        self.feeling = feeling
        self.title = title
        self.review = review
    }
}
