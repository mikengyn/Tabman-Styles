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

    private(set) var viewControllers: [InstagramChildViewController]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewControllers = [
            childViewController(withTitle: "Following"),
            childViewController(withTitle: "You")
        ]
        self.bar.items = viewControllers.flatMap({ Item(title: $0.pageTitle!) })
        
        self.dataSource = self
        
        self.bar.style = .buttonBar
        self.bar.appearance = TabmanBar.Appearance({ (appearance) in
            
            appearance.indicator.color = .black
            appearance.indicator.lineWeight = .thin
            appearance.indicator.compresses = true
            
            appearance.text.font = UIFont.systemFont(ofSize: 16.0, weight: UIFont.Weight.medium)
        })
    }
    
    private func childViewController(withTitle title: String) -> InstagramChildViewController {
        let storyboard = UIStoryboard(name: "Instagram", bundle: Bundle.main)
        let identifier = "InstagramChildViewController"
        
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as! InstagramChildViewController
        viewController.pageTitle = title
        
        return viewController
    }
}

extension InstagramViewController: PageboyViewControllerDataSource {
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}
