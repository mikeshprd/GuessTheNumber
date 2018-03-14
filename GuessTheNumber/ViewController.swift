//
//  ViewController.swift
//  GuessTheNumber
//
//  Created by Michael Shepherd on 3/13/18.
//  Copyright © 2018 Michael Shepherd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let lowerBound = 1
    let upperBound = 100
    var numberToGuess: Int!
    var numberOfGuesses = 0
    
    
    @IBOutlet weak var NumGuess: UILabel!
    @IBOutlet weak var guessName: UILabel!
    @IBOutlet weak var guessLabel: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomNumber()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func generateRandomNumber() {
        numberToGuess=Int(arc4random_uniform(100))+1
    }
    func validateGuess(guess: Int){
        if guess < lowerBound || guess > upperBound {
            showBoundsAlert()
        }else if guess < numberToGuess{
            guessName.text = "   Higher!  "
        }else if guess > numberToGuess {
           guessName.text = "   Lower! "
        }else{
            showWinAlert()
            guessName.text = "Guess The Number"
            numberOfGuesses = 0
            generateRandomNumber()
        }
    }
    func showBoundsAlert() {
        let alert = UIAlertController(title: "Hey!", message: "Your guess should be between 1 and 100!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Got it", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    func showWinAlert() {
        let alert = UIAlertController(title: "Congrats! ", message: "You won with a total of \(numberOfGuesses) guesses", preferredStyle: .alert)
        let action = UIAlertAction(title: "Play again", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func submitButtonPressed(_ sender: Any) {
        if let guess = guessLabel.text{
            if let guessInt = Int(guess) {
                numberOfGuesses = numberOfGuesses+1
                validateGuess(guess: guessInt)
            }
        }
        NumGuess.text = "Guess # \(numberOfGuesses)"
    }


}

