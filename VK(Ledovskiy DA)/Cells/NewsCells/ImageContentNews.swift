//
//  ImageContentNews.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 20.01.2022.
//

import Foundation
import UIKit

class ImageContentNews: UITableViewCell {

    @IBOutlet weak var imageContent: UIImageView!

    override func prepareForReuse() {
        super.prepareForReuse()
        imageContent.image = nil
    }

    func configure(image: News) {
        imageContent.image = image.contentImageNews
    }

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

