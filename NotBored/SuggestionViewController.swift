//
//  SuggestionViewController.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 08/09/22.
//

import UIKit

class SuggestionViewController: UIViewController {
    private lazy var suggestionView: SuggestionView = {
        let view = SuggestionView()
        return view
    }()

    override func viewDidLoad() {
        navigationItem.title = "Random"
    }
    
    override func loadView() {
        view = suggestionView
    }
}
