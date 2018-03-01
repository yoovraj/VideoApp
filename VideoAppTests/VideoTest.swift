//
//  VideoTest.swift
//  VideoAppTests
//
//  Created by Shinde, Yoovraj
//  Copyright © 2018 Yoovraj Shinde. All rights reserved.
//

import XCTest
@testable import VideoApp

class VideoTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_Video() -> Void {
        let testData = [
            "title" : "test video",
            "presenter_name" : "yoovraj",
            "description" : "this is video about ios",
            "thumbnail_url" : "https://recruit-a.akamaihd.net/pd/4477599122001/201512/23/4477599122001_4672789792001_4672787431001-vs.jpg?pubId=4477599122001",
            "video_url" : "https://testVideoURL.com"
        ]
        let videoDuration:Double = 60000
        
        let video = Video(title: testData["title"]!,
                          presenter_name: testData["presenter_name"]!,
                          description: testData["description"]!,
                          thumbnail_url: testData["thumbnail_url"]!,
                          video_url: testData["video_url"]!,
                          video_duration: videoDuration)
        XCTAssertTrue(video.title == testData["title"]!)
        XCTAssertTrue(video.presenter_name == testData["presenter_name"]!)
        XCTAssertTrue(video.description == testData["description"]!)
        XCTAssertTrue(video.thumbnail_url == testData["thumbnail_url"]!)
        XCTAssertTrue(video.video_url == testData["video_url"]!)
        XCTAssertTrue(video.video_duration == videoDuration)
    }
    
    func test_VideoWithJson() -> Void {
        let video_duration:Double = 677187
        let testData = [
            "title" : "test video",
            "presenter_name" : "yoovraj",
            "description" : "this is video about ios",
            "thumbnail_url" : "https://recruit-a.akamaihd.net/pd/4477599122001/201512/23/4477599122001_4672789792001_4672787431001-vs.jpg?pubId=4477599122001",
            "video_url" : "https://testVideoURL.com",
            "video_duration" : video_duration
        ] as [String:AnyObject]
        let video = Video(json: testData)
        
        XCTAssertTrue(video?.title == testData["title"]! as? String, "\(String(describing: video?.title)) vs \(String(describing: testData["title"]))")
        XCTAssertTrue(video?.presenter_name == testData["presenter_name"]! as? String)
        XCTAssertTrue(video?.description == testData["description"]! as? String)
        XCTAssertTrue(video?.thumbnail_url == testData["thumbnail_url"]! as? String)
        XCTAssertTrue(video?.video_url == testData["video_url"]! as? String)
        XCTAssertTrue(video?.video_duration == video_duration)
    }
}
