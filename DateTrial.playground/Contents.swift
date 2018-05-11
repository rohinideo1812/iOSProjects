//: Playground - noun: a place where people can play

import UIKit

let date = Date()
let formatter = DateFormatter()
formatter.dateFormat = "HH:mm"
formatter.timeStyle = .short
let result = formatter.string(from: date)
 print(result)
