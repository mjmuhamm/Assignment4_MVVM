//
//  PeopleViewModel.swift
//  Assignment4MVVM
//
//  Created by Malik Muhammad on 3/20/26.
//

import Foundation
import Combine

final class PeopleViewModel : ObservableObject {
    
    @Published var data : [People] = []
    @Published var apiError: Error? = nil
    
    let networkManager : Network
    
    init(networkManager: Network) {
        self.networkManager = networkManager
    }
    
    @MainActor
    func getInfo() async {
        do {
            let people = try await networkManager.getInfo(urlString: Constant.BASE_URL)
            data = people
        } catch {
            print(error.localizedDescription)
            apiError = error
        }
    }
    
    
    
}
