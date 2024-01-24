//
//  Order.swift
//  Appetizers
//
//  Created by Tharin Zaman on 21/12/2023.
//

import Foundation
import SwiftUI

final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []

    func add(_ appetizer: Appetizer) {
        self.items.append(appetizer)
    }
    
    func remove(atOffSets: IndexSet) {
        self.items.remove(atOffsets: atOffSets)
    }
     
    func removeAll() {
        self.items.removeAll()
    }
    
    func hasItems() -> Bool {
        return !self.items.isEmpty
    }
    
    func size() -> Int {
        return self.items.count
    }
    
    var totalPrice: Double {
        items.reduce(0) {
            $0 + $1.price
        }
    }
    
}
