//
//  Networking.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 10/09/22.
//

import Foundation

struct Network {
    // MARK: - Properties
    private let session = URLSession(configuration: .default)

    // MARK: - Methods
    func requestMoch<T: Codable>(with url: URL, completion: @escaping (Result<T, CustomError>) -> Void) {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(T.self, from: data)
            completion(.success(jsonData))
        } catch {
            completion(.failure(CustomError.NetworkInvalidData))
        }
    }
    
    func request<T: Codable>(url: URL, completion: @escaping (Result<T, CustomError>) -> Void) {
        session.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(CustomError.NetworkBadRequest))
                return
            }
            
            guard let
                httpURLResponse = response as? HTTPURLResponse,
                httpURLResponse.statusCode == 200
            else {
                completion(.failure(CustomError.NetworkResponseError))
                return
            }
            
            guard let data = data else {
                completion(.failure(CustomError.NetworkInvalidData))
                return
            }
            
            do {
                let decode = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decode))
            } catch {
                completion(.failure(CustomError.NetworkNoActivityFound))
            }
        }.resume()
    }
}
