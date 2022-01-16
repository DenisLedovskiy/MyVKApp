//
//  GalleryViewController+CollectionDelegate.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 22.10.2021.
//

import UIKit

extension GalleryViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

//        let image = [UIImage(named: "diana1")!, UIImage(named: "diana2")!, UIImage(named: "diana3")!,
//                     UIImage(named: "diana4")!, UIImage(named: "diana5")!, UIImage(named: "diana6")!]
//        galleryView.setImages(images: image)

        showZoomView(image: self.photos[indexPath.item])

        // Эскперимент с анимацией

//        currentIndex = indexPath.item
//
//        func onChange(isLeft: Bool) {
//            mainImageView = zoomImage!
//            self.mainImageView.transform = .identity
//            self.secondaryImageView.transform = .identity
//            self.mainImageView.image = self.photos[indexPath.item]
//
//            if isLeft {
//                self.secondaryImageView.image = self.photos[indexPath.item + 1]
//                self.secondaryImageView.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
//            }
//            else {
//                self.secondaryImageView.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
//                self.secondaryImageView.image = self.photos[indexPath.item - 1]
//            }
//        }
//
//        func onChangeCompletion(isLeft: Bool) {
//            self.mainImageView.transform = .identity
//            self.secondaryImageView.transform = .identity
//            if isLeft {
//                self.currentIndex += 1
//            }
//            else {
//                self.currentIndex -= 1
//            }
//            self.mainImageView.image = self.photos[self.currentIndex]
//            self.backgroundView!.bringSubviewToFront(self.mainImageView)
//            self.customPageView.currentPage = self.currentIndex
//        }
//
//        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
//        recognizer.cancelsTouchesInView = false
//        backgroundView!.addGestureRecognizer(recognizer)
//
//        switch recognizer.state {
//        case .began:
//            self.mainImageView.transform = .identity
//            self.mainImageView.image = self.photos[currentIndex]
//            self.secondaryImageView.transform = .identity
//            backgroundView!.bringSubviewToFront(self.mainImageView)
//
//            interactiveAnimator?.startAnimation()
//            interactiveAnimator = UIViewPropertyAnimator(duration: 0.5,
//                                                         curve: .easeInOut,
//                                                         animations: { [weak self] in
//                                                            self?.mainImageView.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
//                                                         })
//            interactiveAnimator.pauseAnimation()
//            isLeftSwipe = false
//            isRightSwipe = false
//            chooseFlag = false
//        case .changed:
//            var translation = recognizer.translation(in: self.view)
//
//            print(translation)
//
//
//            if translation.x < 0 && (!isLeftSwipe) && (!chooseFlag) {
//                if self.currentIndex == (self.photos.count - 1) {
//                    interactiveAnimator.stopAnimation(true)
//                    return
//                }
//                chooseFlag = true
//                onChange(isLeft: true)
//
//
//                interactiveAnimator.stopAnimation(true)
//                interactiveAnimator.addAnimations { [weak self] in
//                    self?.mainImageView.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
//                    self?.secondaryImageView.transform = .identity
//                }
//                interactiveAnimator.addCompletion({ [weak self] _ in
//                    onChangeCompletion(isLeft: true)
//                })
//
//                interactiveAnimator.startAnimation()
//                interactiveAnimator.pauseAnimation()
//                isLeftSwipe = true
//            }
//
//            if translation.x > 0 && (!isRightSwipe) && (!chooseFlag) {
//                if self.currentIndex == 0 {
//                    interactiveAnimator.stopAnimation(true)
//                    return
//                }
//                chooseFlag = true
//                onChange(isLeft: false)
//                interactiveAnimator.stopAnimation(true)
//                interactiveAnimator.addAnimations { [weak self] in
//                    self?.mainImageView.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
//                    self?.secondaryImageView.transform = .identity
//                }
//                interactiveAnimator.addCompletion({ [weak self] _ in
//                    onChangeCompletion(isLeft: false)
//                })
//                interactiveAnimator.startAnimation()
//                interactiveAnimator.pauseAnimation()
//                isRightSwipe = true
//            }
//
//            if isRightSwipe && (translation.x < 0) {return}
//            if isLeftSwipe && (translation.x > 0) {return}
//
//            if translation.x < 0 {
//                translation.x = -translation.x
//            }
//            interactiveAnimator.fractionComplete = translation.x / (UIScreen.main.bounds.width)
//
//        case .ended:
//            if let animator = interactiveAnimator,
//               animator.isRunning {
//                return
//            }
//            var translation = recognizer.translation(in: self.view)
//
//            if translation.x < 0 {translation.x = -translation.x}
//
//            if (translation.x / (UIScreen.main.bounds.width)) > 0.5  {
//                interactiveAnimator.startAnimation()
//            }
//            else {
//                interactiveAnimator.stopAnimation(true)
//                interactiveAnimator.finishAnimation(at: .start)
//                interactiveAnimator.addAnimations { [weak self] in
//                    self?.mainImageView.transform = .identity
//                    guard let weakSelf = self else {return}
//                    if weakSelf.isLeftSwipe {
//                        self?.secondaryImageView.transform = CGAffineTransform(translationX: UIScreen.main.bounds.width, y: 0)
//                    }
//                    if weakSelf.isRightSwipe {
//                        self?.secondaryImageView.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
//                    }
//                }
//
//                interactiveAnimator.addCompletion({ [weak self] _ in
//                    self?.mainImageView.transform = .identity
//                    self?.secondaryImageView.transform = .identity
//                })
//
//                interactiveAnimator.startAnimation()
//            }
//        default:
//            return
//        }
    }
}

