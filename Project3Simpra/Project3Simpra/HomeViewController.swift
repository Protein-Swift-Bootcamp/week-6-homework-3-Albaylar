//
//  ViewController.swift
//  Project3Simpra
//
//  Created by Furkan Deniz Albaylar on 15.01.2023.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func buttonTapped(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "CollectionViewController") as? CollectionViewController {
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
            
        }
    }
}

