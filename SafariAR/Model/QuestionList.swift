//
//  QuestionList.swift
//  SafariAR
//
//  Created by Thor Remiendo on 06/09/2019.
//  Copyright © 2019 ZET. All rights reserved.
//

import Foundation

class QuestionList {
    var list = [Question]()
    
    init(){
        //questions
        list.append(Question(text: "African Elephant is the largest land animal.", correctAnswer: true))
        list.append(Question(text: "Both male and female elephants possess tusks.", correctAnswer: true))
        list.append(Question(text: "Elephants can give birth every year.", correctAnswer: false))
        list.append(Question(text: "African Elephant is classified as a vulnerable species.", correctAnswer: true))
        list.append(Question(text: "Elephants can swim.", correctAnswer: true))
        list.append(Question(text: "Elephants can jump.", correctAnswer: false))
        list.append(Question(text: "Elephants have superb memory.", correctAnswer: true))
        list.append(Question(text: "Elephants can remember locations of water sources.", correctAnswer: true))
        list.append(Question(text: "Elephant tusks are giant teeth.", correctAnswer: true))
        list.append(Question(text: "Elephants are legally hunted for their tusks.", correctAnswer: false))
        list.append(Question(text: "All species of Rhinos have either one or two horns on their nose.", correctAnswer: true))
        list.append(Question(text: "African Rhinoceros are one of the heaviest land animal on Earth.", correctAnswer: true))
        list.append(Question(text: "Rhinos are carnivores.", correctAnswer: false))
        list.append(Question(text: "Rhinos have poor eyesight.", correctAnswer: true))
        list.append(Question(text: "A group of Rhinos is called a Crash.", correctAnswer: true))
        list.append(Question(text: "Rhinoceors are some of the endangered species on Earth.", correctAnswer: true))
        list.append(Question(text: "Rhinoceros are killed by humans for their horns.", correctAnswer: true))
        list.append(Question(text: "Rhinoceros horns are hunted to be used for medicine.", correctAnswer: true))
        list.append(Question(text: "African Elephant is the largest land animal.", correctAnswer: true))
        list.append(Question(text: "African Elephant is the largest land animal.", correctAnswer: true))
        
        
    }
}
