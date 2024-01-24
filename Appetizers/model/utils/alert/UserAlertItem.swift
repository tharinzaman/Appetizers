//
//  UserAlertItem.swift
//  Appetizers
//
//  Created by Tharin Zaman on 20/12/2023.
//

import SwiftUI

struct UserAlertItem {
    
    static let userSavedSuccessfully = AlertItem(
        title: Text(
            "User saved"
        ),
        message: Text(
            "User saved successfully"
        ),
        dismissButton: .default(
            Text(
                "OK"
            )
        )
    )
}
