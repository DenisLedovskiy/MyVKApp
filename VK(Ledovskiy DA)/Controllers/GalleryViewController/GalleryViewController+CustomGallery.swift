//
//  GalleryViewController+CustomGallery.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 07.11.2021.
//

import UIKit

extension GalleryViewController {

    func showZoomView (image: UIImage) {

        if backgroundView == nil {
            backgroundView = UIView(frame: self.view.safeAreaLayoutGuide.layoutFrame)
        }

        backgroundView!.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        self.view.addSubview(backgroundView!)

        zoomImage = UIImageView(image: image)
        backgroundView?.addSubview(zoomImage!)
        zoomImage!.translatesAutoresizingMaskIntoConstraints = false
        zoomImage!.centerXAnchor.constraint(equalTo: backgroundView!.centerXAnchor).isActive = true
        zoomImage!.centerYAnchor.constraint(equalTo: backgroundView!.centerYAnchor).isActive = true
        zoomImage!.widthAnchor.constraint(equalTo: backgroundView!.widthAnchor).isActive = true
        zoomImage!.heightAnchor.constraint(equalTo: backgroundView!.widthAnchor).isActive = true
        zoomImage!.contentMode = .scaleAspectFit

        let closeButton = UIButton(frame: CGRect(x: backgroundView!.bounds.width - 40, y: 0,
                                                 width: 40, height: 40))
        
        closeButton.addAction(UIAction(handler: { [weak self] _ in
            self?.zoomImage!.isHidden = true
            self?.backgroundView!.removeFromSuperview()
        }), for: .touchUpInside)
        closeButton.setImage(UIImage(named: "close"), for: .normal)

        backgroundView?.addSubview(closeButton)


     // Эксперимент с анимацией

//        secondaryImageView.backgroundColor = UIColor.systemGreen
//        secondaryImageView.frame = self.view.bounds
//        secondaryImageView.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
//        backgroundView?.addSubview(secondaryImageView)
//
//        customPageView.backgroundColor = UIColor.clear
//        customPageView.frame = CGRect(x: 1, y: 1, width: 150, height: 50)
//        customPageView.layer.zPosition = 100
//        customPageView.numberOfPages = 1
//        customPageView.currentPage = 0
//        backgroundView?.addSubview(customPageView)
//        customPageView.translatesAutoresizingMaskIntoConstraints = false
//        customPageView.centerXAnchor.constraint(equalTo: backgroundView!.centerXAnchor).isActive = true
//        customPageView.bottomAnchor.constraint(equalTo: backgroundView!.bottomAnchor, constant: -backgroundView!.bounds.height / 15).isActive = true
//    }
//
//    @objc func onPan(_ recognizer: UIPanGestureRecognizer) {
//        if let animator = interactiveAnimator,
//           animator.isRunning {
//            return
//        }
    }

}
