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
    let video_duration:Double
    
    init(title:String,
         presenter_name:String,
         description:String,
         thumbnail_url:String,
         video_url:String,
         video_duration:Double) {
        self.title = title
        self.presenter_name = presenter_name
        self.description = description
        self.thumbnail_url = thumbnail_url
        self.video_url = video_url
        self.video_duration = video_duration
    }

    init?(json: [String: AnyObject]) {
        guard
            let title = json["title"] as? String,
            let presenter_name = json["presenter_name"] as? String,
            let description = json["description"] as? String,
            let thumbnail_url = json["thumbnail_url"] as? String,
            let video_url = json["video_url"] as? String,
            let video_duration:Double = (json["video_duration"] as? NSNumber)?.doubleValue
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
    
    func getFormattedVideoDuration() -> String {
        let seconds = UInt32( video_duration / 1000 )
        let hrs  = (seconds % 86400) / 3600
        let min  = (seconds % 3600) / 60
        let sec  = (seconds % 3600) % 60
        
        let string =
            (hrs > 0  ? String(format : "%02d:",hrs) : "") +
                (min >= 0 ? String(format : "%02d:",min) : "") +
                (sec >= 0 ? String(format : "%02d",sec)  : "")
        return string
    }
}
