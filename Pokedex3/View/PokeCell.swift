//
//  PokeCell.swift
//  Pokedex3
//
//  Created by Mirel Spahić on 12/6/17.
//  Copyright © 2017 Mirel Spahić. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    @IBOutlet weak var pokeTitle: UILabel!
    @IBOutlet weak var pokeImg: UIImageView!
    
    var pokemon: Pokemon!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    
    
    func configureCell(pokemon: Pokemon) {
        pokeTitle.text = pokemon.name.capitalized
        pokeImg.image = UIImage(named: "\(pokemon.pokedexId)")
    }
    
}
