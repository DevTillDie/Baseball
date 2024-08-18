//
//  TicketStroke.swift
//  Baseball
//
//  Created by hyebin on 7/31/24.
//

import SwiftUI

struct TicketStroke: ViewModifier {
    var cornerRadius: CGFloat
    var cutRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .clipShape(TicketShape(cornerRadius: cornerRadius, cutRadius: cutRadius))
            .background {
                TicketShape(cornerRadius: cornerRadius, cutRadius: cutRadius)
                    .stroke(
                        LinearGradient(colors: [.white, .ticketGradient],
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing),
                        lineWidth: 2
                    )
            }
    }
}
