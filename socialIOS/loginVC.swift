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
        print("hi")
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
    
    func SignIN(){
        
        var ref: DatabaseReference!
        ref = Database.database().reference()
        let dbReference = ref.child("User's")
        dbReference.queryOrdered(byChild: "email").queryEqual(toValue: mobileNumEmailAdd.text).observeSingleEvent(of: .value) { [weak self] snapshot in
            guard let self = self else { return }
            
            if let userSnapshot = snapshot.children.allObjects.first as? DataSnapshot,
               let user = userSnapshot.value as? [String: Any],
               let storedPassword = user["password"] as? String {
                let userId = userSnapshot.key
                
                if storedPassword == passwordText.text {
                    // Authentication successful
                    print("Authentication successful")
                    
                }
                else{
                    print(storedPassword,"....\n....",userId,"....\n....","....\n....",userSnapshot.value,"....\n....")
                    
                    /*
                     MARK: - Navigation
                     
                     In a storyboard-based application, you will often want to do a little preparation before navigation
                     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                     Get the new view controller using segue.destination.
                     Pass the selected object to the new view controller.
                     }
                     */
                    
                }
            }
        }
    }
    @IBAction func createAccountBtn(_ sender: Any) {
        print("hihlo")
        let vc = storyboard?.instantiateViewController(identifier: "signUp") as! createAccVC
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true)
    }
    @IBAction func forgetPassword(_ sender: Any) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ForgetpassWord") as! forgetPasswordVC
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true)
        
    }
}
