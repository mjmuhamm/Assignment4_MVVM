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
            Text(viewModel.apiError?.localizedDescription ?? "No People Found")
        } else {
            NavigationStack {
                VStack {
                    Text("People In List")
                    
                    List(viewModel.data){ person in
                        PeopleCell(person: person)
                    }
                }
                .padding()
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
