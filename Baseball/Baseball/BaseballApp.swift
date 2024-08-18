//
//  BaseballApp.swift
//  Baseball
//
//  Created by hyebin on 1/23/24.
//

import SwiftUI

@main
struct BaseballApp: App {
    @AppStorage("isFirstLaunching") private var isFirstLaunching: Bool = true
    var body: some Scene {
        WindowGroup {
            MainView()
                .fullScreenCover(isPresented: $isFirstLaunching) {
                    OnboardingView(isFirstLaunching: $isFirstLaunching)
                }
        }
    }
}
