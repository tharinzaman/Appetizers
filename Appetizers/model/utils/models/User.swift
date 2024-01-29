//
//  User.swift
//  Appetizers
//
//  Created by Tharin Zaman on 20/12/2023.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var dateOfBirth = Date()
    var extraNapkins = false
    var frequentRefills = false
}
