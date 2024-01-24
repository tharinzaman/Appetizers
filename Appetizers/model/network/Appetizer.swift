//
//  Appetizer.swift
//  Appetizers
//
//  Created by Tharin Zaman on 19/12/2023.
//

import Foundation

struct Appetizer: Decodable, Identifiable, Equatable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable, Equatable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(
        id: 1,
        name: "Burger 1",
        description: "Delicious and juicy",
        price: 10.99,
        imageURL: "",
        calories: 200,
        protein: 20,
        carbs: 55
    )
    
    static let orderItem1 = Appetizer(
        id: 1,
        name: "Burger 2",
        description: "Delicious and juicy",
        price: 10.99,
        imageURL: "",
        calories: 200,
        protein: 20,
        carbs: 55
    )
    static let orderItem2 = Appetizer(
        id: 2,
        name: "Burger 3",
        description: "Delicious and juicy",
        price: 10.99,
        imageURL: "",
        calories: 200,
        protein: 20,
        carbs: 55
    )
    static let orderItem3 = Appetizer(
        id: 3,
        name: "Burger",
        description: "Delicious and juicy",
        price: 10.99,
        imageURL: "",
        calories: 200,
        protein: 20,
        carbs: 55
    )
    
    static let orderItems = [orderItem1, orderItem2, orderItem3]
}
