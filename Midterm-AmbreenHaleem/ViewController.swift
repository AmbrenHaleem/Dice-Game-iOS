//
//  ViewController.swift
//  Midterm-AmbreenHaleem
//
//  Created by Ambreen Haleem on 2023-02-14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Player2ScoreLabel: UILabel!
    @IBOutlet weak var player1ScoreLabel: UILabel!
    
    @IBOutlet weak var player1DiceImageView: UIImageView!
    @IBOutlet weak var player2DiceImageView: UIImageView!
    
    @IBOutlet weak var RollButton: UIButton!
    
    private var player1Dice = 1
    private var player2Dice = 1
    private var player1Score = 0
    private var player2Score = 0
    private var rollCount = 0
    private var winner = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        player1Dice = Int.random(in: 1...6)
        print(player1Dice)
        
        player2Dice = Int.random(in: 1...6)
        print(player2Dice)
        setImagePlayer1()
        setImagePlayer2()
        setScore()
        rollCount += 1
        
        showAlert()
       
    }
    
    private func setImagePlayer1(){
        let newImg: UIImage? = UIImage(named: "dice\(player1Dice)")
                self.player1DiceImageView.image = newImg
        
    }
    
    private func setImagePlayer2(){
        let newImg: UIImage? = UIImage(named: "dice\(player2Dice)")
                self.player2DiceImageView.image = newImg
    }
    
    private func setScore(){
        if player1Dice > player2Dice{
            player1Score += 1
            player1ScoreLabel.text = String(player1Score)
        }
        else if player2Dice > player1Dice{
            player2Score += 1
            Player2ScoreLabel.text = String(player2Score)
        }
    }
    
    private func showAlert(){
        
        RollButton.setTitle("Show Score", for: .normal)
        winner = player1Score > player2Score ? "P1" : "P2"
       
        if rollCount >= 10 {
            let gameResetAlert = UIAlertController(title: "Winner", message: "Player \(winner) won!", preferredStyle: UIAlertController.Style.alert)
           
            gameResetAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                self.player1Dice = 1
                self.player2Dice = 1
                self.setImagePlayer1()
                self.setImagePlayer2()
                self.player1Score = 0
                self.player2Score = 0
                self.player1ScoreLabel.text = String(self.player1Score)
                self.Player2ScoreLabel.text = String(self.player2Score)
                self.rollCount = 0
                self.winner = ""
                self.RollButton.setTitle("Roll", for: .normal)
                }))
            self.present(gameResetAlert, animated: true, completion: nil)
        }
        
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        player1Dice = Int.random(in: 1...6)
        print(player1Dice)
        
        player2Dice = Int.random(in: 1...6)
        print(player2Dice)
        setImagePlayer1()
        setImagePlayer2()
        setScore()
        rollCount += 1
        
        showAlert()
    }

}

