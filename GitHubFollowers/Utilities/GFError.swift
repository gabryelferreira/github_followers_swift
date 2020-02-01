//
//  ErrorMessage.swift
//  GitHubFollowers
//
//  Created by Gabryel Ferreira on 29/01/20.
//  Copyright © 2020 Gabryel Ferreira. All rights reserved.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "This username created an invalid request. Please try again."
    case noInternetConnection = "Unable to complete your request. Check your internet connection."
    case serverResponseError = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid."
    case userNotFound = "User not found. Try another one."
}
