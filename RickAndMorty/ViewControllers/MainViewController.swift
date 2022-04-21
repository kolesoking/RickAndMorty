//
//  MainViewController.swift
//  RickAndMorty
//
//  Created by катя on 21.04.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class MainViewController: UICollectionViewController {
    
    private var charecters: [Character] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.charecters)
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        charecters.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainCollectionViewCell
        let character = charecters[indexPath.item]
        guard let results = character.results else { return }
        let result = results[indexPath.item]

        cell.configur(with: result)
    
        return cell
    }
    
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 24, height: 125)
    }
    
}

// MARK: - Networking

extension MainViewController {
    func fetchCharecters() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error discription")
                return
            }
            
            do {
                self.charecters = try JSONDecoder().decode([Character].self, from: data)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }

}

