//
//  Color+.swift
//  Baseball
//
//  Created by Nayeon Kim on 9/14/24.
//

import SwiftUI

extension Color {
    static func colorTeam(_ teamName: String) -> Color {
        switch teamName {
        case "삼성 라이온즈":
            return Color(.lions)
        case "한화 이글스":
            return Color(.eagles)
        case "LG 트윈스":
            return Color(.twins)
        case "롯데 자이언츠":
            return Color(.giants)
        case "기아 타이거즈":
            return Color(.tigers)
        case "두산 베어스":
            return Color(.bears)
        default:
            return Color(.black)
        }
    }
}
