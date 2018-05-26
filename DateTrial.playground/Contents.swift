//: Playground - noun: a place where people can play

import UIKit

let date = Date()
let formatter = DateFormatter()
formatter.dateFormat = "hh:mm"
formatter.timeStyle = .short
let todaysDate = formatter.string(from: date)
print(todaysDate)
let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: date)
print(tomorrow)
formatter.dateFormat = "yyyy-MM-dd"
let time = formatter.string(from: date)
print(time)
formatter.dateFormat = "yyyy-MM-dd"
let dateObj = formatter.string(from : tomorrow!)
print(dateObj)
