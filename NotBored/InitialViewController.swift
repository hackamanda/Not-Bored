//
//  InitialViewController.swift
//  NotBored
//
//  Created by Amanda Hack Adriano on 06/09/22.
//

import UIKit

class InitialViewController: UIViewController {
    // MARK: - Screen Objects
    private lazy var initialView: InitialView = {
        let view = InitialView()
        view.backgroundColor = UIColor(red: 32/255, green: 32/255, blue: 32/255, alpha: 1)
        view.delegate = self
        return view
    }()
    
    // MARK: - Life cycle methods
    override func loadView() {
        view = initialView
    }
}

// MARK: - Initial view delegate
extension InitialViewController: InitialViewDelegateProtocol {
    // MARK: - Navigation methods
    func navigateToTerms() {
        let termsViewController = TermsViewConstroller()
        termsViewController.modalPresentationStyle = .fullScreen
        present(termsViewController, animated: true)
    }
    
    func navigateToActivities(numberOfParticipants number: Int) {
        let activitiesViewController = ActivitiesViewController(numberOfParticipants: number)
        navigationController?.pushViewController(activitiesViewController, animated: true)
    }
}
