//
//  GalleryCollectionCell.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 22.10.2021.
//

import UIKit

class GalleryCollectionCell: UICollectionViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var likeCounter: UILabel!

    var likeEnable = false
    var counter = 0

    override func prepareForReuse() {
        super.prepareForReuse()
        self.photoImageView.image = nil
        likeEnable = false
        heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
    }

    func configure(image: UIImage?) {
        photoImageView.image = image
    }

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    @IBAction func pressHeartButton(_ sender: Any) {
        guard let button = sender as? UIButton else {return}

        if likeEnable {
            button.setImage(UIImage(systemName: "heart"), for: .normal)
            counter -= 1
            UIView.transition(with: likeCounter,
                              duration: 1,
                              options: .transitionFlipFromTop,
                              animations: {
                self.likeCounter.text = String(self.counter)})
        } else {
            button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            counter += 1
            UIView.transition(with: likeCounter,
                              duration: 1,
                              options: .transitionFlipFromBottom,
                              animations: {
                self.likeCounter.text = String(self.counter)})
        }
        likeEnable = !likeEnable
    }
}
