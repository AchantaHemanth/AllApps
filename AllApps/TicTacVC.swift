//
//  ViewController.swift
//  TicTacApp
//
//  Created by Hemanth on 28/12/18.
//  Copyright © 2018 Hemanth. All rights reserved.
//

import UIKit

class TicTacVC: UIViewController {
    var activePlayer = 1 //Cross
    var gameState = [ 0, 0, 0, 0, 0, 0, 0, 0, 0]
    var winningCombination = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[2,4,6],[0,4,8]]
    var gameActive : Bool = true
    
    @IBOutlet var playerWonLbl: UILabel!
    
    @IBOutlet var playAgain: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func btnAction(_ sender: UIButton)
    {
        //print(sender.tag)
        if gameState[sender.tag - 1] == 0
        {
            gameState[sender.tag - 1] = activePlayer
            if activePlayer == 1
            {
                sender.setImage(UIImage.init(named:"cross.png"), for: .normal)
                activePlayer = 2
            }
            else
            {
                sender.setImage(UIImage.init(named:"nought.png"), for: .normal)
                activePlayer = 1
            }
        }
        
        for combination in winningCombination
        {
            //print("Game State:\(gameState)")
            //print("Winning:\(winningCombination)")
            //print(combination)
            //print(gameState[combination[2]])
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            {
                gameActive = false
                if gameState[combination[0]] == 1
                {
                    playerWonLbl.text = "Cross Has Won"
                }
                else
                {
                    playerWonLbl.text = "Nought Has Won"
                }
                playAgain.isHidden = false
                playerWonLbl.isHidden = false
            }
        }
        gameActive = false
        for i in gameState
        {
            if i == 0
            {
                gameActive = true
                break
            }
        }
        if gameActive == false
        {
            playerWonLbl.text = "It Was Draw"
            playerWonLbl.isHidden = false
            playAgain.isHidden = false
        }
    }
    
    @IBAction func palyAgainAction(_ sender: Any)
    {
        gameState = [ 0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameActive = true
        activePlayer = 1
        playAgain.isHidden = true
        playerWonLbl.isHidden = true
        for  i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: .normal)
        }
    }
}

