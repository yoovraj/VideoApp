//
//  VideoListApi.swift
//  VideoApp
//
//  Created by Shinde, Yoovraj
//  Copyright © 2018 Yoovraj Shinde. All rights reserved.
//

import UIKit

class VideoListApi: NSObject {
    let urlSession = URLSession(configuration: .default)
    
    var dataTask: URLSessionDataTask? = nil
    
    func getList(completion:@escaping ([Video]) -> Void) -> Void {
        // cancel existing task if present
        dataTask?.cancel()
        
        //prepare the url
        let url = URL(string: "https://gist.githubusercontent.com/sa2dai/04da5a56718b52348fbe05e11e70515c/raw/c7bb2472537f4527f9640e456eee3337139f7656/code_test_iOS.json")
        let urlRequest = URLRequest(url: url!,
                                    cachePolicy: .reloadIgnoringLocalCacheData,
                                    timeoutInterval: 1.0)
        urlSession.dataTask(with: urlRequest)
        dataTask = urlSession.dataTask(with: urlRequest) { (data, response, error) in
            // after completion handler gets finished set datatask to nil
            defer {self.dataTask = nil }
            
            if let error = error {
                print(error)
            } else if
                let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                do {
                    
                    if let dataJson = try JSONSerialization.jsonObject(with: data, options: []) as? [Any]{
                        //print(dataJson)
                        var videoArray:[Video] = []
                        for case let videoJson in dataJson {
                            if let video = Video(json: (videoJson as? [String:Any])!) {
                                videoArray.append(video)
                            }
                        }
                        
                        //print(videoArray)
                        completion(videoArray)
                    } else {
                        print("parsed dataJson is nil")
                        completion([])
                    }
                } catch {
                    print("cannot parse json exception occurred")
                    completion([])
                }
            }
        }
        
        // start the task
        dataTask?.resume()
    }
}
