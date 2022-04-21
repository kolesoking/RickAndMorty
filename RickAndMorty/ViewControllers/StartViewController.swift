//
//  StartViewController.swift
//  RickAndMorty
//
//  Created by катя on 21.04.2022.
//

import UIKit

class StartViewController: UIViewController {

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let mainVC = segue.destination as? MainViewController else { return }
        mainVC.fetchCharecters()
    }


}
