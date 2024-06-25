//
//  InputTicketView.swift
//  Baseball
//
//  Created by hyebin on 4/18/24.
//

import SwiftUI

struct InputTicketView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var currentPage = 0
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                HStack {
                    Button {
                        if currentPage == 0 {
                            self.presentationMode.wrappedValue.dismiss()
                        } else {
                            currentPage -= 1
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Text("티켓 추가하기")
                        .bold()
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                ProgressView(value: Double(currentPage), total: 4)
                    .progressViewStyle(LinearProgressViewStyle(tint: .white))
                    .padding(.horizontal)
                
                TabView(selection: $currentPage) {
                    FirstInputTicketView(currentPage: $currentPage)
                        .tag(0)
                    
                    SecondInputTicketView(currentPage: $currentPage)
                        .tag(1)
                    
                    ThirdInputTicketView(currentPage: $currentPage)
                        .tag(2)
                    
                    FourthInputTicketView(currentPage: $currentPage)
                        .tag(3)
                    
                    FifthInputTicketView(currentPage: $currentPage)
                        .tag(4)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .onAppear {
                      UIScrollView.appearance().isScrollEnabled = false
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    InputTicketView()
}
