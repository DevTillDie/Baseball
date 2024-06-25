//
//  FourthInputTicketView.swift
//  Baseball
//
//  Created by hyebin on 4/18/24.
//

import SwiftUI

struct FourthInputTicketView: View {
    @State private var ourTeamScore = ""
    @State private var opponentTeamScore = ""
    
    @Binding var currentPage: Int
    
    var body: some View {
        VStack {
            Text("점수가 어떻게 되었나요?")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack(alignment: .bottom) {
                VStack {
                    Text("삼성 라이온즈")
                        .foregroundColor(.white)
                    
                    TextField("", text: $ourTeamScore)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .colorScheme(.dark)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.gray)
                        )
                }
                
                Text(":")
                    .padding()
                
                VStack {
                    Text("LG 트윈스")
                        .foregroundColor(.white)
                    
                    TextField("", text: $opponentTeamScore)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .colorScheme(.dark)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.gray)
                        )
                }
            }
            .padding()
            
            Spacer()
            
            NextButton(isActive: !ourTeamScore.isEmpty && !opponentTeamScore.isEmpty) {
                currentPage += 1
            }
        }
    }
}

#Preview {
    InputTicketView()
}
