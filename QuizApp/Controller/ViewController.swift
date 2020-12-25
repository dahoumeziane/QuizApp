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

    var quizBrain = QuizBrain()

  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUi()
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let answerRight = quizBrain.checkAnswer(userAnswer)
        
        if answerRight {
            sender.backgroundColor = UIColor.green
            // Increment score
            print("Right")
        }else {
            sender.backgroundColor = UIColor.red
            print("Wrong")
        }
        
        
        if (quizBrain.questionNb < quizBrain.questions.count-1){
            quizBrain.nextQuestion()
            
        }else {
            quizBrain.score()
            
        }
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUi), userInfo: nil, repeats: false)
        
        
    }
    
    @objc func updateUi(){
        
        questionText.text = quizBrain.currentQuestion()
        trueBtn.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.progress()
        
    }
}

