//
//  InputTicketView.swift
//  Baseball
//
//  Created by hyebin on 4/18/24.
//

import SwiftUI

struct InputTicketView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var inputTicketViewModel = InputTicketViewModel()
    
    @State private var currentStatus = InputStatus.writing
    
    private let gradients: [Color] = [.gradient1, .gradient2, .gradient3, .gradient4, .gradient5]
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            if currentStatus == .writing {
                writingView
            } else if currentStatus == .saving {
                completeView
            } else {
                TicketView()
            }
        }
    }
}

// MARK: - UI

extension InputTicketView {
    private var writingView: some View {
        VStack {
            writingViewHeader
        
            ProgressView(value: Double(inputTicketViewModel.currentPage), total: 4)
                .progressViewStyle(
                    GradientProgressStyle(fill: LinearGradient(colors: gradients, startPoint: .topLeading, endPoint: .bottomTrailing), height: 4))
                .padding(.horizontal)
            
            writingTabView
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private var writingViewHeader: some View {
        HStack {
            Button {
                if inputTicketViewModel.currentPage == 0 {
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    inputTicketViewModel.currentPage -= 1
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
    }
    
    private var writingTabView: some View {
        TabView(selection: $inputTicketViewModel.currentPage) {
            FirstInputTicketView()
                .environmentObject(inputTicketViewModel)
                .tag(0)
            
            SecondInputTicketView()
                .environmentObject(inputTicketViewModel)
                .tag(1)
            
            ThirdInputTicketView()
                .environmentObject(inputTicketViewModel)
                .tag(2)
            
            FourthInputTicketView()
                .environmentObject(inputTicketViewModel)
                .tag(3)
            
            FifthInputTicketView(currentStatus: $currentStatus)
                .environmentObject(inputTicketViewModel)
                .tag(4)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .onAppear {
            UIScrollView.appearance().isScrollEnabled = false
        }
        .padding()
    }
    
    private var completeView: some View {
        CompleteTicketView()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now()+2.0) {
                    currentStatus = .done
                }
            }
    }
}

#Preview {
    InputTicketView()
}
