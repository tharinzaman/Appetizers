//
//  AlertError.swift
//  Appetizers
//
//  Created by Tharin Zaman on 19/12/2023.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct ErrorAlertItems {
    
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
    
    static let missingDetail = AlertItem(
        title: Text(
            "Missing detail"
        ),
        message: Text(
            "Please fill in all details"
        ),
        dismissButton: .default(Text("OK"))
    )
    
    static let invalidEmail = AlertItem(
        title: Text(
            "Invalid email address"
        ),
        message: Text(
            "Please provide a valid email address"
        ),
        dismissButton: .default(Text("OK"))
    )
}
