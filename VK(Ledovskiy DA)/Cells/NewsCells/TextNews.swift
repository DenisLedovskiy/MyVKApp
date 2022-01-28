//
//  TextNews.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 20.01.2022.
//

import Foundation
import UIKit

class TextNews: UITableViewCell {

    @IBOutlet weak var textNews: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        textNews.text = nil
    }

    func configure(text: News) {
        textNews.text = text.textNews
    }

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

