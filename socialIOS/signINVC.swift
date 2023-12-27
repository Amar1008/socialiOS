//
//  signIN.swift
//  socialIOS
//
//  Created by kamal on 18/12/23.
//

import UIKit
import FirebaseDatabase

class signIN: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
