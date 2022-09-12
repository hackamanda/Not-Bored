//
//  InitialViewDelegateProtocol.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 11/09/22.
//

import Foundation

protocol InitialViewDelegateProtocol: AnyObject {
    func navigateToActivities(numberOfParticipants number: Int)
    func navigateToTerms()
}
