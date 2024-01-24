//
//  ErrorAlertItem.swift
//  Appetizers
//
//  Created by Tharin Zaman on 20/12/2023.
//

import SwiftUI

struct ErrorAlertItems {
    
    // MARK: - Network error alerts
    
    static let invalidURL = AlertItem(
        title: Text(
            "Invalid URL"
        ),
        message: Text(
            "Could not fetch appetizers due to invalid URL"
        ),
        dismissButton: .default(
            Text(
                "OK"
            )
        )
    )
    
    static let invalidResponse = AlertItem(
        title: Text(
            "Invalid Response"
        ),
        message: Text(
            "Could not fetch appetizers due to invalid reponse"
        ),
        dismissButton: .default(
            Text(
                "OK"
            )
        )
    )
    
    static let invalidData = AlertItem(
        title: Text(
            "Invalid Data"
        ),
        message: Text(
            "Could not fetch appetizers due to invalid data"
        ),
        dismissButton: .default(
            Text(
                "OK"
            )
        )
    )
    
    static let unableToComplete = AlertItem(
        title: Text(
            "Unable to complete"
        ),
        message: Text(
            "Could not fetch appetizers, unable to complete"
        ),
        dismissButton: .default(
            Text(
                "OK"
            )
        )
    )
    
    // MARK: - User error alerts
    
    static let missingDetail = AlertItem(
        title: Text(
            "Missing detail"
        ),
        message: Text(
            "Please fill in all details"
        ),
        dismissButton: .default(
            Text(
                "OK"
            )
        )
    )
    
    static let invalidEmail = AlertItem(
        title: Text(
            "Invalid email address"
        ),
        message: Text(
            "Please provide a valid email address"
        ),
        dismissButton: .default(
            Text(
                "OK"
            )
        )
    )
    
    static let unableToSaveUser = AlertItem(
        title: Text(
            "Unable to save user"
        ),
        message: Text(
            "Saving user went wrong"
        ),
        dismissButton: .default(
            Text(
                "OK"
            )
        )
    )
    
    static let unableToRetrieveUser = AlertItem(
        title: Text(
            "Unable to retrieve user"
        ),
        message: Text(
            "Retrieving user went wrong"
        ),
        dismissButton: .default(
            Text(
                "OK"
            )
        )
    )
}
