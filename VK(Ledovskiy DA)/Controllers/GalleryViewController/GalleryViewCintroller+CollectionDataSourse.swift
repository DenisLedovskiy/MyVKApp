//
//  GalleryViewCintroller+CollectionDataSourse.swift
//  VK(Ledovskiy DA)
//
//  Created by Денис Ледовский on 22.10.2021.
//

import UIKit

extension GalleryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    { guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierGalleryCell,
      for: indexPath) as? GalleryCollectionCell else {return UICollectionViewCell()}

//        cell.configure(image: self.photos[indexPath.item])
        cell.configure(image: photoService.photoPut(atIndexpath:indexPath, byUrl: urlPhoto))

        return cell
    }
}
