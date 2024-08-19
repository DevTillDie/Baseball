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
        let cutCenter = CGPoint(x: rect.midX, y: rect.minY - 20)
        
        path.move(to: CGPoint(x: rect.minX + cornerRadius, y: rect.minY))
        path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.minY + cornerRadius), radius: cornerRadius, startAngle: .degrees(180), endAngle: .degrees(270), clockwise: false)
        path.addLine(to: CGPoint(x: cutCenter.x - cutRadius, y: rect.minY))
        path.addArc(center: cutCenter, radius: cutRadius, startAngle: .degrees(180), endAngle: .degrees(0), clockwise: true)
        path.addLine(to: CGPoint(x: cutCenter.x + cutRadius, y: rect.minY))
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY + cornerRadius), radius: cornerRadius, startAngle: .degrees(270), endAngle: .degrees(0), clockwise: false)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRadius))
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius), radius: cornerRadius, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: false)
        path.addLine(to: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY))
        path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY - cornerRadius), radius: cornerRadius, startAngle: .degrees(90), endAngle: .degrees(180), clockwise: false)
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + cornerRadius))
        path.closeSubpath()
        
        return path
    }
}
