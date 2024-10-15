//
//  CompleteTicketView.swift
//  Baseball
//
//  Created by hyebin on 4/18/24.
//

import SwiftUI

import Lottie

struct CompleteTicketView: View {
    @Binding var currentStatus: InputStatus
    
    var emotion: String
    
    var body: some View {
        LottieView(animation: .named(getAnimationFile()))
            .playing()
            .resizable()
            .animationDidFinish { _ in
                currentStatus = .done
            }
            .ignoresSafeArea()
    }
    
    private func getAnimationFile() -> String {
        if emotion == "화나요" {
            return "angry.lottie"
        } else if emotion == "신나요" {
            return "happy.lottie"
        } else {
            return "soso.lottie"
        }
    }
}
