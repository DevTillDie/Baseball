//
//  MainViewModel.swift
//  Baseball
//
//  Created by Nayeon Kim on 9/14/24.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published private var ticketData = [Ticket]()
    
    func loadTicketData() {
        ticketData = RealmManager.shared.loadTicketData()
    }
}
