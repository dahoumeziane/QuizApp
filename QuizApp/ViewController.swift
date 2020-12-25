//
//  ViewController.swift
//  QuizApp
//
//  Created by Dahou Meziane on 12/23/20.
//  Copyright © 2020 Meziane Dahou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    var nbQstTotal = 0
    var score = 0
    var  progressPercentage = Float(0)

    let questions = [     Question(q: "A slug's blood is green.", a: "True"),
          Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
          Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
          Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
          Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
          Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
          Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
          Question(q: "Google was originally called 'Backrub'.", a: "True"),
          Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
          Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
          Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
          Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")]
    var questionNb = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nbQstTotal = questions.capacity
        
        updateUi()
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle
        let actualAnswer = questions[questionNb].answer
        
        if userAnswer == actualAnswer {
            sender.backgroundColor = UIColor.green
            score += 1
            print("Right")
        }else {
            sender.backgroundColor = UIColor.red
            print("Wrong")
        }
        
        
        if (questionNb < questions.count-1){
            questionNb += 1
            
        }else {
            questionNb = 0
           
            print( "Your score is " + String(score) + "/" + String(nbQstTotal) )
            
            
        }
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUi), userInfo: nil, repeats: false)
        
        
    }
    
    @objc func updateUi(){
        
        questionText.text = questions[questionNb].text
        trueBtn.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressPercentage = Float(questionNb + 1) / Float(nbQstTotal)
        progressBar.progress = progressPercentage
        
    }
}

