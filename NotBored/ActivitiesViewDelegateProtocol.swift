//
//  ActivitiesViewDelegateProtocol.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 11/09/22.
//

import Foundation

protocol ActivitiesViewDelegateProtocol: AnyObject {
    func activityCellTapped(activityType: ActivityType)
}
