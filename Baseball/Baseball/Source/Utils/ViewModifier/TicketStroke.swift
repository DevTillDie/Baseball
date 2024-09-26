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
    var isRemoveTop = false
    
    func body(content: Content) -> some View {
        if isShare, !isRemoveTop {
            content
                .clipShape(ShareTicketShape(cornerRadius: cornerRadius, cutRadius: cutRadius))
                .background {
                    ShareTicketShape(cornerRadius: cornerRadius, cutRadius: cutRadius)
                        .stroke(.white, lineWidth: 1)
                }
        } else {
            content
                .clipShape(TicketShape(cornerRadius: cornerRadius, cutRadius: cutRadius))
                .background {
                    if isShare, isRemoveTop {
                        TicketShape(cornerRadius: cornerRadius, cutRadius: cutRadius)
                            .trim(from: 0, to: 0.65)
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
}
