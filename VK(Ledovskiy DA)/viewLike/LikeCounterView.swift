//
//  LikeCounterView.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 26.10.2021.
//

import UIKit

class LikeCounterView: UIView {

    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var likeCounterLabel: UILabel!
    var likeEnable = false
    var counter = 0

    private var view: UIView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func loadFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "LikeCounterView", bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as?
                UIView else {return UIView()}
        return view
    }

    private func setup() {
        view = loadFromNib()
        guard let view = view else {return}
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }

    @IBAction func pressHeartButton(_ sender: Any) {
        guard let button = sender as? UIButton else {return}
        if likeEnable {
            button.setImage(UIImage(systemName: "heart"), for: .normal)
            counter -= 1
            likeCounterLabel.text = String(counter)
        } else {
            button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            counter += 1
            likeCounterLabel.text = String(counter)
        }
        likeEnable = !likeEnable
    }

}
