//
//  Tikcet.swift
//  Baseball
//
//  Created by Nayeon Kim on 7/6/24.
//

import SwiftUI

struct TicketShape: Shape {
    var cornerRadius: CGFloat
    var cutRadius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: -(cutRadius + 20))
        let cutoutPath = Path { path in
            path.addEllipse(in: CGRect(x: center.x - cutRadius, y: center.y, width: cutRadius * 2, height: cutRadius * 2))
        }

        path.addRoundedRect(in: rect, cornerSize: CGSize(width: cornerRadius, height: cornerRadius))

        return path.subtracting(cutoutPath)
    }
}
