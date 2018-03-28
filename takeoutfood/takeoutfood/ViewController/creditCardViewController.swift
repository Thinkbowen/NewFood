//
//  creditCardViewController.swift
//  takeoutfood
//
//  Created by Fred Chen on 2018-01-19.
//  Copyright © 2018 fred. All rights reserved.
//

import UIKit

class creditCardViewController: UIViewController {
  //MARK: Properties
  @IBOutlet weak var nameInput: UITextField!
  @IBOutlet weak var numberTextField: UITextField!
  @IBOutlet weak var expMonthField: UITextField!
  @IBOutlet weak var expYearField: UITextField!
  @IBOutlet weak var cvdTextField: UITextField!
  @IBOutlet weak var statusLabel: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      nameInput.text = "John Doe"
      numberTextField.text = "4030000010001234"
      expMonthField.text = "02"
      expYearField.text = "14"
      cvdTextField.text = "123"

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
  @IBAction func payNowBtn(_ sender: UIButton) {
    OrderManager.sharedInstance.orderNow()
    let card = Card(name:nameInput.text!,number:numberTextField.text!,expiry_month:expMonthField.text!,expiry_year:expYearField.text!,cvd:cvdTextField.text!)
    let pay = Payment(amount:OrderManager.sharedInstance.totalPrice, payment_method:"card",card:card)
    RestAPIManager.sharedInstance.post_payment(payment:pay
      ,onSuccess:{(receipt:Receipt) in DispatchQueue.main.async{
        print(receipt)
        if(receipt.approved == "1"){
          print("payment success")
          self.statusLabel.text! = "payment success"
          OrderManager.sharedInstance.orderNow()
        }else{
          print("payment refused")
          self.statusLabel.text! = "payment refused"
        }
        }}
      ,onFailure:{_ in DispatchQueue.main.async{
        print("payment fail")
        self.statusLabel.text! = "payment fail"
        }})
  }
  
}
