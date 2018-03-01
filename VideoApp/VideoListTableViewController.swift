//
//  VideoListTableViewController.swift
//  VideoApp
//
//  Created by Shinde, Yoovraj
//  Copyright © 2018 Yoovraj Shinde. All rights reserved.
//

import UIKit
import MobilePlayer

class VideoListTableViewController: UITableViewController {
    
    var videoList:[Video] = []
    let reUseIdentifier = "VideoTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Video List table"
        view.backgroundColor = UIColor.lightGray
        tableView.layoutMargins = UIEdgeInsetsMake(0, 0, 0, 0)
        
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        if #available(iOS 11.0, *) {
//            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
//            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
//            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//        } else {
//            // Fallback on earlier versions
//            let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
//            tableView.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor).isActive = true
//            tableView.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor).isActive = true
//            tableView.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor, constant: statusBarHeight).isActive = true
//            tableView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.bottomAnchor).isActive = true
//        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView .register(UINib(nibName: "VideoTableViewCell", bundle: nil),
                            forCellReuseIdentifier: reUseIdentifier)
        
        tableView.rowHeight =  UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 150
        
        VideoListApi().getList { (fetchedArray) in
            self.videoList = fetchedArray
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        tableView.contentInset = UIEdgeInsetsMake(14, 0, 0, 10)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return videoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reUseIdentifier, for: indexPath) as! VideoTableViewCell
        
        
        // Configure the cell...
        cell.populate(video: videoList[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let video = videoList[indexPath.row]
        let videoURL = URL(string: video.video_url)
        let playerVC = MobilePlayerViewController(contentURL: videoURL!)
        playerVC.title = video.title
        playerVC.activityItems = [video.video_url]
        present(playerVC, animated: true, completion: nil)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func populateVideoTableViewCellwith(video:Video) -> VideoTableViewCell {
        let videoTableViewCell = VideoTableViewCell()
        videoTableViewCell.populate(video: video)
        return videoTableViewCell
    }

}

