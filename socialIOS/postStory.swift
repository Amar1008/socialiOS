//
//  postStory.swift
//  socialIOS
//
//  Created by kamal on 01/12/23.
//

import UIKit

class postStory: UIViewController {

    @IBOutlet weak var addBTN: CustomizableButton!
    @IBOutlet weak var optionsForUPLoading: CustomizableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    var iconClick = true
    
    @IBAction func addBTN(_ sender: Any) {
        if iconClick {
            optionsForUPLoading.isHidden = false
            addBTN.setImage(UIImage(named: "close"), for: .normal)
        } else {
            optionsForUPLoading.isHidden = true
            addBTN.setImage(UIImage(named: "+"), for: .normal)
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
