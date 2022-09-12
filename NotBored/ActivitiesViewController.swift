//
//  ActivitiesViewController.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 08/09/22.
//

import UIKit

class ActivitiesViewController: UIViewController {
    // MARK: - Screen objects
    private lazy var activitiesView: ActivitiesView = {
        let view = ActivitiesView()
        view.backgroundColor = UIColor(red: 32/255, green: 32/255, blue: 32/255, alpha: 1)
        view.delegate = self
        return view
    }()
    
    private lazy var settingButton: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(systemName: "shuffle"), style: .plain, target: self, action: #selector(shuffleTapped))
    }()
    
    // MARK: - Properties
    private var numberOfParticipants: Int
    private var service = Service()
    let viewModel = ActivitiesViewModel()
    
    // MARK: - Initializers
    init(numberOfParticipants number: Int) {
        self.numberOfParticipants = number
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        navigationItem.title = "Activities"
        navigationItem.rightBarButtonItem = settingButton
        
        let titleColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        let itemsColor = UIColor(red: 233/255, green: 186/255, blue: 67/255, alpha: 1)
        navigationController?.navigationBar.backgroundColor = .black
        navigationController?.navigationBar.tintColor = itemsColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor]
        navigationController?.navigationBar.topItem?.backButtonTitle = String()
    }
    
    override func loadView() {
        view = activitiesView
    }
    
    // MARK: - Methods
    func navigateToSuggestion(activity: Activity, activityType: String) {
        let isRamdom = activityType == "Random"
        let suggestionViewController = SuggestionViewController(activity: activity, isRamdom: isRamdom)
        suggestionViewController.title = activityType.capitalized
        navigationController?.pushViewController(suggestionViewController, animated: true)
    }
    
    func fetchActivity(category: String?) {
        viewModel.fetch(numberOfParticipants: numberOfParticipants, category: category) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let activity):
                    self.navigateToSuggestion(activity: activity, activityType: category ?? "Random")
                case .failure(let error):
                    Notification.show(title: "Error", message: error.rawValue, target: self)
                }
            }
        }
    }
    
    // MARK: - Actions
    @objc func shuffleTapped() {
        fetchActivity(category: nil)
    }
}

// MARK: - Activities view delegate
extension ActivitiesViewController: ActivitiesViewDelegateProtocol {
    func activityCellTapped(activityType: ActivityType) {
        fetchActivity(category: activityType.category)
    }
}
