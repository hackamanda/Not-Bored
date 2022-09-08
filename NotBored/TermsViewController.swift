//
//  TermsViewController.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 07/09/22.
//

import Foundation
import UIKit

class TermsViewConstroller: UIViewController {
    private lazy var termsView: TermsView = {
        let view = TermsView()
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadView()
    }
    
    override func loadView() {
        view = termsView
    }
    
    func voltar() {
        
    }
}

extension TermsViewConstroller: TermsViewDelegate {
    func returnToInitial() {
        dismiss(animated: true)
    }
    
    
}
