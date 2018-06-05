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
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var pokedexIdLbl: UILabel!
    @IBOutlet weak var basicAttackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonLbl.text = pokemon.name
        
        pokemon.downloadPokemonDetail {
            
            // Whatever we write here will only be called after the network call is complete!
            self.updateUI()
        }
    }
    
    func updateUI() {
        pokemonLbl.text = pokemon.name
        pokedexIdLbl.text = "\(pokemon.pokedexId)"
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        mainImg.image = UIImage(named: "\(pokemon.pokedexId)")
        currentEvoImg.image = UIImage(named: "\(pokemon.pokedexId)")
        nextEvoImg.image = UIImage(named: "\(pokemon.pokedexId + 1)")
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
