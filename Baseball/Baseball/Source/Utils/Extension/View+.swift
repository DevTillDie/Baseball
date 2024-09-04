//
//  View+.swift
//  Baseball
//
//  Created by hyebin on 9/2/24.
//

import SwiftUI

extension View {
    @MainActor 
    func render(scale: CGFloat) -> UIImage? {
        let renderer = ImageRenderer(content: self)
        renderer.scale = scale
        return renderer.uiImage
    }
}
