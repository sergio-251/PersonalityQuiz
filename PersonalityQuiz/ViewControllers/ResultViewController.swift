//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    // 1. Передать сюда массив с ответами - DONE
    // 2. Определить наиболее часто встречающийся тип животного - DONE
    // 3. Отобразить результат в соответствии с этим животным - DONE
    // 4. Избавиться от кнопки возврата на предыдущий экран - DONE
    
    
    @IBOutlet var chosenAnimalLabel: UILabel!
    @IBOutlet var descriptionAnimalLabel: UILabel!
    
    
    var answersChosen: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        let chosenAnimal = getAnswerAnimal()
        chosenAnimalLabel.text = "Вы - \(chosenAnimal.rawValue)!"
        descriptionAnimalLabel.text = chosenAnimal.definition
    }
}

//MARK: - Private Methods
extension ResultViewController {
    private func getAnswerAnimal() -> Animal {
        var max = -1
        var chosenAnimal = Animal.dog
        var animalsCount = [
            Animal.cat: 0,
            Animal.dog: 0,
            Animal.rabbit: 0,
            Animal.turtle: 0
        ]
        for answer in answersChosen {
            if let currentCount = animalsCount[answer.animal] {
                animalsCount[answer.animal] = currentCount + 1
                if currentCount > max {
                    max = currentCount
                    chosenAnimal = answer.animal
                }
            }
        }
        return chosenAnimal
    }
}
