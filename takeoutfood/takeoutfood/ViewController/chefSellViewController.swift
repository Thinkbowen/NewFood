//
//  chefSellViewController.swift
//  takeoutfood
//
//  Created by Fred Chen on 2018-01-18.
//  Copyright © 2018 fred. All rights reserved.
//

import UIKit

class chefSellViewController: UIViewController {
  //MARK: Properties
  @IBOutlet weak var dishInput: UITextField!
  @IBOutlet weak var descInput: UITextField!
  @IBOutlet weak var priceInput: UITextField!
  

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
  @IBAction func addDish(_ sender: UIButton) {
    //var menuAry = [String]()
    let menuAry = ChefManager.sharedInstance.chef.menus!
    let menuID = menuAry[0]
    let newDish = Dish(_id:nil, name:dishInput.text!, description:descInput.text!, price:Float(priceInput.text!)!, photo:"a", cuisineType:"a", cooktime:nil)
//   print(menuID)
//    print(menuAry[0])
//   print(newDish)
    RestAPIManager.sharedInstance.post_chef_menus_dish(id:menuID,dish:newDish,
    onSuccess:{(dish:Dish) in DispatchQueue.main.async{
      print("add dish success")
    }

    }
    ,onFailure:{_ in DispatchQueue.main.async{
      print("fail to add dish")
    }

    })
  }
  
  
}
