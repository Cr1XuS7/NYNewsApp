//
//  NYNewsApp__CodingChallenge__ChristopherBoyajianUITests.swift
//  NYNewsApp--CodingChallenge--ChristopherBoyajianUITests
//
//  Created by Christopher Boyajian on 24/07/2022.
//

import XCTest

class NYNewsApp__CodingChallenge__ChristopherBoyajianUITests: XCTestCase {

    func testView(){
        let app = XCUIApplication()
        app.launch()
        
        let tapCell = app.tables.cells.containing(.staticText, identifier:"By New York Times Games").children(matching: .button).element(boundBy: 1)
        
        tapCell.tap()
       
        
        
    }
}
