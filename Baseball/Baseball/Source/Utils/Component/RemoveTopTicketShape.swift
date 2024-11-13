//
//  RemoveTopTicketShape.swift
//  Baseball
//
//  Created by hyebin on 11/13/24.
//

import SwiftUI

struct RemoveTopTicketShape: Shape {
    var cornerRadius: CGFloat
    var cutRadius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // 좌측 상단 코너 추가
        path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.minY + cornerRadius),
                    radius: cornerRadius,
                    startAngle: .degrees(180),
                    endAngle: .degrees(270),
                    clockwise: false)
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY+cornerRadius))
       
        // 왼쪽 라인
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - cornerRadius))
        
        // 좌측 하단 코너 추가
        path.addArc(center: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY - cornerRadius),
                    radius: cornerRadius,
                    startAngle: .degrees(180),
                    endAngle: .degrees(90),
                    clockwise: true)
        
        // 하단 라인
        path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY))
        
        // 우측 하단 코너 추가
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
                    radius: cornerRadius,
                    startAngle: .degrees(90),
                    endAngle: .degrees(0),
                    clockwise: true)
        
        // 오른쪽 라인
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + cornerRadius))
        
        // 우측 상단 코너 추가 (상단 라인 생략)
        path.addArc(center: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY + cornerRadius),
                    radius: cornerRadius,
                    startAngle: .degrees(0),
                    endAngle: .degrees(-90),
                    clockwise: true)

        return path
    }
}
