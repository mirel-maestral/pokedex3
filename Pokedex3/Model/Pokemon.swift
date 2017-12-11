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
    private var _weight: String!
    private var _attack: String!
    private var _nextEvelutionText: String!
    private var _pokemonUrl: String!
    
    var name: String {
        if _name == nil{
            return ""
        }
        
        return _name
    }
   
    var description: String {
        if _description == nil {
            return ""
        }
        
        return _description
    }
    
    var defense: String {
        if _defense == nil {
            return ""
        }
        
        return _defense
    }
    
    var type: String {
        if _type == nil{
            return ""
        }
        
        return _type
    }
  
    var height: String {
        if _height == nil
        {
            return ""
        }
        
        return _height
    }
    
    var weight: String {
        if _weight == nil{
            return ""
        }
        return _weight
    }
    
    var attack: String {
        if _attack == nil{
            return ""
        }
        return _attack
    }
    
    var nextEvolutionText: String {
        if _nextEvelutionText == nil{
            return ""
        }
        
        return _nextEvelutionText
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
            //print(response.result.value)
            
            if let dic = response.result.value as? Dictionary<String, AnyObject> {
                if let weight = dic["weight"] as? String {
                    self._weight = weight
                }
                
                if let height = dic["height"] as? String {
                    self._height = height
                }
                
                if let attack = dic["attack"] as? String {
                    self._attack = attack
                }
                
                if let defense = dic["defense"] as? String {
                    self._defense = defense
                }
                
                print(self._weight)
                print(self.height)
                print(self._attack)
                print(self._defense)
            }
            
            
            }
        
        completed()
    }

}
