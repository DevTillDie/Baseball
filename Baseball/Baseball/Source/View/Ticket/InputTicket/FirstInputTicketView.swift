//
//  FirstInputTicketView.swift
//  Baseball
//
//  Created by hyebin on 4/18/24.
//

import SwiftUI

struct FirstInputTicketView: View {
    @FocusState private var isFocused: Bool
    
    @State private var date = Date()
    @State private var place = ""
    @State private var isShowDatePicker = false
    
    @Binding var currentPage: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("언제 경기를 봤나요?")
                .foregroundColor(.white)
            
            Text(date.dateToString())
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
            
            Text("어디서 봤나요?")
                .foregroundColor(.white)
            
            TextField("고척돔", text: $place)
                .focused($isFocused)
                .padding()
                .colorScheme(.dark)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.gray.opacity(0.4))
                }
            
            Spacer()
            
            NextButton(isActive: !place.isEmpty) {
                isFocused = false
                currentPage += 1
            }
            
            if isShowDatePicker {
                DatePicker("", selection: $date, displayedComponents: .date)
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                    .colorScheme(.dark)
                    .frame(maxWidth: .infinity)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
           isFocused = false
           isShowDatePicker = false
       }
    }
}

#Preview {
    InputTicketView()
}
