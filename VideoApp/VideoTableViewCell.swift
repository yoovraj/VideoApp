//
//  VideoTableViewCell.swift
//  VideoApp
//
//  Created by Shinde, Yoovraj
//  Copyright © 2018 Yoovraj Shinde. All rights reserved.
//

import UIKit
import SDWebImage

class VideoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailUrl: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var presenterName: UILabel!
    @IBOutlet weak var videoDescription: UILabel!
    @IBOutlet weak var videoDuration: UILabel!
    
    func populate(video:Video) -> Void {
        let url = URL(string: video.thumbnail_url)
        imageView?.sd_setImage(with: url, placeholderImage: UIImage(named:"test"), options: .retryFailed, completed: { (image, error, cacheType, url) in
            self.imageView?.contentMode = .scaleAspectFit
            self.imageView?.image = image?.resizeImage(size: (self.imageView?.frame.size)!)
        })
        title.text = video.title
        presenterName.text = video.presenter_name
        videoDescription.text = video.description
        videoDuration.text = video.getFormattedVideoDuration()
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

extension UIImage {
    func resizeImage(size:CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size)
        self.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage!
    }
}
