//
//  CharacterSelectionController.swift
//  RPJay - character manager
//
//  Created by Rafael Tomaz Prado on 03/04/17.
//  Copyright © 2017 Juliane Vianna. All rights reserved.
//

import UIKit

class CharacterSelectionController: UIViewController, UITableViewDataSource, UITableViewDelegate, CharacterProtocol {

    @IBOutlet weak var tableView: UITableView!
    public static var characterMemory:[Character]? = [Character]()
    var newCharacter: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return CharacterSelectionController.characterMemory!.count
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToCharacterInfoSegue" , sender: CharacterSelectionController.characterMemory?[indexPath.row])
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CellController
        cell.icon.image = CharacterSelectionController.characterMemory?[indexPath.row].characterIcon
        cell.name.text = CharacterSelectionController.characterMemory?[indexPath.row].characterName
        cell.raceAndClass.text = (CharacterSelectionController.characterMemory?[indexPath.row].characterRace)!+" "+(CharacterSelectionController.characterMemory?[indexPath.row].characterClass)!
        cell.hpLabel.text = "HP:"
        cell.mpLabel.text = "MP:"
        cell.healthBar.progress = 1.0
        cell.manaBar.progress = 1.0
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToCharacterInfoSegue"){
            var destinationViewController = segue.destination as! CharacterProtocol
            self.newCharacter = sender as! Character?
            destinationViewController.newCharacter = self.newCharacter
        }
    }
    
}
