//
//  ViewController.swift
//  MVC Lab
//
//  Created by Mariel Hoepelman on 7/30/19.
//  Copyright © 2019 Mariel Hoepelman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //creates an instance of RGBgeneraror
    var rgbInstance = RGBGenerator()
    //sets current score initial value to 0
    var scoreTracker: Int = 0
    //sets high score initial value to 0
    var highScoreTracker: Int = 0
    
    @IBOutlet weak var square: UIView!
    
    @IBOutlet weak var Score: UILabel!
    
    @IBOutlet weak var WhichColorText: UILabel!
    
    @IBOutlet weak var highScore: UILabel!
    
    @IBOutlet weak var gameOver: UILabel!
    
    @IBOutlet weak var redButtonElement: UIButton!
    
    @IBOutlet weak var greenButtonElement: UIButton!
    
    @IBOutlet weak var blueButtonElement: UIButton!
    
    @IBOutlet weak var playAgain: UIButton!
  
    let Colors = ["red", "green", "blue"]
    
    @IBAction func colorButtonAction(sender: UIButton) {
        let buttonPressed = Colors[sender.tag]
        
        switch buttonPressed {
        case "red" :
            if rgbInstance.greatestValue() == rgbInstance.randRed {
                refreshColor()
                incrementsScore()
            } else {
                gameIsOver()
            }
        case "green":
            if rgbInstance.greatestValue() == rgbInstance.randGreen {
                refreshColor()
                incrementsScore()
            } else {
                gameIsOver()
            }
        case "blue":
            if rgbInstance.greatestValue() == rgbInstance.randBlue {
                refreshColor()
                incrementsScore()
            } else {
                gameIsOver()
            }
        default:
            gameIsOver()
        }

    }
    
    
    @IBAction func restartGame(_ sender: UIButton) {
        showButtons()
        playAgain.isHidden = true
        gameOver.isHidden = true
        
    }
    
    
    private func refreshColor() -> Void {
        square.backgroundColor = rgbInstance.colorGenerator()
    }
    
    private func incrementsScore() -> Void {
        scoreTracker += 1
        if scoreTracker > highScoreTracker {
            highScoreTracker = scoreTracker
        }
        
        highScore.text = "High Score: \(String(highScoreTracker))"
        
        Score.text = "Current Score: \(String(scoreTracker))"
    }
 
    private func initializeButtonTags() -> Void {
        redButtonElement.tag = 0
        greenButtonElement.tag = 1
        blueButtonElement.tag = 2
    }
    
    private func initializeLabel() -> Void {
        Score.text = "Current Score: 0"
        highScore.text = "High score: 0"
        WhichColorText.text = "Which color is the sample above close to?"
        gameOver.text = "Game Over"
        gameOver.isHidden = true
        playAgain.isHidden = true
    }
    
    
    private func hideButtons() -> Void {
        redButtonElement.isEnabled = false
        greenButtonElement.isEnabled = false
        blueButtonElement.isEnabled = false
    }
    
    private func showButtons() -> Void {
        redButtonElement.isEnabled = true
        greenButtonElement.isEnabled = true
        blueButtonElement.isEnabled = true
    }
    
    private func gameIsOver() -> Void {
        //print word game over
        gameOver.isHidden = false
        //call func to play again
        //reset current score to 0
        scoreTracker = 0
        Score.text = "Current Score: 0"
        //buttons dissapear
        hideButtons()
        restartGame()
    }
    
    private func restartGame() -> Void {
        playAgain.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.dom
        initializeButtonTags()
        initializeLabel()
        refreshColor()
    }

}

