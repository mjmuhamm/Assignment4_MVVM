//
//  Network.swift
//  Assignment4MVVM
//
//  Created by Malik Muhammad on 3/20/26.
//

import Foundation


protocol Network {
    func getInfo(urlString: String) async throws -> [People]
}
struct NetworkManager {
    let urlSession: URLSession
    
    init(urlSession: URLSession = .shared)  {
        self.urlSession = urlSession
    }
}

extension NetworkManager: Network {
    func getInfo(urlString: String) async throws -> [People] {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidUrl
        }
        do {
            let (data, response) = try await self.urlSession.data(from: url)
            guard let response = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            guard(200...299).contains(response.statusCode) else {
                throw NetworkError.invalidResponseCode
            }
            
            do {
                let decodedData = try JSONDecoder().decode([People].self, from: data)
                return decodedData
            } catch {
                throw NetworkError.parsingError
            }
        } catch {
            throw error
        }
    }
    
    
}
