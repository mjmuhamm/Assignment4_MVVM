//
//  PeopleViewModelTest.swift
//  Assignment4MVVMTests
//
//  Created by Malik Muhammad on 3/23/26.
//

import XCTest
@testable import Assignment4MVVM

//given
//when
//then

//TDD - Red Green Effected-Output

final class PeopleViewModelTest: XCTestCase {
    
    

    var viewModel : PeopleViewModel!
    var fakeNetorkManager : FakeNetworkManager!
    
    override func setUpWithError() throws {
       
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        //given
        fakeNetorkManager = FakeNetworkManager()
        viewModel = PeopleViewModel(networkManager: fakeNetorkManager)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        fakeNetorkManager = nil
//        viewModel = nil
    }

    func testGetPeopleList_WhenExpectingCorrectResults() async throws {
        
        //when
        fakeNetorkManager.testPath = "PeopleTest"
        await viewModel.getInfo()
        
        //Tests if data produces the expected elements and apiError is nil

        //then
        XCTAssertNotNil(viewModel)
        let data = viewModel.data
        let apiError = viewModel.apiError
        XCTAssertEqual(data.count, 6)
        XCTAssertNil(apiError)
        
        //Tests if data elements are non-nil

        let person = data[0]
        XCTAssertEqual(person.firstName, "Maggie")
        XCTAssertEqual(person.avatar, "https://randomuser.me/api/portraits/women/21.jpg")
        
    }
    
    func testGetPeopleList_WhenExpectingError_PeopleListAsEmpty() async throws {
        
        //Tests if apiError is Non-null and data properly produces 0 elements
        
        
    }
    
    func testGetPeopleList_WhenExpectingError_DigimonListAsEmpty() async throws {
        
        //when
        fakeNetorkManager.testPath = "PeopleTestEmpty"
        await viewModel.getInfo()
        
        
        //then
        XCTAssertNotNil(viewModel)
        let data = viewModel.data
        let apiError = viewModel.apiError
        XCTAssertEqual(data.count, 0)
        XCTAssertNotNil(apiError)
        
        
        
    }
    
   

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
