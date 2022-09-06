//
//  Utilities.swift
//  takemeds
//
//  Created by Ekaterina Bulavina on 26.08.2022.
//

import Foundation

final class Utilities {
    static func dateToString(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
}

