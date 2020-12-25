//
//  Questions.swift
//  QuizApp
//
//  Created by Dahou Meziane on 12/23/20.
//  Copyright © 2020 Meziane Dahou. All rights reserved.
//

import Foundation

struct Question {
    let text : String
    let answer : String
    init(q : String , a : String) {
        self.text = q
        self.answer = a
    }
}
