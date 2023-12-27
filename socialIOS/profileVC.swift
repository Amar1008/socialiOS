//
//  profileVC.swift
//  socialIOS
//
//  Created by kamal on 23/12/23.
//
import Firebase
import UIKit
import FirebaseStorage

class profileVC: UIViewController,UITextFieldDelegate{
    
    @IBOutlet weak var calender: UIDatePicker!
    @IBOutlet weak var profilePIC: UIImageView!
    @IBOutlet weak var DOB: CustomizableTextfield!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = true
        
        view.addGestureRecognizer(tap)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMMM-yyyy"
        DOB.placeholder = dateFormatter.string(from: Date())
        // Do any additional setup after loading the view.
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    //    @objc func startDatePickerValueChanged(){
    //        view.endEditing(true)
    //    }
    
    @IBAction func startDatePickerValueChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMMM-yyyy"
        DOB.text = dateFormatter.string(from: sender.date)
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    @IBAction func saveData(_ sender: Any) {
        
        let storageRef = Storage.storage().reference().child("ProfilePic")
        
        guard let data = profilePIC.image?.jpegData(compressionQuality: 0.05) else {
            return print("-------> not converted ")
        }
        
        storageRef.putData(data, metadata: nil)
        print("-----> Uploaded")
        
        
        var ref: DatabaseReference!
        ref = Database.database().reference()
        ref.child("User's").childByAutoId().key
        let array = ["Profile Picture": profilePIC.image,"Date of Birth": DOB.text] as [String : Any]
        ref.child("User's").childByAutoId().setValue(array){
            (error:Error?, ref:DatabaseReference) in
            if let error = error {
                print("Data could not be saved: \(error).")
            } else {
                print("Data saved successfully!")
            }
        }
    }
}
