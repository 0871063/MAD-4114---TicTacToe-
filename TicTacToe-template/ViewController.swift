//
//  ViewController.swift
//  TicTacToe-template
//
//  Created by Mohammad Kiani on 2020-06-08.
//  Copyright © 2020 mohammadkiani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var playAgainBtn: UIButton!
   
    @IBOutlet weak var position1Btn: UIButton!
    @IBOutlet weak var position9Btn: UIButton!
    @IBOutlet weak var position8Btn: UIButton!
    @IBOutlet weak var position7Btn: UIButton!
    @IBOutlet weak var position6Btn: UIButton!
    @IBOutlet weak var position5Btn: UIButton!
    @IBOutlet weak var position4Btn: UIButton!
    @IBOutlet weak var position3Btn: UIButton!
    @IBOutlet weak var position2Btn: UIButton!
    
    var CurrentPlayer = 0 ;
    var stopTheGame = false
    
    var gameStates = [2,2,2,2,2,2,2,2,2]
    let winPositions = [[0,1,2], [3,4,5], [6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8], [2,4,6]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playAgainBtn.isHidden = true
        resultLbl.text = "Player One Turn"
        playAgainBtn.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    @IBAction func PlayAgain() {
        position1Btn.setImage(nil, for: .normal)
        position2Btn.setImage(nil, for: .normal)
        position3Btn.setImage(nil, for: .normal)
        position4Btn.setImage(nil, for: .normal)
        position5Btn.setImage(nil, for: .normal)
        position6Btn.setImage(nil, for: .normal)
        position7Btn.setImage(nil, for: .normal)
        position8Btn.setImage(nil, for: .normal)
        position9Btn.setImage(nil, for: .normal)
        
        playAgainBtn.isHidden = true
        gameStates = [2,2,2,2,2,2,2,2,2]
        stopTheGame = false
        resultLbl.text = "Player One Turn"
        CurrentPlayer = 0
        
    }
    
    @IBAction func btnPressed(_ sender: UIButton) {
        
        if (gameStates[sender.tag]==2 && stopTheGame == false ){
            gameStates[sender.tag] = CurrentPlayer
            UIView.transition(with: sender, duration: 1.5, options: .transitionCurlDown, animations: {
                sender.setImage(self.setButtonImage(), for: .normal)
            }, completion: nil)
         
            setPlayerTurn()
                    
            for line in winPositions{
                
                if (gameStates[line[0]] == gameStates[line[1]] && gameStates[line[1]] == gameStates[line[2]]
                        && gameStates[line[0]] != 2)
                {
                    stopTheGame = true
  
                    if (gameStates[line[0]] == 0) {
                        resultLbl.text = "Player One is Won!!!"
                    }else  if gameStates[line[0]] == 1 {
                         resultLbl.text = "Player Two is Won!!! "
                    }
                    playAgainBtn.isHidden = false

                }
                else{
                    var gameIsOver = true
                    for counterState in gameStates
                    {
                        if(counterState==2){
                            gameIsOver=false;
                        }
                    }
                    if(gameIsOver)
                    {
                        resultLbl.text = "Match Draw!!!"
                        playAgainBtn.isHidden = false
                    }
                }
                
            }
        }
    }
    
    func setButtonImage() -> UIImage{
        if CurrentPlayer == 0 {
            return UIImage(named: "cross")!
        }else{
            return UIImage(named: "nought")!
        }
    }
    
    func setPlayerTurn() {
        if CurrentPlayer == 0 {
            resultLbl.text = "Player Two Turn"
            CurrentPlayer = 1
        }else{
            resultLbl.text = "Player One Turn"
            CurrentPlayer = 0
        }
    }
    
}

