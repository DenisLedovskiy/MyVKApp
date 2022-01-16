//
//  NewsTableViewCell.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 26.10.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsAvatar: UIImageView!
    @IBOutlet weak var newsLabel: UILabel!
    @IBOutlet weak var newsText: UILabel!
    @IBOutlet weak var contentImageNews: UIImageView!
    

    override func prepareForReuse() {
        newsAvatar.image = nil
        newsLabel.text = nil
        newsText.text = nil
        contentImageNews.image = nil
    }

    func configure(news: News) {
        newsAvatar.image = news.avatarNews
        newsLabel.text = news.titleNews
        newsText.text = news.textNews
        contentImageNews.image = news.contentImageNews
    }

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
