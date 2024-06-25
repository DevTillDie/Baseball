//
//  Date+.swift
//  Baseball
//
//  Created by hyebin on 6/25/24.
//

import Foundation

extension Date {
    func dateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy.MM.dd"

        return dateFormatter.string(from: self)
    }
}
