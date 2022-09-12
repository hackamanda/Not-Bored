//
//  Service.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 10/09/22.
//

import Foundation

struct Service {
    // MARK: - Properties
    private let network = Network()
    
    // MARK: - Methods
    func fetchMock(fileName: String, _ completion: @escaping (Result<[ActivityType], CustomError>) -> Void) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            completion(.failure(CustomError.ServiceUrlError))
            return
        }
        network.requestMoch(with: url) { (result: Result<[ActivityType], CustomError>) in
            switch result {
            case .success(let categories):
                completion(.success(categories))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetch(numberOfParticipants: Int, category: String?, _ completion: @escaping (Result<Activity, CustomError>) -> Void) {
        // Geralmente isso não fica no código e sim em arquivos de configuração
        let baseURL = "http://www.boredapi.com"
        let path = "/api/activity?"
        let query1 = "participants=\(numberOfParticipants)"
        var urlString = baseURL + path + query1
        if let category = category {
            urlString += "&type=\(category)"
        }
        guard let url = URL(string: urlString) else {
            completion(.failure(CustomError.ServiceUrlError))
            return
        }
        
        network.request(url: url) { (result: Result<Activity, CustomError>) in
            switch result {
            case .success(let activity):
                completion(.success(activity))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
