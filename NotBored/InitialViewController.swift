//
//  InitialViewController.swift
//  NotBored
//
//  Created by Amanda Hack Adriano on 06/09/22.
//

import UIKit

class InitialViewController: UIViewController {
    
    private lazy var initialView: InitialView = {
        let initialView = InitialView()
        return initialView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadView()
        //view.backgroundColor = .systemPink
        
    }
    
    override func loadView() {
        view = initialView
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
