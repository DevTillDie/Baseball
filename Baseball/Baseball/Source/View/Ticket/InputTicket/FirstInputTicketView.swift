//
//  FirstInputTicketView.swift
//  Baseball
//
//  Created by hyebin on 4/18/24.
//

import SwiftUI

struct FirstInputTicketView: View {
    @EnvironmentObject var viewModel: InputTicketViewModel
    @FocusState private var isFocused: Bool
    
    @State private var isShowDatePicker = false
    
    var body: some View {
        VStack(alignment: .leading) {
            inputDate
            
            inputPlace
            
            Spacer()
            
            NextButton(isActive: !viewModel.place.isEmpty) {
                isFocused = false
                viewModel.currentPage += 1
            }
            
            if isShowDatePicker {
                datePicker
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            isFocused = false
            isShowDatePicker = false
        }
        .onAppear {
            UIScrollView.appearance().isScrollEnabled = true
        }
    }
}

// MARK: - UI

extension FirstInputTicketView {
    private var inputDate: some View {
        VStack {
            Text("언제 경기를 봤나요?")
                .foregroundColor(.white)
            
            Text(viewModel.date.dateToString())
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.white)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.gray.opacity(0.4))
                        .onTapGesture {
                            isFocused = false
                            isShowDatePicker = true
                        }
                }
        }
    }
    
    private var inputPlace: some View {
        VStack {
            Text("어디서 봤나요?")
                .foregroundColor(.white)
            
            TextField("고척돔", text: $viewModel.place)
                .focused($isFocused)
                .padding()
                .colorScheme(.dark)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.gray.opacity(0.4))
                }
        }
    }
    
    private var datePicker: some View {
        DatePicker("", selection: $viewModel.date, displayedComponents: .date)
            .datePickerStyle(WheelDatePickerStyle())
            .labelsHidden()
            .colorScheme(.dark)
            .frame(maxWidth: .infinity)
    }
}

#Preview {
    InputTicketView()
}
