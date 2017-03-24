//
//  InstagramViewController.swift
//  Instagram
//
//  Created by Merrick Sapsford on 23/03/2017.
//  Copyright © 2017 Merrick Sapsford. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class InstagramViewController: TabmanViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        self.bar.style = .buttonBar
        self.bar.appearance = TabmanBar.Appearance({ (appearance) in
            
            appearance.indicator.color = .black
            appearance.indicator.lineWeight = .thin
            appearance.indicator.compresses = true
            
            appearance.text.font = UIFont.systemFont(ofSize: 16.0, weight: UIFontWeightMedium)
        })
    }
}

extension InstagramViewController: PageboyViewControllerDataSource {
    
    func viewControllers(forPageboyViewController pageboyViewController: PageboyViewController) -> [UIViewController]? {
        let followingViewController = childViewController(withTitle: "Following")
        let youViewController = childViewController(withTitle: "You")
        
        let viewControllers = [followingViewController, youViewController]
        
        // create bar items
        var barItems = [TabmanBarItem]()
        for viewController in viewControllers {
            barItems.append(TabmanBarItem(title: viewController.pageTitle!))
        }
        
        self.bar.items = barItems
        return viewControllers
    }
    
    func defaultPageIndex(forPageboyViewController pageboyViewController: PageboyViewController) -> PageboyViewController.PageIndex? {
        return nil
    }
    
    private func childViewController(withTitle title: String) -> InstagramChildViewController {
        let storyboard = UIStoryboard(name: "Instagram", bundle: Bundle.main)
        let identifier = "InstagramChildViewController"
        
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as! InstagramChildViewController
        viewController.pageTitle = title
        
        return viewController
    }
}
