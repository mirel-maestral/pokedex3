//
//  Pokemon.swift
//  Pokedex3
//
//  Created by Mirel Spahić on 12/6/17.
//  Copyright © 2017 Mirel Spahić. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _defense: String!
    private var _type: String!
    private var _height: String!
    private var _width: String!
    private var _attack: String!
    private var _nextEvelutionText: String!
    private var _pokemonUrl: String!
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int){
        _name = name
        _pokedexId = pokedexId
        _pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(_pokedexId!)/"
    }
    
    func downloadDetails(completed: DownloadComplete){
        print(_pokemonUrl)
        Alamofire.request(_pokemonUrl).responseJSON { response in
            print(response.result)
            }
    }

}
