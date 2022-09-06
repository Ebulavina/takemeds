//
//  NewMedView.swift
//  takemeds
//
//  Created by Ekaterina Bulavina on 25.08.2022.
//

import SwiftUI

struct NewMedView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @StateObject private var viewModel = NewMedViewModel(repository: Dependency.shared.repository)
        
    var body: some View {
        Form {
            TextField("NewMedView.title".localizedString, text: $viewModel.name)
            
            DatePicker(
                "NewMedView.Reminder_time:".localizedString,
                selection: $viewModel.reminderTime,
                displayedComponents: .hourAndMinute
            )
            
            Button("Button.add".localizedString) {
                viewModel.saveMed()
                self.presentationMode.wrappedValue.dismiss()
            }
            .disabled(viewModel.name.isEmpty)
        }
        .navigationTitle(Text("NewMedView.Create_med".localizedString))
    }
}

struct NewMedView_Previews: PreviewProvider {
    static var previews: some View {
        NewMedView()
    }
}
