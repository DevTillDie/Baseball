//
//  RealmManager.swift
//  Baseball
//
//  Created by hyebin on 8/5/24.
//

import SwiftUI
import RealmSwift

class RealmManager {
    static let shared = RealmManager()
    private let realm: Realm
    
    private init() {
        do {
            self.realm = try Realm()
        } catch {
            fatalError("Error initializing Realm: \(error)")
        }
    }

    func saveTicketData(_ ticketData: Ticket) {
        do {
            try realm.write {
                realm.add(ticketData)
            }
        } catch {
            fatalError("Error saving history to Realm: \(error)")
        }
    }
    
    func loadTicketData() -> [Ticket] {
        let tickets = realm.objects(Ticket.self)
        let sortedTickets = tickets.sorted(byKeyPath: "date", ascending: false)
        
        return Array(sortedTickets)
    }
    
    func filterTicketData(item: String, condition: String) -> [Ticket] {
        let filteredTickets = realm.objects(Ticket.self).filter("\(item) == %@", condition)
        let sortedFilteredTickets = filteredTickets.sorted(byKeyPath: "date", ascending: false)
        
        return Array(sortedFilteredTickets)
    }
}
