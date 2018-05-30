//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Georgi Teoharov on 30.05.18.
//  Copyright © 2018 Georgi Teoharov. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var pokemonLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonLbl.text = pokemon.name
    }
}
