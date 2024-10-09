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
    
    @State private var currentStatus = InputStatus.writing {
         didSet {
             if currentStatus == .done {
                 moveTicketView = true
                 presentationMode.wrappedValue.dismiss()
             }
        }
    }
    @Binding var moveTicketView: Bool
    
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
                EmptyView()
            }
        }
    }
}

// MARK: - UI

extension InputTicketView {
    private var writingView: some View {
        VStack(spacing: 0) {
            writingViewHeader
        
            ProgressView(value: Double(inputTicketViewModel.currentPage), total: 4)
                .progressViewStyle(
                    GradientProgressStyle(fill: LinearGradient(colors: gradients, startPoint: .topLeading, endPoint: .bottomTrailing), height: 4))
                .padding(.horizontal)
                .padding(.top, 20)
            
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
                    .font(.system(size: 20))
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            Text("티켓 추가하기")
                .font(.system(size: 16))
                .foregroundColor(.white)
            
            Spacer()
            
            Image(systemName: "chevron.left")
                .font(.system(size: 20))
                .opacity(0)
            
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
        .padding(.horizontal)
        .padding(.top, 42)
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
    InputTicketView(moveTicketView: .constant(false))
}
