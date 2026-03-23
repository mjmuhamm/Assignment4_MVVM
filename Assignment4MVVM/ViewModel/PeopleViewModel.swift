//
//  PeopleViewModel.swift
//  Assignment4MVVM
//
//  Created by Malik Muhammad on 3/20/26.
//

import Foundation
import Combine

/*
 Combine - Apples native reactive programming framework
 Publisher-Subscriber pattern / Observer pattern
 Publisher - this is someone who emits the stream of data
 Subscriber - who receives the data given by publisher
 Operator - it converts the data given by publisher to a format in which subscriber needs
 
 */
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
            let people = try await networkManager.getInfo(urlString: Constant.BASE_URL, modelType: [People].self)
            data = people
        } catch {
            print(error.localizedDescription)
            apiError = error
        }
    }
}
