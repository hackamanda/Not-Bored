//
//  CustomError.swift
//  NotBored
//
//  Created by Luciano Da Silva Berchon on 11/09/22.
//

import Foundation

enum CustomError: String, Error {
    case NetworkNoActivityFound = "No activity found with the specified parameters"
    case NetworkBadRequest = "Bad request error"
    case NetworkResponseError = "Response error. Status code different from 200"
    case NetworkInvalidData = "Invalid data"
    case ServiceUrlError = "URL error"
}
