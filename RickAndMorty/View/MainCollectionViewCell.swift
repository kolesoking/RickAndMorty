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
    
    func configur(with result: Resultat) {
        fullName.text = result.name
        DispatchQueue.global().async {
            guard let url = URL(string: result.image ?? "") else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.image.image = UIImage(data: imageData)
            }
        }
    }
}

