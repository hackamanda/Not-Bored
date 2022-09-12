//
//  SuggestionViewController.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 08/09/22.
//

import UIKit

class SuggestionViewController: UIViewController {
    // MARK: - Screen objects
    private lazy var suggestionView: SuggestionView = {
        let view = SuggestionView(with: activity, isRamdom: isRamdom, target: self)
        view.backgroundColor = UIColor(red: 32/255, green: 32/255, blue: 32/255, alpha: 1)
        return view
    }()
    
    // MARK: Properties
    let activity: Activity
    let isRamdom: Bool
    
    // MARK: - Initializers
    init(activity: Activity, isRamdom: Bool) {
        self.activity = activity
        self.isRamdom = isRamdom
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle methods
    override func loadView() {
        view = suggestionView
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }
}
