//
//  forgetPasswordVC.swift
//  socialIOS
//
//  Created by kamal on 21/12/23.
//

import UIKit

class forgetPasswordVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func doneBTN(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
}
