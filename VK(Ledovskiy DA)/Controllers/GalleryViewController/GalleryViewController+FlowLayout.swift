//
//  GalleryViewController+FlowLayout.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 22.10.2021.
//

import UIKit

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidht = collectionView.bounds.width
        let whiteSpace = CGFloat(2)
        let lineCountCell = CGFloat(2)
        let cellWidth = collectionViewWidht / lineCountCell - whiteSpace

        return CGSize(width: cellWidth, height: cellWidth)
    }
}
