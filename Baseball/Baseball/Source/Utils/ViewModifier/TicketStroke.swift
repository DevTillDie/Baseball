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
    var isShare: Bool
    
    func body(content: Content) -> some View {
        content
            .clipShape(TicketShape(cornerRadius: cornerRadius, cutRadius: cutRadius))
            .background {
                if isShare {
                    TicketShape(cornerRadius: cornerRadius, cutRadius: cutRadius)
                        .stroke(.white, lineWidth: 1)
                } else {
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
}
