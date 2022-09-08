//
//  InitialViewController.swift
//  NotBored
//
//  Created by Amanda Hack Adriano on 06/09/22.
//

import UIKit

class InitialViewController: UIViewController {
    
    private lazy var initialView: InitialView = {
        let view = InitialView()
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadView()
        
    }
    
    override func loadView() {
        view = initialView
    }
}

extension InitialViewController: InitialViewDelegate {
    func navigateToTerms() {
        let termsViewController = TermsViewConstroller()
        termsViewController.modalPresentationStyle = .fullScreen
        present(termsViewController, animated: true)
    }
    
    func navigateToActivities() {
        let activitiesViewController = ActivitiesViewController()
        navigationController?.pushViewController(activitiesViewController, animated: true)
    }
}
