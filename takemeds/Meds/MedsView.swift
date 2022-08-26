//
//  MedsView.swift
//  takemeds
//
//  Created by Ekaterina Bulavina on 25.08.2022.
//

import SwiftUI

struct MedsView: View {
    @ObservedObject var viewModel = MedsViewModel(repository: Dependency.shared.repository)
        
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.meds) { med in
                        Text(med.name)
                        
                        Text(dateToString(med.reminderTime))
                    }
                }
                .listStyle(.plain)
                
                NavigationLink {
                    NewMedView()
                } label: {
                    Text("add")
                }

            }
            .navigationTitle(Text("My meds"))
            .onAppear {
                viewModel.load()
            }
            .refreshable {
                viewModel.load()
            }
        }
    }
}

func dateToString(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    return dateFormatter.string(from: date)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MedsView()
    }
}
