//
//  VideoTableViewCell.swift
//  VideoApp
//
//  Created by Shinde, Yoovraj | Yubi | ECID on 2018/02/24.
//  Copyright © 2018 Yoovraj Shinde. All rights reserved.
//

import UIKit
import Kingfisher

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailUrl: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var presenterName: UILabel!
    @IBOutlet weak var videoDescription: UILabel!
    @IBOutlet weak var videoDuration: UILabel!
    
    func populate(video:Video) -> Void {
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
