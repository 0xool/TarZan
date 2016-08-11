//
//  LoginPageController.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/13/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import UIKit



class LoginPageController: UIViewController {
    
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBAction func RegisterBtnCLicked(sender: AnyObject) {
        
        self.performSegueWithIdentifier("RegisteringView", sender: nil)
        
    }
    
    @IBAction func LoginBTN(sender: AnyObject) {
    
        if let username = UsernameTextField.text where username != "" , let pwd = PasswordTextField.text where pwd != ""{
        
           
//            Alamofire.request(.GET, "https://httpbin.org/get", parameters: ["foo": "bar"])
//                .validate()
//                .responseJSON { response in
//                    switch response.result {
//                    case .Success:
//                        print("Validation Successful")
//                        self.performSegueWithIdentifier("LoggedIn", sender: nil)
//                    case .Failure(let error):
//                        let alert = UIAlertView()
//                        alert.title = "خطا در ارتباط با شبکه"
//                        if error.code == -1009{
//                            alert.message = "شبکه قطع می باشد"
//                        }else{
//                            alert.message = "\(error)"
//                        }
//                        alert.addButtonWithTitle("تایید")
//                        alert.show()
//                    }
//            }
//                
            
            
            
            
            
//            let params = ["param": "param1", "array": ["first array element","second","third"], "num": 23, "dict": ["someKey": "someVal"]]
//            do {
//                let opt = try HTTP.POST("https://domain.com/new", parameters: params)
//                opt.start { response in
//                    //do things...
//                  self.performSegueWithIdentifier("LoggedIn", sender: nil)
//                }
//            } catch let error {
//                print("got an error creating the request: \(error)")
//                let alert = UIAlertView()
//                alert.title = "خطا در دریافت اطلاعات"
//                alert.message = "\(error)"
//                alert.addButtonWithTitle("تایید")
//                alert.show()
//            }
            

            
            
        }else{
            
      
        }
        
    
    }
    
    
    @IBOutlet weak var RegisteringBTN: LoginButtonView!
  
    
    

}
