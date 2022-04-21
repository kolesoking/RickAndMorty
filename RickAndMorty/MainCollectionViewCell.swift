//
//  MainCollectionViewCell.swift
//  RickAndMorty
//
//  Created by катя on 21.04.2022.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    
    func configur(with character: Result?) {
        fullName.text = character?.name
        DispatchQueue.global().async {
            guard let url = URL(string: character?.image ?? "") else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.image.image = UIImage(data: imageData)
            }
        }
    }
}

