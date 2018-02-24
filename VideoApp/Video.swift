//
//  Video.swift
//  VideoApp
//
//  Created by Shinde, Yoovraj
//  Copyright © 2018 Yoovraj Shinde. All rights reserved.
//

import Foundation

struct Video {
    let title:String
    let presenter_name:String
    let description:String
    let thumbnail_url:String
    let video_url:String
    let video_duration:UInt32
    
    init?(json: [String: Any]) {
        guard
            let title = json["title"] as? String,
            let presenter_name = json["presenter_name"] as? String,
            let description = json["description"] as? String,
            let thumbnail_url = json["thumbnail_url"] as? String,
            let video_url = json["video_url"] as? String,
            let video_duration = json["video_duration"] as? UInt32
            else {
                return nil
        }
        self.title = title
        self.presenter_name = presenter_name
        self.description = description
        self.thumbnail_url = thumbnail_url
        self.video_url = video_url
        self.video_duration = video_duration
    }
}
