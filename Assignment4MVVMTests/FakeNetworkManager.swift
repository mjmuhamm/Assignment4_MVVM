//
//  FakeNetworkManager.swift
//  Assignment4MVVMTests
//
//  Created by Malik Muhammad on 3/23/26.
//

import Foundation
@testable import Assignment4MVVM

class FakeNetworkManager : Network {
    var testPath: String = ""
    
    func getInfo<T>(urlString: String, modelType: T.Type) async throws -> T where T : Decodable {
        let bundle = Bundle(for: FakeNetworkManager.self)
        guard let urlObj = bundle.url(forResource: testPath, withExtension: "json") else {
            throw NetworkError.invalidUrl
        }
        do {
            let data = try Data(contentsOf: urlObj)
            
            do {
                let decodedData = try JSONDecoder().decode(modelType.self, from: data)
                return decodedData
            } catch {
                throw NetworkError.parsingError
            }
        } catch {
            throw error
        }
    }
    
    
}
