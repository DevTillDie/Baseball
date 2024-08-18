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
        Team(imageName: "flag.checkered", teamName: "삼성 라이온즈"),
        Team(imageName: "flag.checkered", teamName: "LG 트윈스"),
        Team(imageName: "flag.checkered", teamName: "롯데 자이언트"),
        Team(imageName: "flag.checkered", teamName: "기아 타이거즈"),
        Team(imageName: "flag.checkered", teamName: "한화 이글스"),
        Team(imageName: "flag.checkered", teamName: "두산 베어스")
    ]
}
