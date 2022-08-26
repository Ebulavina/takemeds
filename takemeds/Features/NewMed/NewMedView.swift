//
//  NewMedView.swift
//  takemeds
//
//  Created by Ekaterina Bulavina on 25.08.2022.
//

import SwiftUI

struct NewMedView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var viewModel = NewMedViewModel(repository: Dependency.shared.repository)
        
    var body: some View {
        Form {
            TextField("title", text: $viewModel.name)
            
            DatePicker(
                "Reminder time:",
                selection: $viewModel.reminderTime,
                displayedComponents: .hourAndMinute
            )
            
            Button("add") {
                viewModel.saveMed()
                self.presentationMode.wrappedValue.dismiss()
            }
            .disabled(viewModel.name.isEmpty)
        }
        .navigationTitle(Text("Create med"))
    }
}

struct NewMedView_Previews: PreviewProvider {
    static var previews: some View {
        NewMedView()
    }
}
