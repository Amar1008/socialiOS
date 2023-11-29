//
//  frontPg.swift
//  socialIOS
//
//  Created by kamal on 23/11/23.
//

import UIKit

class feeds: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storyImagesClass", for: indexPath) as! storyImagesClass
        return cell
    }
    
    
    @IBOutlet weak var mailBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mailBtn.layer.borderColor = UIColor.gray.cgColor
        mailBtn.layer.borderWidth = 2
        mailBtn.layer.cornerRadius = 15
        
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

}

class storyImagesClass: UICollectionViewCell{
    
}
