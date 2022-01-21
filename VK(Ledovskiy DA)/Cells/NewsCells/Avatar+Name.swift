//
//  Avatar+Name.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 20.01.2022.
//

import Foundation
import UIKit

class AvatarNameCell: UITableViewCell {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!


    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImage.image = nil
        nameLabel.text = nil
    }

    func configure(news: News) {
        avatarImage.image = news.avatarNews
        nameLabel.text = news.titleNews
    }

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
