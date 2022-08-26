//
//  Repository.swift
//  takemeds
//
//  Created by Ekaterina Bulavina on 25.08.2022.
//

import Foundation

protocol RepositoryProtocol {
    func save(med: MedsItemModel) throws
    func getMeds() throws -> [MedsItemModel]
}

enum RepositoryError: Error {
    case userDefaultsGetMeds
}

class Repository: RepositoryProtocol  {
    private let medsKey = "meds_key"
    private let reminderKey = "reminder_key"
    
    private let reminder: ReminderProtocol
    
    init(reminder: ReminderProtocol) {
        self.reminder = reminder
    }
    
    func save(med: MedsItemModel) throws {
        var meds = [MedsItemModel]()
        if let UDMeds = try? getMeds() {
            meds = UDMeds
        }
        meds.append(med)
        let encoder = JSONEncoder()
        
        let data = try encoder.encode(meds)
        UserDefaults.standard.set(data, forKey: medsKey)
        UserDefaults.standard.synchronize()
        reminder.createRemind(med: med)
    }
    
    func getMeds() throws -> [MedsItemModel] {
        if let data = UserDefaults.standard.object(forKey: medsKey) as? Data {
            let decoder = JSONDecoder()
            let meds = try decoder.decode([MedsItemModel].self, from: data)
            return meds
        } else {
            throw RepositoryError.userDefaultsGetMeds 
        }
    }
}
