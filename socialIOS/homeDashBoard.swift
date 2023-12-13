//
//  homeDashBoard.swift
//  socialIOS
//
//  Created by kamal on 01/12/23.
//

import UIKit

class homeDashBoard: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var MainCollection: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        MainCollection.collectionViewLayout = createLayout()
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
               case 0:
                   return 6 // Adjusted the number of items in section 0 (e.g., StoryCell)
               case 1:
                   return 3 // Adjusted the number of items in section 1 (e.g., PostCell)
               default:
                   return 0
               }
    
       
    }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if indexPath.section == 0 {
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCell", for: indexPath) as! StoryCell
                        // Configure StoryCell if needed
                        return cell
                    } else if indexPath.section == 1 {
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCell", for: indexPath) as! PostCell
                        
                        
                        cell.imageCollection.dataSource = cell.self
                        cell.imageCollection.delegate = cell.self
                        // Configure PostCell if needed
                        return cell
                    } else {
                        return UICollectionViewCell()
                    }

        }
    

    func createLayout() -> UICollectionViewLayout {
            let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
                switch sectionIndex {
                case 0:
                    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                           let item = NSCollectionLayoutItem(layoutSize: itemSize)
                   
                           let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(120), heightDimension: .estimated(140))
                           let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                           let section = NSCollectionLayoutSection(group: group)
                           section.orthogonalScrollingBehavior = .continuous

                           

                           return section
                case 1:
                    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(100))
                            let item = NSCollectionLayoutItem(layoutSize: itemSize)
                 

                            // Use Auto Layout constraints to get estimated height
                    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(100))
                            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                            let section = NSCollectionLayoutSection(group: group)

                            // Add a footer for section 1
                            let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
                            let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize, elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottomTrailing)
                            section.boundarySupplementaryItems = [footer]

                            return section
                    
                default:
                    return nil
                }
            }
            return layout
        }
}


class StoryCell : UICollectionViewCell {
    
}

class PostCell : UICollectionViewCell,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var imageCollection: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! imageCell
        
        
        return cell
        
    }
    
    
}

class imageCell: UICollectionViewCell{
     
    @IBOutlet weak var postImage: CustomizableImageView!
    override func awakeFromNib() {
        postImage.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
    }
    
}
        // Do any additional setup after loading the view.
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
