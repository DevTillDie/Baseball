//
//  TicketView.swift
//  Baseball
//
//  Created by hyebin on 4/18/24.
//

import SwiftUI

struct TicketView: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.5)
                .ignoresSafeArea()
            
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.white)
                       
                    VStack {
                        Image(systemName: "baseball")
                            .font(.system(size: 100))
                        
                        Divider()
                        
                        HStack {
                            Text("Date.")
                            Spacer()
                            Text("24.02.12")
                        }
                        
                        Divider()
                        
                        HStack {
                            Text("Location.")
                            
                            Spacer()
                            
                            Text("대구 경기장")
                        }
                        
                        Divider()
                        
                        HStack {
                            Text("삼성\n라이온즈")
                                .lineLimit(2)
                                .fixedSize(horizontal: false, vertical: true)
                            
                            Spacer()
                            
                            Text("vs")
                            
                            Spacer()
                            
                            Text("두산\n베어스")
                                .lineLimit(2)
                                .fixedSize(horizontal: false, vertical: true)
                                .multilineTextAlignment(.trailing)
                        }
                        .padding()
                        .foregroundStyle(.white)
                        .background(Rectangle())
                        
                        HStack {
                            Text("Wins!")
                            
                            Spacer()
                            
                            Text("lose")
                        }
                        
                        Divider()
                        
                        Text("49 : 17")
                        
                        Divider()
                        Divider()
                        
                        Text("경기 한마디")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("아 오늘 경기 찢었다.")
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                            .frame(height: 100)
                    }
                    .padding()
                }
                .padding(.top, 92)
                .padding(.bottom, 61)
                .padding(.horizontal)
                
                Button {
                    // TODO: 인스타 공유
                } label: {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.gray)
                        .overlay {
                            Text("공유하기")
                                .foregroundStyle(.black)
                        }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    TicketView()
}
