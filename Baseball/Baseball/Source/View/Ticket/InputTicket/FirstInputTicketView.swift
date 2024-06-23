//
//  FirstInputTicketView.swift
//  Baseball
//
//  Created by hyebin on 4/18/24.
//

import SwiftUI

struct FirstInputTicketView: View {
    @State private var date = Date()
    @State private var place = ""
    @State private var isShowDatePicker = false
    
    @Binding var currentPage: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("언제 경기를 봤나요?")
            Text("24.03.07")
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.gray)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.gray.opacity(0.4))
                        .onTapGesture {
                            isShowDatePicker = true
                        }
                }
            
            Text("어디서 봤나요?")
            TextField("고척돔", text: $place)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.gray.opacity(0.4))
                }
            
            Spacer()
            Button {
                currentPage += 1
            } label: {
                Text("다음")
                    .frame(maxWidth: .infinity)
            }
            
            if isShowDatePicker {
                DatePicker("", selection: $date, displayedComponents: .date)
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    InputTicketView()
}
