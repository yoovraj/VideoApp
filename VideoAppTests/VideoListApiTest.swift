//
//  VideoListApiTest.swift
//  VideoAppTests
//
//  Created by Shinde, Yoovraj
//  Copyright © 2018 Yoovraj Shinde. All rights reserved.
//

import XCTest
@testable import VideoApp
class VideoListApiTest: XCTestCase {
    
    let videoListApi = VideoListApi()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_videoListApi() -> Void {
        let expectationVideoList = expectation(description: "Video list fetch succeded")
        
        videoListApi.getList { (videoArray) in
            expectationVideoList.fulfill()
            XCTAssertNotNil(videoArray)
            XCTAssertTrue(videoArray.count == 5)
        }
        
        waitForExpectations(timeout: 5.0) { (error) in
            print(error.debugDescription)
        }
    }
}
