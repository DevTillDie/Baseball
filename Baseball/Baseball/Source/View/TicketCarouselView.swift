//
//  TicketCarouselView.swift
//  Baseball
//
//  Created by Nayeon Kim on 2/21/24.
//

import SwiftUI

struct TicketCarouselView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color(UIColor.systemGray4))
                .padding(.vertical, 48)
            
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color(UIColor.systemGray2))
                .padding(.horizontal, 44)
        }
    }
}

#Preview {
    TicketCarouselView()
}
