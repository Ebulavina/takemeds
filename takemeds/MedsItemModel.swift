//
//  MedsItemModel.swift
//  takemeds
//
//  Created by Ekaterina Bulavina on 25.08.2022.
//

import Foundation

struct MedsItemModel: Identifiable, Codable {
    let id: String
    let name: String
    let reminderTime: Date
    var takenMedsCount: Int
}
