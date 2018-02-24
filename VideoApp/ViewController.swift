//
//  ViewController.swift
//  VideoApp
//
//  Created by Shinde, Yoovraj
//  Copyright © 2018 Yoovraj Shinde. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        VideoListApi().getList { (videoArray) in
            print(videoArray)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

