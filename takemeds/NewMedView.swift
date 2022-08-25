//
//  NewMedView.swift
//  takemeds
//
//  Created by Ekaterina Bulavina on 25.08.2022.
//

import SwiftUI

struct NewMedView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var viewModel = NewMedViewModel(repository: Repository())
    
    var body: some View {
        VStack {
            TextField("title", text: $viewModel.title)
            Button("add") {
                viewModel.saveMed()
                self.presentationMode.wrappedValue.dismiss()
            }
            .disabled(viewModel.title.isEmpty)
        }
    }
}

struct NewMedView_Previews: PreviewProvider {
    static var previews: some View {
        NewMedView()
    }
}
