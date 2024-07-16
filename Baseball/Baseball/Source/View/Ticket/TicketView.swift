//
//  TicketView.swift
//  Baseball
//
//  Created by hyebin on 4/18/24.
//

import SwiftUI

struct TicketView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            VStack(spacing: 0) {
                VStack {
                    Text("24.02.22")
                        .font(.system(size: 15))
                    
                    Text("3 : 1")
                        .font(.system(size: 48))
                    
                    HStack {
                        Text("SAMSUNG LIONS")
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        
                        HLine()
                            .stroke(style: .init(dash: [3]))
                            .foregroundStyle(.line)
                            .frame(height: 1)
                        
                        Text("LG TWINS")
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    }
                    .padding(.horizontal)
                    
                    Divider()
                        .frame(minHeight: 1)
                        .background(.white)
                        .padding()
                       
                    HStack {
                        Spacer()
                        
                        VStack(spacing: 8) {
                            Text("Our team")
                                .font(.system(size: 20))
                            Text("Samsung Lions")
                                .font(.system(size: 16))
                            Image(systemName: "cloud.sleet")
                                .font(.system(size: 30))
                                .padding(.bottom, 30)
                            
                            Text("Location")
                                .font(.system(size: 20))
                            Text("고척돔")
                                .font(.system(size: 16))
                            
                        }
                        
                        Spacer(minLength: 30)
                        
                        VStack(spacing: 8) {
                            Text("Opposing team")
                                .font(.system(size: 20))
                            Text("LG TWINS")
                                .font(.system(size: 16))
                            Image(systemName: "envelope.open")
                                .font(.system(size: 30))
                                .padding(.bottom, 30)
                            
                            Text("Lucky")
                                .font(.system(size: 20))
                            
                            Text("승요")
                                .font(.system(size: 16))
                        }
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                }
                .padding(.top, 60)
                .padding(.bottom, 30)
                .background {
                    LinearGradient(gradient: Gradient(colors: [.blue, .red]), startPoint: .leading, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                }
                .clipShape(TicketShape(cornerRadius: 8, cutRadius: 40))
                
                HLine()
                    .stroke(style: .init(dash: [6]))
                    .foregroundStyle(.line)
                    .frame(height: 3)
                    .background {
                        LinearGradient(gradient: Gradient(colors: [.blue, .red]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                    }
                    .padding(.horizontal, 6)
                
                VStack {
                    Text("제목")
                        .padding(.bottom, 4)
                    
                    Text("내용")
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(28)
                .background {
                    LinearGradient(gradient: Gradient(colors: [.blue, .red]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                }
                .clipShape(TicketShape(cornerRadius: 8, cutRadius: 0))
                .padding(.bottom, 36)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Button {
                
            } label: {
                Text("공유하기")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.white, lineWidth: 2)
                    }
            }
        }
        .padding()
        .foregroundColor(.text)
    }
}

#Preview {
    MainView()
}
