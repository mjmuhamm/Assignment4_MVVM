//
//  ContentView.swift
//  Assignment4MVVM
//
//  Created by Malik Muhammad on 3/20/26.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = PeopleViewModel(networkManager: NetworkManager())
    var body: some View {
        if viewModel.apiError != nil {
            Text(viewModel.apiError?.localizedDescription ?? "No People Found").accessibilityIdentifier("person_list_error_text")
        } else {
            NavigationStack {
                VStack {
                    Text("People In List").accessibilityIdentifier("person_list_title")
                    
                    List(viewModel.data){ person in
                        PeopleCell(person: person).accessibilityIdentifier("people_cell_\(person.id)")
                    }.accessibilityIdentifier("people_list")
                }
                .padding(.vertical, 6)
            }.task {
                await viewModel.getInfo()
            }
            .refreshable {
                await viewModel.getInfo()
            }
        }
    }
}

#Preview {
    MainView()
}
