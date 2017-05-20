//
//  Person.swift
//  Demo #2
//
//  Created by Alexander Zimin on 17/05/2017.
//  Copyright © 2017 Alexander Zimin. All rights reserved.
//

import Foundation

struct Person {
  var name: String
  var surname: String
  var age: Int

  static var testDataSet: [Person] {
    var result = [Person]()

    result.append(Person(name: "Bob", surname: "Marian", age: 24))
    result.append(Person(name: "Max", surname: "Taller", age: 30))
    result.append(Person(name: "Ted", surname: "Swartix", age: 20))

    return result
  }
}
