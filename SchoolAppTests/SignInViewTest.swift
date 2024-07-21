//
//  SignInViewTest.swift
//  SchoolAppTests
//
//  Created by Esse Jacques  on 20/07/2024.
//

import XCTest
@testable import SchoolApp

final class SignInViewTest: XCTestCase {

    @Published var email : String = "";
    @Published var password : String = "";
    let subject = SignInView(email: .constant(""), password: .constant(""));
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.

    }

    func testIfWeHaveLoginText() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.

        // 1-  verify we have a text with Login and has font as title
        // 2- Verify if we have email
        // 3- Verify if we have passord
        // 4- verify if we have a button with login text inside
        //XCTAssertEqual(self.subject.)
    }

    func testSubTitle() throws {
        let app = XCUIApplication()
        app.launch()

        // Locate UI elements using accessibility identifiers
        let emailTextField = app.textFields["emailTextField"]
        XCTAssertTrue(emailTextField.exists)
        emailTextField.tap()
        emailTextField.typeText("testuser@example.com")

        let passwordTextField = app.secureTextFields["passwordTextField"]
        XCTAssertTrue(passwordTextField.exists)
        passwordTextField.tap()
        passwordTextField.typeText("password")
    }


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
