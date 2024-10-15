//
//  OnboardingViewModel.swift
//  Baseball
//
//  Created by Nayeon Kim on 8/18/24.
//

import SwiftUI

class OnboardingViewModel: ObservableObject {
    @AppStorage("myTeam") var myTeam = ""
    
    let teams: [Team] = [
        Team(imageName: "lionsIcon", teamName: "삼성 라이온즈"),
        Team(imageName: "twinsIcon", teamName: "LG 트윈스"),
        Team(imageName: "giantsIcon", teamName: "롯데 자이언츠"),
        Team(imageName: "tigersIcon", teamName: "기아 타이거즈"),
        Team(imageName: "eaglesIcon", teamName: "한화 이글스"),
        Team(imageName: "bearsIcon", teamName: "두산 베어스")
    ]
}
