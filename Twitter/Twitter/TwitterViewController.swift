//
//  TwitterViewController.swift
//  Twitter
//
//  Created by Merrick Sapsford on 21/03/2017.
//  Copyright © 2017 Merrick Sapsford. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class TwitterViewController: TabmanViewController {
    
    private(set) var viewControllers: [TwitterChildViewController]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewControllers = [
            childViewController(withTitle: "Tweets"),
            childViewController(withTitle: "Tweets & Replies"),
            childViewController(withTitle: "Media"),
            childViewController(withTitle: "Likes")
        ]
        self.bar.items = self.viewControllers.flatMap({ Item(title: $0.pageTitle!.uppercased()) })
        
        self.dataSource = self
        
        // set appearance
        self.bar.appearance = TabmanBar.Appearance({ (appearance) in
            
            // colors
            appearance.indicator.color = UIColor.twitterBlue
            appearance.state.selectedColor = UIColor.twitterBlue
            appearance.state.color = UIColor.twitterGray
            
            appearance.text.font = UIFont.systemFont(ofSize: 14.0, weight: .medium)
            
            // layout
            appearance.layout.height = .explicit(value: 44.0)
            appearance.layout.interItemSpacing = 20.0
        })
    }
    
    private func childViewController(withTitle title: String) -> TwitterChildViewController {
        let storyboard = UIStoryboard(name: "Twitter", bundle: Bundle.main)
        let identifier = "TwitterChildViewController"
        
        let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as! TwitterChildViewController
        viewController.pageTitle = title
        
        return viewController
    }
}

extension TwitterViewController: PageboyViewControllerDataSource {
    
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

