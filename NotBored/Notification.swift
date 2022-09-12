//
//  Notification.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 11/09/22.
//

import Foundation
import UIKit

final class Notification: UIView {
    
    static func show(title: String, message: String, target: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        target.present(alert, animated: true)
        
    }
}
