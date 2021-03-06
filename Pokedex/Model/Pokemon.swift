//
//  Pokemon.swift
//  Pokedex
//
//  Created by Georgi Teoharov on 28.05.18.
//  Copyright © 2018 Georgi Teoharov. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _defense: String!
    private var _nextEvolutionText: String!
    private var _pokemonURL: String!
    private var _descriptionURL: String!
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var type: String {
        if _type == nil {
            _type = ""
        }
        return _type
    }
    
    var height: String {
        if _height == nil {
            _height = ""
        }
        return _height
    }
    
    var weight: String {
        if _weight == nil {
            _weight = ""
        }
        return _weight
    }
    
    var attack: String {
        if _attack == nil {
            _attack = ""
        }
        return _attack
    }
    
    var defense: String {
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }
    
    var nextEvolutionText: String {
        if _nextEvolutionText == nil {
            _nextEvolutionText = ""
        }
        return _nextEvolutionText
    }
    
    
    var name: String {
        if _name == nil {
            _name = ""
        }
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
        self._descriptionURL = "\(URL_DESCRIPTION)\(self.pokedexId)/"
    }
    
    func downloadPokemonDetail(completed: @escaping DownloadComplete) {
        Alamofire.request(_pokemonURL).responseJSON { (responce) in
            
            if let dict = responce.result.value as? Dictionary<String, AnyObject> {
                
                if let name = dict["name"] as? String {
                    self._name = name
                }
                
                if let pokedexId = dict["id"] as? Int {
                    self._pokedexId = pokedexId
                }
                
                if let weight = dict["weight"] as? Int {
                    self._weight = "\(weight)"
                }
                
                if let height = dict["height"] as? Int {
                    self._height = "\(height)"
                }
                
                if let types = dict["types"] as? [Dictionary<String, AnyObject>], types.count > 0 {
                    
                    if let type = types[0]["type"] as? Dictionary<String, AnyObject> {
                        if let name = type["name"] as? String {
                            self._type = name.capitalized
                        }
                    }
                    
                    if types.count > 1 {
                        for x in 1..<types.count {
                            if let type = types[x]["type"] as? Dictionary<String, AnyObject> {
                                if let name = type["name"] as? String {
                                    self._type! += "/\(name.capitalized)"
                                }
                            }
                        }
                    }
                } else {
                    self._type = ""
                }
                
                if let stats = dict["stats"] as? [Dictionary<String, AnyObject>], stats.count > 0 {
                    
                    if let defense = stats[3]["base_stat"] as? Int {
                        self._defense = "\(defense)"
                    }
                    
                    if let attack = stats[4]["base_stat"] as? Int {
                        self._attack = "\(attack)"
                    }
                } else {
                    self._defense = ""
                }
                
                
 
            }

          completed()
        }
        Alamofire.request(_descriptionURL).responseJSON { (responce) in
            
            if let dict = responce.result.value as? Dictionary<String, AnyObject> {
                
                if let description = dict["description"] as? String {
                    
                    let newDescritpion = description.replacingOccurrences(of: "POKMON", with: "Pokemon")
                    self._description = newDescritpion
                }
            }
            completed()
        }
    }
}
