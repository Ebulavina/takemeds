//
//  MedsView.swift
//  takemeds
//
//  Created by Ekaterina Bulavina on 25.08.2022.
//

import SwiftUI

struct MedsView: View {
    @ObservedObject private var viewModel = MedsViewModel(repository: Dependency.shared.repository)
        
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.meds) { med in
                        makeListItemView(med: med)
                    }
                }
                .listStyle(.plain)
                
                Divider()
                
                NavigationLink {
                    NewMedView()
                } label: {
                    Label("add", systemImage: "plus")
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
    
    private func makeListItemView(med: MedsItemModel) -> some View {
        return VStack(alignment: .leading) {
            Text(med.name)
                .font(.title)
                .padding(.bottom, Constants.padding)
            
            ItemRowView(
                label: "Reminder time:",
                icon: "clock",
                value: Utilities.dateToString(med.reminderTime)
            )
            
            ItemRowView(
                label: "Taken meds count:",
                icon: "pills",
                value: String(med.takenMedsCount)
            )
            
            Button(action: { viewModel.takeMed(id: med.id) }) {
                HStack {
                    Spacer()
                    Text("take med")
                    Spacer()
                }
                .frame(height: Constants.height)
            }
            .buttonStyle(.bordered)
            .foregroundColor(.primary)
        }
        .padding([.top, .bottom], Constants.padding)
    }
    
    private struct ItemRowView: View {
        let label: String
        let icon: String
        let value: String
        
        var body: some View {
            HStack {
                Label(label, systemImage: icon)
                Spacer()
                Text(value)
            }
        }
    }
    
    private struct Constants {
        static let padding: CGFloat = 5
        static let height: CGFloat = 40
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MedsView()
    }
}
