//
//  ThirdInputTicketView.swift
//  Baseball
//
//  Created by hyebin on 4/18/24.
//

import SwiftUI

struct ThirdInputTicketView: View {
    @State private var ourTeamScore = ""
    @State private var opponentTeamScore = ""
    
    @Binding var currentPage: Int
    
    var body: some View {
        VStack {
            Text("점수가 어떻게 되었나요?")
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack(alignment: .bottom) {
                VStack {
                    Text("삼성 라이온즈")
                    
                    TextField("", text: $ourTeamScore)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
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
                    TextField("", text: $opponentTeamScore)
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.gray)
                        )
                }
            }
            .padding()
            
            Spacer()
            
            Button {
                currentPage += 1
            } label: {
                Text("다음")
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    InputTicketView()
}
