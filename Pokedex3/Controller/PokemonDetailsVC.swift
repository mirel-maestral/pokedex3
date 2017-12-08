//
//  PokemonDetailsVC.swift
//  Pokedex3
//
//  Created by Mirel Spahić on 12/7/17.
//  Copyright © 2017 Mirel Spahić. All rights reserved.
//

import UIKit

class PokemonDetailsVC: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var selectedPokemon: Pokemon!
    
    @IBOutlet weak var pokeAttack: UILabel!
    @IBOutlet weak var pokeId: UILabel!
    @IBOutlet weak var pokeHeight: UILabel!
    @IBOutlet weak var pokeWidth: UILabel!
    @IBOutlet weak var pokeDefense: UILabel!
    @IBOutlet weak var pokeType: UILabel!
    @IBOutlet weak var pokeDesc: UILabel!
    @IBOutlet weak var pokeImage: UIImageView!
    
    @IBOutlet weak var nextEvolution: UIImageView!
    @IBOutlet weak var currentEvolution: UIImageView!
    @IBOutlet weak var pokeNextEvolution: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = selectedPokemon.name
        // Do any additional setup after loading the view.
    }

    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    

}
