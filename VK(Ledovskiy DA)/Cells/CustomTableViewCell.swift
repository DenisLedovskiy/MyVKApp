//
//  CustomTableViewCell.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 15.10.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backView: UIView!

    var completion: ((Friend) -> Void)?
    var friend: Friend?

    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImageView.image = nil
        titleLabel.text = nil
        completion = nil
        friend = nil
    }

    func configure(friend: Friend, completion: ((Friend) -> Void)?) {
        self.completion = completion
        self.friend = friend
        avatarImageView.image = friend.avatar
        titleLabel.text = friend.name
    }

    func configure(group: Group) {
        avatarImageView.image = group.avatar
        titleLabel.text = group.title
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.layer.cornerRadius = CGFloat(cellHeight / 2 - 4)
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.borderWidth = 1
        backView.layer.cornerRadius = CGFloat(cellHeight / 2 - 4)
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowOffset = CGSize(width: 6, height: 6)
        backView.layer.shadowRadius = 8
        backView.layer.shadowOpacity = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }


    @IBAction func pressAvatarButton(_ sender: Any) {

        let scale = CGFloat(10)

        UIView.animate(withDuration: 1) { [weak self] in
            guard let self = self else {return}

            self.avatarImageView.frame = CGRect(x: self.avatarImageView.frame.origin.x - scale/2,
                                                y: self.avatarImageView.frame.origin.y - scale/2,
                                                width: self.avatarImageView.frame.width + scale,
                                                height: self.avatarImageView.frame.height + scale)
        } completion: { isSuccessfully in }
        
        UIView.animate(withDuration: 2,
                       delay: 0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 0.7,
                       options: []) { [weak self] in
            guard let self = self else {return}

            self.avatarImageView.frame = CGRect(x: self.avatarImageView.frame.origin.x - scale/2,
                                                y: self.avatarImageView.frame.origin.y - scale/2,
                                                width: self.avatarImageView.frame.width + scale,
                                                height: self.avatarImageView.frame.height + scale)
        } completion: { [weak self] isAllSuccessfully in
            guard let self = self else {return}
            if isAllSuccessfully,
               let friend = self.friend
            {
                self.completion?(friend)
            }
        }
    }
}



