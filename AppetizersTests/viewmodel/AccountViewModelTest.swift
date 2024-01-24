//
//  AccountViewModelTest.swift
//  AppetizersTests
//
//  Created by Tharin Zaman on 13/01/2024.
//

import XCTest
@testable import Appetizers

//final class AccountViewModelTest: XCTestCase {
//    
//    // Under testing
//    var viewModel : AccountViewModel?
//    
//    let validUser = User(
//        firstName: "Tharin",
//        lastName: "Zaman",
//        email: "tharinzaman@hotmail.com"
//    )
//    
//    override func setUpWithError() throws {
//        viewModel = AccountViewModel(storage: MockStorageProtocolImpl())
//    }
//    
//    override func tearDownWithError() throws {
//        viewModel = nil
//    }
//    
//    func test_isValidForm_True() {
//        // ARRANGE
//        guard let viewModel else {
//            XCTFail()
//            return
//        }
//        viewModel.user = validUser
//        // ACT
//        let result = viewModel.isValidForm
//        // ASSERT
//        XCTAssertTrue(result)
//        XCTAssertNil(viewModel.alertItem)
//    }
//    
//    func test_isValidForm_False_EmptyFields() {
//        // ARRANGE
//        guard let viewModel else {
//            XCTFail()
//            return
//        }
//        // ACT
//        let isValidForm = viewModel.isValidForm
//        let alert = viewModel.alertItem
//        // ASSERT
//        XCTAssertFalse(isValidForm)
//        XCTAssertEqual(alert?.message, ErrorAlertItems.missingDetail.message)
//    }
//    
//    func test_isValidForm_False_InvalidEmail() {
//        // ARRANGE
//        guard let viewModel else {
//            XCTFail()
//            return
//        }
//        viewModel.user = User(firstName: "T", lastName: "Z", email: "@3293.c")
//        // ACT
//        let isValidForm = viewModel.isValidForm
//        let alert = viewModel.alertItem
//        // ASSERT
//        XCTAssertFalse(isValidForm)
//        XCTAssertEqual(alert?.message, ErrorAlertItems.invalidEmail.message)
//    }
//
//    func test_SaveAndRetrieveUserChanges_Success() {
//        guard let viewModel else {
//            XCTFail()
//            return
//        }
//        // ARRANGE
//        viewModel.user = validUser
//        // ACT
//        viewModel.saveUserChangesToStorage()
//        viewModel.retrieveUserDetailsFromStorage()
//        // ASSERT
//        XCTAssertEqual(viewModel.user.email, validUser.email)
//    }
   
//    func test_SaveAndRetrieveChanges_Unsuccessful() {
//        // ARRANGE
//        let emptyFirstNameUser = User(lastName: "Zaman", email: "tzaman@gmail.com")
//        viewModel.user = emptyFirstNameUser
//        viewModel.saveUserChangesToStorage()
//        viewModel.retrieveUserDetailsFromStorage()
//        // ACT
//        
//        // ASSERT
//    }

//}
