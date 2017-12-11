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
    private var _pokedexId: Int64!
    private var _description: String!
    private var _defense: Int64!
    private var _type: String!
    private var _height: Int64!
    private var _weight: Int64!
    private var _attack: Int64!
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
    
    var defense: Int64! {
       
        
        return _defense
    }
    
    var type: String {
        if _type == nil{
            return ""
        }
        
        return _type
    }
  
    var height: Int64? {
        
        return _height
    }
    
    var weight: Int64? {
       
        return _weight
    }
    
    var attack: Int64 {
      
        return _attack
    }
    
    var nextEvolutionText: String {
        if _nextEvelutionText == nil{
            return ""
        }
        
        return _nextEvelutionText
    }
    var pokedexId: Int64 {
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int64){
        _name = name
        _pokedexId = pokedexId
        _pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(_pokedexId!)/"
    }
    
    private func getStat(stats: AnyObject,statname name: String!) -> Int64? {
        
        if let stats = stats["stats"] as? [Dictionary<String, AnyObject>] {
            for stat in stats {
                if let statObj = stat["stat"] as? Dictionary<String, AnyObject>{
                    if let statName = statObj["name"] as? String{
                        if statName == name {
                            if let baseStat = stat["base_stat"] as? Int64{
                                return baseStat
                            }
                            
                        }
                        
                    }
                }
            }
        }
        
        return nil
    }
    
    func downloadDetails(completed: @escaping DownloadComplete){
        print(_pokemonUrl)
        Alamofire.request(_pokemonUrl).responseJSON { response in
            //print(response.result.value)
            
            if let dic = response.result.value as? Dictionary<String, AnyObject> {
                if let weight = dic["weight"] as? Int64 {
                    self._weight = weight
                }
                
                if let height = dic["height"] as? Int64 {
                    self._height = height
                }
                
                if let name = dic["name"] as? String {
                    self._name = name
                }
                
                if let id = dic["id"] as? Int64 {
                    self._pokedexId = id
                }
                
                var typeList = ""
                if let types = dic["types"] as? [Dictionary<String, AnyObject>] {
                    var a = 1
                    for type in types {
                        a = a + 1
                        if let typeObj = type["type"] as? Dictionary<String, AnyObject>{
                            if let typeName = typeObj["name"] as? String{
                                typeList.append(typeName)
                                if (a < types.count ) {
                                    typeList.append("/")
                                }
                                
                            }
                        }
                    }
                }
                
                let def = self.getStat(stats: dic as AnyObject, statname: "defense")
                self._defense = def
                
                let att = self.getStat(stats: dic as AnyObject, statname: "attack")
                self._attack = att
                
                
                completed()
                
            }
            
            
            }
        
        
    }

}
