//
//  MainViewModel.swift
//  Baseball
//
//  Created by Nayeon Kim on 9/14/24.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var ticketData = [Ticket]()
    @Published var filteredData = [Ticket]()
    
    func loadTicketData() {
        ticketData = RealmManager.shared.loadTicketData()
    }
    
    func filteTicketData(item: String, condition: String) {
        filteredData = RealmManager.shared.filterTicketData(item: item, condition: condition)
    }
}
