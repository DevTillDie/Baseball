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
        VStack {
            HStack {
                Button {
                    currentPage = max(0, currentPage-1)
                } label: {
                    Image(systemName: "chevron.left")
                }
                
                Spacer()
                
                Text("티켓 추가하기")
                
                Spacer()
            }
            .padding(.horizontal)
            
            HStack(spacing: 0) {
                Rectangle()
                    .fill(currentPage>=1 ? .black : .gray)
                Rectangle()
                    .fill(currentPage>=2 ? .black : .gray)
                Rectangle()
                    .fill(currentPage>=3 ? .black : .gray)
            }
            .frame(height: 5)
            .mask {
                RoundedRectangle(cornerRadius: 2.5)
            }
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
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    InputTicketView()
}
