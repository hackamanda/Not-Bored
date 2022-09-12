//
//  TermsViewController.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 07/09/22.
//

import Foundation
import UIKit

class TermsViewConstroller: UIViewController {
    // MARK: - Screen objects
    private lazy var termsView: TermsView = {
        let view = TermsView()
        view.backgroundColor = UIColor(red: 32/255, green: 32/255, blue: 32/255, alpha: 1)
        view.delegate = self
        return view
    }()
    
    // MARK: - Life cycle methods
    override func loadView() {
        view = termsView
    }
}

// MARK: - Terms view delegate
extension TermsViewConstroller: TermsViewDelegateProtocol {
    // MARK: - Navigation methods
    func returnToInitial() {
        dismiss(animated: true)
    }
}
