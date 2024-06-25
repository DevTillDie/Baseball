//
//  TestMainView.swift
//  Baseball
//
//  Created by hyebin on 6/25/24.
//

import SwiftUI

struct TestMainView: View {
    @State private var moveInputTicketView = false
    var body: some View {
        NavigationStack {
            Button {
                moveInputTicketView = true
            } label: {
                Text("티켓 입력")
            }
            .navigationDestination(isPresented: $moveInputTicketView) {
                InputTicketView()
                    .navigationBarBackButtonHidden()
            }
        }
    }
}

#Preview {
    TestMainView()
}
