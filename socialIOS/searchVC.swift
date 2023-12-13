//
//  searchVC.swift
//  socialIOS
//
//  Created by kamal on 04/12/23.
//

import UIKit

class searchVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    
    @IBOutlet weak var MainCollection: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        MainCollection.collectionViewLayout = createLayout()
    }
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        guard let index = pages.firstIndex(of: viewController), index > 0 else { return nil }
//        
//        //        pageControl.currentPage = index - 1
//        return pages[index - 1]
//    }
//    
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        guard let index = pages.firstIndex(of: viewController), index < (pages.count - 1) else { return nil }
//        //        pageControl.currentPage = index + 1
//        return pages[index + 1]
//    }
    
    
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
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchCategory", for: indexPath) as! searchCategory
                    // Configure StoryCell if needed
                    return cell
                } else if indexPath.section == 1 {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchPost", for: indexPath) as! searchPost
                    // Configure PostCell if needed
                    return cell
                } else {
                    return UICollectionViewCell()
                }
    }
    
//    @IBOutlet weak var pageViewController: UIView!
//    var pageController : UIPageViewController!
//    // (see note below about ".scroll" mode, you almost always need this line of code:)
//    var pages = [UIViewController]()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
//        pageController.delegate = self
//        pageController.dataSource = self
//        
//     pageController.view.frame = CGRect(x: 0, y: 0, width: pageViewController.frame.size.width, height: pageViewController.frame.size.height)
//        
//        let p1: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "ComplaintHeader")
//        let p2: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "ComplaintStatusInProgress")
//        
//        pages.append(p1)
//        pages.append(p2)
//        
//        
//        // etc ...
//        
//        pageController.setViewControllers([p1], direction: .forward, animated: false, completion: nil)
//        
//        addChild(pageController)
//        pageViewController.addSubview(pageController.view)
//        // Do any additional setup after loading the view.
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func createLayout() -> UICollectionViewLayout {
            let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
                switch sectionIndex {
                case 0:
                    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                           let item = NSCollectionLayoutItem(layoutSize: itemSize)
                   
                           let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(80), heightDimension: .estimated(40))
                           let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                           let section = NSCollectionLayoutSection(group: group)
                           section.orthogonalScrollingBehavior = .continuous

                           

                           return section
                case 1:
                    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                            let item = NSCollectionLayoutItem(layoutSize: itemSize)
                 

                            // Use Auto Layout constraints to get estimated height
                    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1.0))
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class searchPost: UICollectionViewCell{
    
}

class searchCategory: UICollectionViewCell{
    
}
