//
//  InfoViewController.swift
//  RickAndMorty
//
//  Created by катя on 21.04.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var firtsScene: UILabel!
    @IBOutlet weak var statusColor: UIView!
    
    var result: Result!


    override func viewDidLoad() {
        super.viewDidLoad()
        getValue()

    }
    
    private func getValue() {
        
        name.text = result.name
        status.text = "\(result.species ?? "") - \(result.status ?? "")"
        location.text = result.location?.name
        firtsScene.text = result.origin?.name
        DispatchQueue.global().async {
            guard let url = URL(string: self.result.image ?? "") else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.mainImage.image = UIImage(data: imageData)
            }
        }
        setColorStatus()
    }
    
    private func setColorStatus() {
        
        if result.status == "Alive" {
            statusColor.backgroundColor = .green
        } else if result.status == "Dead" {
            statusColor.backgroundColor = .red
        } else {
            statusColor.backgroundColor = .gray
        }
        
    }
}
