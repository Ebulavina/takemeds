//
//  Dependency.swift
//  takemeds
//
//  Created by Ekaterina Bulavina on 26.08.2022.
//

import Foundation

final class Dependency {
    static var shared: Dependency = .init()
    private init() { }
    
    lazy var reminder: ReminderProtocol = {
        Reminder()
    }()

    lazy var repository: RepositoryProtocol = {
        Repository(reminder: reminder)
    }()
}
