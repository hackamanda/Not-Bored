//
//  ActivitiesViewController.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 08/09/22.
//

import UIKit

class ActivitiesViewController: UIViewController {
    private lazy var activitiesView: ActivitiesView = {
        let view = ActivitiesView()
        view.delegate = self
        return view
    }()
    
    private lazy var settingButton: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(systemName: "shuffle"), style: .plain, target: self, action: #selector(shuffle))
    }()
    
    override func viewDidLoad() {
        navigationItem.title = "Activities"
        navigationItem.rightBarButtonItem = settingButton        
    }
    
    override func loadView() {
        view = activitiesView
    }
    
    @objc func shuffle() {
        print("Clicou no shuffle")
        // Por clareza vamos deixar o código repetido
        let suggestionViewController = SuggestionViewController()
        navigationController?.pushViewController(suggestionViewController, animated: true)
    }
}

extension ActivitiesViewController: ActivitiesViewDelegate {
    func navigateToSuggestion() {
        let suggestionViewController = SuggestionViewController()
        navigationController?.pushViewController(suggestionViewController, animated: true)
    }
}
