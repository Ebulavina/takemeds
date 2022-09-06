//
//  MedsViewModel.swift
//  takemeds
//
//  Created by Ekaterina Bulavina on 25.08.2022.
//

import Foundation

final class MedsViewModel: ObservableObject {
    @Published var meds: [MedsItemModel] = []
    
    private let repository: RepositoryProtocol
    
    init(repository: RepositoryProtocol) {
        self.repository = repository
    }
    
    func load() {
        do {
            meds = try repository.getMeds()
        } catch {
            print(error)
        }
    }
    
    func takeMed(id: String) {
        do {
            try repository.takeMed(id: id)
            load()
        } catch {
            print(error)
        }
    }
}
