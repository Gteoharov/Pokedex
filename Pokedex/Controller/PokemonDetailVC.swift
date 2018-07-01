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
        
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        pokedexIdLbl.text = "\(pokemon.pokedexId)"
        currentEvoImg.image = img
        nextEvoImg.image = UIImage(named: "\(pokemon.pokedexId + 1)")
        
        
        pokemon.downloadPokemonDetail {
            
            // Whatever we write here will only be called after the network call is complete!
            self.updateUI()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            self.mainImg.layer.cornerRadius = self.mainImg.frame.width / 2
            self.mainImg.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)  
    }
    
    func updateUI() {
        pokemonLbl.text = pokemon.name.capitalized
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        typeLbl.text = pokemon.type
        defenseLbl.text = pokemon.defense
        basicAttackLbl.text = pokemon.attack
        descriptionLbl.text = pokemon.description
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
