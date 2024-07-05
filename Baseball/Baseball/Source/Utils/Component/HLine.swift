//
//  HLine.swift
//  Baseball
//
//  Created by Nayeon Kim on 7/6/24.
//

import SwiftUI

struct HLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: 0))
        
        return path
    }
}
