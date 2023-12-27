//
//  loginVC.swift
//  socialIOS
//
//  Created by kamal on 06/12/23.
//

import UIKit
import Firebase

class loginVC: UIViewController {

    @IBOutlet weak var eyeBtn: UIButton!
    @IBOutlet weak var passwordText: CustomizableTextfield!
    @IBOutlet weak var mobileNumEmailAdd: CustomizableTextfield!
    @IBOutlet weak var passEymptyMssg: CustomizableTextfield!
    @IBOutlet weak var mobEymptyMssg: CustomizableTextfield!
    
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
              if textField == mobileNumEmailAdd {
                  mobEymptyMssg.isHidden = true
              }
            else if textField == passwordText{
                passEymptyMssg.isHidden = true
            }
          }
    
        @IBAction func signIn(_ sender: Any) {
            if mobileNumEmailAdd.text == ""{
                mobEymptyMssg.isHidden = false
            }
            else if passwordText.text == ""{
                passEymptyMssg.isHidden = false
            }
            else{
                SignIN()
            }
   
        }
    
    func SignIN(){
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        ref.child("User's").childByAutoId().key
        let array = ["email": mobileNumEmailAdd.text,"password": passwordText.text]
        ref.child("User's").childByAutoId().setValue(array){
            (error:Error?, ref:DatabaseReference) in
            if let error = error {
                print("Data could not be saved: \(error).")
            } else {
                print("Data saved successfully!")
            }
        }
    }
        var iconClick = true
     
        @IBAction func iconAction(sender: UIButton) {
            if iconClick {
                passwordText.isSecureTextEntry = false
                eyeBtn.setImage(UIImage(named: "open eye"), for: .normal)
            } else {
                passwordText.isSecureTextEntry = true
                eyeBtn.setImage(UIImage(named: "close eye"), for: .normal)
            }
            iconClick = !iconClick
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
