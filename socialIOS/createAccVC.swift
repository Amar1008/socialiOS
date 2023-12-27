//
//  createAccVC.swift
//  socialIOS
//
//  Created by kamal on 18/12/23.
//

import UIKit
import Firebase

class createAccVC: UIViewController {
    
    @IBOutlet weak var mobileNUM: CustomizableTextfield!
    
    @IBOutlet weak var emailAddressText: CustomizableTextfield!
    
    @IBOutlet weak var passWord: CustomizableTextfield!
    
    @IBOutlet weak var passwordText: CustomizableTextfield!
    
    @IBOutlet weak var userName: CustomizableTextfield!
    
    @IBOutlet weak var userNameText: CustomizableTextfield!
    
    @IBOutlet weak var confirmPasswordText: CustomizableTextfield!
    
    @IBOutlet weak var confirmPassword: CustomizableTextfield!
    
    @IBOutlet weak var emailAddress: CustomizableTextfield!
    
    @IBOutlet weak var missMatch: CustomizableTextfield!
    
    @IBOutlet weak var eyeBtn2: UIButton!
    
    @IBOutlet weak var eyeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = true
        
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailAddress {
            emailAddressText.isHidden = true
        }
        else if textField == passWord{
            passwordText.isHidden = true
        }
        else if textField == userName{
            userNameText.isHidden = true
        }
        else if textField == confirmPassword{
            confirmPassword.isHidden = true
        }
        
    }
    
    @IBAction func signIn(_ sender: Any) {
        if emailAddress.text == ""{
            emailAddressText.isHidden = false
        }
        else if passWord.text == ""{
            passwordText.isHidden = false
        }
        else if userName.text == ""{
            userNameText.isHidden = false
        }
        else if confirmPassword.text == ""{
            confirmPasswordText.isHidden = false
        }
        else{
            SignIN()
        }
        
    }
    
    func SignIN(){
        var ref: DatabaseReference!
        if passWord.text == confirmPassword.text{
            ref = Database.database().reference()
            
            ref.child("User's").childByAutoId().key
            let array = ["email": mobileNUM.text,"password": passWord.text,"username": userName.text]
            ref.child("User's").childByAutoId().setValue(array){
                (error:Error?, ref:DatabaseReference) in
                if let error = error {
                    print("Data could not be saved: \(error).")
                } else {
                    print("Data saved successfully!")
                }
            }}
        else {
            
        }
    }
    var iconClick = true
    
    @IBAction func iconAction(sender: UIButton) {
        if iconClick {
            passwordText.isSecureTextEntry = true
            eyeBtn.setImage(UIImage(named: "close eye"), for: .normal)
        } else {
            passwordText.isSecureTextEntry = false
            eyeBtn.setImage(UIImage(named: "open eye"), for: .normal)
        }
        iconClick = !iconClick
    }
    
    // Do any additional setup after loading the view.
}
        //
        //
        //    /*
        //    // MARK: - Navigation
        //
        //    // In a storyboard-based application, you will often want to do a little preparation before navigation
        //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        // Get the new view controller using segue.destination.
        //        // Pass the selected object to the new view controller.
        //    }
        //    */
        //
        //}

