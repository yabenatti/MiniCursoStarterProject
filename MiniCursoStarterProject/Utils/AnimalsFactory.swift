//
//  AnimalsFactory.swift
//  MiniCursoParte1
//
//  Created by Yasmin Benatti on 2017-10-11.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

import Foundation

let animalsAndImages = ["bear" : "bear",
                        "bird" : "bird",
                        "cat" : "cat",
                        "cow" : "cow",
                        "crocodile" : "crocodile",
                        "dog" : "dog",
                        "elephant" : "elephant",
                        "giraffe" : "giraffe",
                        "gorilla" : "gorilla",
                        "lion" : "lion",
                        "panda" : "panda",
                        "pig" : "pig",
                        "rabbit" : "rabbit",
                        "rat" : "rat",
                        "rhinoceros" : "rhinoceros",
                        "sheep" : "sheep",
                        "tiger" : "tiger"
                        ]

class AnimalsFactory {
    
    class func createAnimals() -> [Animal] {
        var animalsArray: [Animal] = []
        
        for (name, image) in animalsAndImages {
            let animal = Animal(name: name, image: image)
            animalsArray.append(animal)
        }
        
        return animalsArray
    }
}
