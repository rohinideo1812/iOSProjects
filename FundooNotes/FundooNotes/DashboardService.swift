//
//  DashboardService.swift
//  FundooNotes
//
//  Created by BridgeLabz on 22/05/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import Foundation
import UIKit

struct NoteItem {
    let title : String?
    let image : UIImage?
    let date : String?
    let subtitle : String?
}
class DashBoardService {
    
    func getNotes(callBack:([NoteItem]) -> Void){
        let notes = [NoteItem(title: "Iyafgdfgdfgdfgkjdgkjdgkjdfgdgd",image: UIImage(named :"pic1"),date: "24/5/2018",subtitle : "gghghgfhghghgfhgfhgfhgfhghgfghgfhjekfkjehfehfgleelfjlffkljfdlfkj"),
                     NoteItem(title: "Milagdgdfgdfgdfgfdgdfgdfgdfgdfgdfg",  image: UIImage(named :"pic2"),date: "24/5/2018",subtitle : "fdgfgffg"),
                     NoteItem(title: "Mdfgdfgdfghdfkhgkdfhgkdfhgdgjdgjbdfgdkbggbgdfgdfgdfgdark",  image: UIImage(named : "pic3"),date:"24/5/2018",subtitle : nil),
                     NoteItem(title: "Rohini",  image:UIImage(named : "pic4"),date:nil,subtitle : "fdgfgfgfgfggfgfgfgfdgnfdkjgfjkgkfjngfkdlngldfngdlfkngldfkngldfknglfdkngldfgldfkgdlkgn"),
                     NoteItem(title: nil,  image: nil,date: nil,subtitle : "fgfgfg"),
                     NoteItem(title: "Mdfgdfgdfghdfkhgkdfhgkdfhgdgjdgjbdfgdkbggbgdfgdfgdfgdgdfgdfgdfgdfgdfarkdbsfkjbdfkjdbfjkdguydsbfkjdsfdsdf",  image: UIImage(named : "pic4"),date:"24/5/2018",subtitle : "fgfgfgfgfgg")
        ]
        
        callBack(notes)
    }
}
