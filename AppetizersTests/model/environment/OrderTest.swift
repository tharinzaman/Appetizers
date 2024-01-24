//
//  OrderTest.swift
//  AppetizersTests
//
//  Created by Tharin Zaman on 11/01/2024.
//

import XCTest
@testable import Appetizers

final class OrderTest: XCTestCase {
    
    let order = Order()
    
    override func tearDown() {
        order.removeAll()
    }

    func test_AddItemToOrder_Success() {
        // ARRANGE
        order.add(
            MockData.sampleAppetizer
        )
        // ACT
        let result = order.size()
        // ASSERT
        XCTAssertEqual(
            result,
            1
        )
    }
    
    func test_RemoveItemFromOrder_Success() {
        // ARRANGE
        order.add(
            MockData.sampleAppetizer
        )
        order.remove(
            atOffSets: [0]
        )
        // ACT
        let result = order.hasItems()
        // ASSERT
        XCTAssertFalse(
            result
        )
    }
    // Write a test where you try to remove but there is nothing in the order
    
    func test_RemoveAllItemsFromOrder_Success() {
        // ARRANGE
        order.items = MockData.orderItems
        order.removeAll()
        // ACT
        let result = order.hasItems()
        // ASSERT
        XCTAssertFalse(
            result
        )
    }
    // Write a test where you try to remove ALL but there is nothing in the order
    
    func test_CalculateTotalPriceForItemsInOrder_Success() {
        // ARRANGE
        order.items = MockData.orderItems
        // ACT
        let result = order.totalPrice
        // ASSERT
        XCTAssertEqual(
            result,
            (
                MockData.orderItem1.price +
                MockData.orderItem2.price +
                MockData.orderItem3.price
            )
        )
    }
}
