//: Playground - noun: a place where people can play

import UIKit

extension String{
    func date(format:String) -> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.date(from:self)
    }
}
//let dateFormatter = DateFormatter()
//let formatStr = "yyyy-MM-dd hh:mm a"
//dateFormatter.dateFormat = formatStr
let strDate = "2018-06-14,01:00 PM"
let str = strDate.components(separatedBy: ",")
let str2 = "\(str[0]) \(str[1])"
print(str2)
let date = str2.date(format: "yyyy-MM-dd hh:mm a")
print(date)

