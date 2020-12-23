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
    
    let questions = [   Questions(text: "Five plus six equals to eleven", answer: "True"),
                        Questions(text: "Five is greater than six ", answer: "False"),
                        Questions(text: "Ten multiply six is equals to sixty", answer: "True")]
    var questionNb = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUi()
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let actualAnswer = questions[questionNb].answer
        
        if userAnswer == actualAnswer {
            print("Right")
        }else {
            print("Wrong")
        }
        updateUi()
        if (questionNb < questions.count-1){
            questionNb += 1
        }else {
            questionNb = 0
        }
        
        
    }
    
    func updateUi(){
        
        questionText.text = questions[questionNb].text
        
    }
}

