//
//  Helper.swift
//  FundooNotes
//
//  Created by BridgeLabz on 23/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import Foundation
import UIKit


class Helper{

    static var shared = Helper()
    private init(){
        
    }
    
   //Mark: Get scaled image
   func getScaledImage(image : UIImage,width : CGFloat)-> UIImage{
    
    let oldWidth = image.size.width
    let scaleFactor = width / oldWidth
    let newHeight = image.size.height * scaleFactor
    let newWidth = oldWidth * scaleFactor
    UIGraphicsBeginImageContext(CGSize(width : newWidth,height : newHeight))
    image.draw(in: CGRect(x:0, y:0, width : newWidth, height : newHeight))
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return newImage!
    
    }
    
    //Mark: Get String Height of Attributed Text
     func getAttributedStringHeight(text:NSAttributedString,width:CGFloat) -> CGFloat {
        let label = UILabel()
        label.numberOfLines = 0
        label.attributedText = text
        let newSize = label.sizeThatFits(CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
        return newSize.height
    }
    
    
    //Mark: Get String Height of Text
    func getStringHeight(text:String,width:CGFloat,font : UIFont) -> CGFloat {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = font
        label.text = text
        let newSize = label.sizeThatFits(CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
        return newSize.height
    }
    
    //Mark: Get attributed String
    func getAttributedString(mTitle:String?,mSubtitle:String?) -> NSAttributedString{
        var normalStr = NSMutableAttributedString()
        var boldStr = NSMutableAttributedString()
        if var title = mTitle {
            title.append("\n")
            let attrs1 = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)]
             boldStr = NSMutableAttributedString(string:title,attributes:attrs1)
        }
        
        if let subtitle = mSubtitle {
        let attrs2 = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14)]
         normalStr = NSMutableAttributedString(string: subtitle, attributes:attrs2)
        }
        boldStr.append(normalStr)
        return boldStr
    }
    
    //Mark: Get Cache Data
    func getUserDefaultInstance() -> [String:Any]{
        let defaults = UserDefaults.standard
        if let dict = defaults.dictionary(forKey: Constants.CacheKeys.FUNDOONTES){
            return dict
        }else{
            defaults.set([:], forKey: Constants.CacheKeys.FUNDOONTES)
            return [:]
        }
    }
    
    //Mark: Remove Cache Data
    func updateUserDefaultVCData(forKey : String,value:Any){
       var dictionary = getUserDefaultInstance()
        if let dict = dictionary[forKey] {
            dictionary[forKey] = value
        }else{
            dictionary[forKey] = value
        }
        UserDefaults.standard.set(dictionary, forKey: Constants.CacheKeys.FUNDOONTES)
        }
 
}
