//
//  LikesCell.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 28.01.2022.
//

import Foundation
import UIKit

class LikesNews: UITableViewCell {


    @IBOutlet weak var likesButton: UIButton!
    @IBOutlet weak var counterOfLikes: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        counterOfLikes.text = nil
        likesButton.setImage(UIImage(systemName: "heart"), for: .normal)
    }

    func configure(like: News) {
        counterOfLikes.text = like.counterLikeNews
    }

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }


}
