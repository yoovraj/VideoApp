//
//  ViewController.swift
//  VideoApp
//
//  Created by Shinde, Yoovraj
//  Copyright © 2018 Yoovraj Shinde. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let greenView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(greenView)
        view.backgroundColor = .red
//        greenView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        greenView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            greenView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
            greenView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
            greenView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            greenView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        } else {
            // Fallback on earlier versions
            let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
            greenView.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor).isActive = true
            greenView.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor).isActive = true
            greenView.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor, constant: statusBarHeight).isActive = true
            greenView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.bottomAnchor).isActive = true
        }
        greenView.backgroundColor = .green
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func setupView() {
        greenView.translatesAutoresizingMaskIntoConstraints = false
        greenView.backgroundColor = .green
        view.addSubview(greenView)
    }


}

