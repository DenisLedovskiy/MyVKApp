//
//  StartViewController.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 14.10.2021.
//

import UIKit

class StartViewController: UIViewController {


    @IBOutlet weak var loginText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var startLogo: UIImageView!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var pointOne: UIImageView!
    @IBOutlet weak var pointTwo: UIImageView!
    @IBOutlet weak var pointThree: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(tapFunc))
        self.view.addGestureRecognizer(tapScreen)

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0, 0.8]
        gradientLayer.startPoint = CGPoint.zero
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.frame = self.view.bounds
        gradientLayer.zPosition = 0
        self.view.layer.addSublayer(gradientLayer)

        buttonLogin.layer.zPosition = 1
        passwordText.layer.zPosition = 1
        loginText.layer.zPosition = 1
        startLogo.layer.zPosition = 1
        loginLabel.layer.zPosition = 1
        passwordLabel.layer.zPosition = 1
        pointOne.layer.zPosition = 1
        pointTwo.layer.zPosition = 1
        pointThree.layer.zPosition = 1
        animationPoint(exitAfter: 20, currentCount: 0)

    }

    @objc func tapFunc() {
        self.view.endEditing(true)
    }

    func animationPoint (exitAfter: Int, currentCount: Int) {

        pointTwo.alpha = 0
        pointThree.alpha = 0

        UIView.animate(withDuration: 1) { [weak self] in
            self?.pointOne.alpha = 1
        } completion: { _ in
            UIView.animate(withDuration: 1) { [weak self] in
                self?.pointOne.alpha = 0
                self?.pointTwo.alpha = 1
            } completion: { _ in
                UIView.animate(withDuration: 1) { [weak self] in
                    self?.pointTwo.alpha = 0
                    self?.pointThree.alpha = 1
                } completion: { [weak self] _ in
                    if currentCount < exitAfter {
                        self?.animationPoint(exitAfter: exitAfter, currentCount: currentCount + 1)
                    }
                }
            }
        }
    }


    @IBAction func tapLoginButton(_ sender: Any) {
        guard let login = loginText.text,
              let password = passwordText.text
        else {return}

        if login == "login",
           password == "123" {

            loginText.backgroundColor = UIColor.systemGreen
            passwordText.backgroundColor = UIColor.systemGreen
            performSegue(withIdentifier: "toFriendScreen", sender: nil)
        }
        else {
            loginText.backgroundColor = UIColor.systemRed
            passwordText.backgroundColor = UIColor.systemRed
            return
        }
    }
}
