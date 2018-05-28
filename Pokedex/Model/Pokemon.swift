//
//  Pokemon.swift
//  Pokedex
//
//  Created by Georgi Teoharov on 28.05.18.
//  Copyright © 2018 Georgi Teoharov. All rights reserved.
//

import Foundation

class Pokemon {
    
    private var _name: String!
    private var _pokerdexId: Int!
    
    var name: String {
        if _name == nil {
            _name = ""
        }
        return _name
    }
    
    var pokerdexId: Int {
        return _pokerdexId
    }
    
    init(name: String, pokerdexId: Int) {
        self._name = name
        self._pokerdexId = pokerdexId
    }
}
