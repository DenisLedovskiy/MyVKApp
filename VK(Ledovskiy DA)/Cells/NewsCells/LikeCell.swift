//
//  LikeCell.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 20.01.2022.
//

import Foundation
import UIKit

class LikeCell: UITableViewCell {

    @IBOutlet weak var likeText: UILabel!
    @IBOutlet weak var likeButton: UIButton!

override func prepareForReuse() {
    super.prepareForReuse()
    likeText.text = nil
    likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
}

func configure(like: News) {
    likeText.text = like.counterLikeNews
}

override func awakeFromNib() {
    super.awakeFromNib()

}

override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
}
}

