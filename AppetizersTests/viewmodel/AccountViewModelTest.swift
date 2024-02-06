//
//  AccountViewModelTest.swift
//  AppetizersTests
//
//  Created by Tharin Zaman on 13/01/2024.
//

import XCTest
@testable import Appetizers

final class AccountViewModelTest: XCTestCase {
    
    private var validUser: User!
    
    private var vm: AccountViewModel!
    
    private var encoder: JSONEncoder!
    private var decoder: JSONDecoder!
    
    override func setUp() {
        encoder = StubEncoderSuccess()
        decoder = StubDecoderSuccess()
        
        vm = AccountViewModel(
            encoder: self.encoder,
            decoder: self.decoder
        )
        
        validUser = User(
            firstName: "Tharin",
            lastName: "Zaman",
            email: "tharinzaman@hotmail.com"
        )
        vm.user = validUser
    }
    
    override func tearDown() {
        validUser = nil
        vm = nil
    }
    
    func test_isValidForm_True() {
        // ARRANGE
        // ACT
        let result = vm.isValidForm
        // ASSERT
        XCTAssertTrue(
            result
        )
        XCTAssertNil(
            vm.alertItem
        )
    }
    
    func test_isValidForm_False_EmptyFields() {
        // ARRANGE
        vm.user.firstName = ""
        // ACT
        let result = vm.isValidForm
        // ASSERT
        XCTAssertFalse(
            result
        )
        XCTAssertEqual(
            vm.alertItem?.message,
            ErrorAlertItems.missingDetail.message
        )
    }
    
    func test_isValidForm_False_InvalidEmail() {
        // ARRANGE
        vm.user.email = "t@hm.co.us.32.i"
        // ACT
        let result = vm.isValidForm
        // ASSERT
        XCTAssertFalse(
            result
        )
        XCTAssertEqual(
            vm.alertItem?.message,
            ErrorAlertItems.invalidEmail.message
        )
    }
    
    func test_saveUserChanges_Success() {
        // ARRANGE
        // ACT
        vm.saveUserChangesToStorage()
        vm.retrieveUserDetailsFromStorage() // Retrieve to make sure the right details were saved
        // ASSERT
        XCTAssertEqual(
            vm.user.email,
            validUser.email
        )
        XCTAssertEqual(
            vm.alertItem?.message,
            UserAlertItem.userSavedSuccessfully.message
        )
    }
    
    func test_saveUserChangesToStorage_failure_invalidForm() {
        // ARRANGE
        vm.user.firstName = ""
        // ACT
        vm.saveUserChangesToStorage()
        // ASSERT
        XCTAssertFalse(
            vm.isValidForm
        )
        XCTAssertEqual(
            vm.alertItem?.message,
            ErrorAlertItems.missingDetail.message
        )
    }
    
    func test_saveUserChangesToStorage_failure_unableToSaveUserError() {
        // ASSIGN
        encoder = StubEncoderFailure()
        vm = AccountViewModel(
            encoder: self.encoder,
            decoder: self.decoder
        )
        vm.user = validUser
        // ACT
        vm.saveUserChangesToStorage()
        // ASSERT
        XCTAssertEqual(
            vm.alertItem?.message,
            ErrorAlertItems.unableToSaveUser.message
        )
    }
    
    func test_retrieveUserDetailsFromStorage_success() {
        // ASSIGN
        // ACT
        vm.retrieveUserDetailsFromStorage()
        // ASSERT
        XCTAssertEqual(
            vm.user.email,
            validUser.email
        )
    }
    
    func test_retrieveUserDetailsFromStorage_failure_unableToRetrieveUser() {
        // ASSIGN
        decoder = StubDecoderFailure()
        vm = AccountViewModel(
            encoder: self.encoder,
            decoder: self.decoder
        )
        vm.user = validUser
        // ACT
        vm.retrieveUserDetailsFromStorage()
        // ASSERT
        XCTAssertEqual(
            vm.alertItem?.message,
            ErrorAlertItems.unableToRetrieveUser.message
        )
    }
    
}
