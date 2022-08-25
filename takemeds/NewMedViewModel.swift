//
//  NewMedViewModel.swift
//  takemeds
//
//  Created by Ekaterina Bulavina on 25.08.2022.
//

import Foundation

final class NewMedViewModel: ObservableObject {
    @Published var title: String = ""
    
    let repository: RepositoryProtocol
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    
    func saveMed() {
        let uuid = UUID().uuidString
        let med = MedsItemModel(id: uuid, name: title)
        do {
            try repository.save(med: med)
        } catch {
            print(error)
        }
    }
}
