//
//  FavouritesViewController.swift
//  FoodApp
//
//  Created by BridgeLabz on 06/07/18.
//  Copyright © 2018 BridgeLabz. All rights reserved.
//

import UIKit

class FavouritesViewController: UIViewController {

    
    var itemName = ["Pasta Salad","Pan Cakes","MineStrone Soup","Choclate Pudding","Alffredo Sauce","Sour Cream Meat Tacos"]
    var itemType = ["HEALTHY","BREAKFAST AND BRUNCH","SOUP","DESERT","PASTA","MAIN DISH"]
    var itemImg = [UIImage(named: "img_pastasalad"),UIImage(named: ""),UIImage(named: "img_pancake"),UIImage(named: "img_soup"),UIImage(named: "img_shake2"),UIImage(named: "img_sauce"),UIImage(named: "img_meat")]
    var time = ["25 minutes","14 minutes","2 minutes","10 minutes","15 minutes","5 minutes"]
    var level = ["Easy","Medium","Medium","Easy","Easy","Medium"]
    var peoples = ["5 people","15 people","51 people","6 people","5 people","45 people"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   
}
