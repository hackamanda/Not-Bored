//
//  ActivitiesViewModel.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 09/09/22.
//

import Foundation

class ActivitiesViewModel {
    // MARK: - Properties
    private var service = Service()
    private var categories: [ActivityType] = []
    weak var delegate: ActivitiesViewModelDelegateProtocol?
    
    // MARK: - Initializers
    init() {
        fetchCategories()
    }
    
    // MARK: Methods
    func fetchCategories() {
        service.fetchMock(fileName: "Categories", { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let categories):
                    self.categories = categories
                    self.delegate?.reloadData()
                case .failure(let error):
                    print("Deu erro na API: \(error.rawValue)")
                    self.categories = []
                }
            }
        })
    }
    
    func fetch(numberOfParticipants: Int, category: String?, _ completion: @escaping (Result<Activity, CustomError>) -> Void) {
        service.fetch(numberOfParticipants: numberOfParticipants, category: category) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let activity):
                    completion(.success(activity))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
    func currentActivity(inPosition index: Int) -> ActivityType {
        return categories[index]
    }
    
    func count() -> Int {
        return categories.count
    }
}
