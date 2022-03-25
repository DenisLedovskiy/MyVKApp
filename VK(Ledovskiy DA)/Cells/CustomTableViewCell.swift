//
//  CustomTableViewCell.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 15.10.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView! {
            didSet {
                avatarImageView.translatesAutoresizingMaskIntoConstraints = false
            }
        }
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    @IBOutlet weak var backView: UIView!{
        didSet {
            backView.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    var completion: ((Friend) -> Void)?
    var friend: Friend?

    let instets: CGFloat = 10
    let imageSize: CGFloat = 50

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
//        titleLabel.text = friend.name
    }

    func configure(group: Group) {
        avatarImageView.image = group.avatar
//        titleLabel.text = group.title
    }

    func setTitleLabel(text: String) {
        titleLabel.text = text
        titleLabelFrame()
        }

    override func layoutSubviews() {
            super.layoutSubviews()

        titleLabelFrame()
        avatarFrame()
        backViewFrame()
        }



    func getLabelSize(text: String, font: UIFont) -> CGSize {
            let maxWidth = bounds.width - instets * 3 - imageSize
            let textBlock = CGSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude)

        let rect = text.boundingRect(with: textBlock, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
            let width = Double(rect.size.width)
            let height = Double(rect.size.height)
            let size = CGSize(width: ceil(width), height: ceil(height))
            return size
    }

    func titleLabelFrame() {
        let titleLabelSize = getLabelSize(text: titleLabel.text!, font: titleLabel.font)
        let titleLabelX = ((bounds.width - titleLabelSize.width) / 2) + imageSize + instets
        let titleLabelY = bounds.height - titleLabelSize.height - instets
        let titleLabelOrigin =  CGPoint(x: titleLabelX, y: titleLabelY)
        titleLabel.frame = CGRect(origin: titleLabelOrigin, size: titleLabelSize)
    }

    func avatarFrame() {
        let avatarSideLinght = imageSize
        let avatarSize = CGSize(width: avatarSideLinght, height: avatarSideLinght)
        let avatarOrigin = CGPoint(x: instets, y: bounds.midY - avatarSideLinght / 2)
        avatarImageView.frame = CGRect(origin: avatarOrigin, size: avatarSize)
    }

    func backViewFrame() {
        let backViewSideLinght = imageSize
        let backViewSize = CGSize(width: backViewSideLinght, height: backViewSideLinght)
        let backViewOrigin = CGPoint(x: instets, y: bounds.midY - backViewSideLinght / 2)
        backView.frame = CGRect(origin: backViewOrigin, size: backViewSize)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.layer.cornerRadius = CGFloat(cellHeight / 2 - 4)
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.borderWidth = 1
        backView.layer.cornerRadius = CGFloat(cellHeight / 2 - 4)
        backView.layer.shadowColor = UIColor.brandGrey.cgColor
//        backView.layer.shadowColor = UIColor.black.cgColor
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



