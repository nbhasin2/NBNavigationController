//
//  InitialViewController.swift
//  GobstonesSwift
//
//  Created by Nishant Bhasin on 2016-12-21.
//  Copyright © 2016 Nishant Bhasin. All rights reserved.
//

import Foundation
import UIKit

class InitialViewController: BaseViewController {
    
    @IBOutlet weak var addItemButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var initialViewCellIdentifier = "InitialViewCellIdentifier"
    fileprivate let navigationItems = ["Fade In", "Bottom Up", "Top Down"]
    
    let transitionController = NBNavigationController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    func setup() {
        self.addItemButton.setTitle("➕", for: .normal)
        
        //Setup TableView
        self.tableView.backgroundColor = UIColor.clear
        self.tableView.register(UINib(nibName: "InitialViewCell", bundle: nil), forCellReuseIdentifier: self.initialViewCellIdentifier)
        self.tableView.allowsSelection = true
        self.tableView.separatorInset = UIEdgeInsets.zero
        self.tableView.separatorStyle = .none
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.cellLayoutMarginsFollowReadableWidth = false
        self.tableView.contentInset = UIEdgeInsetsMake(0,0,0,0);
    }
    
    
    @IBAction func addItemAction(_ sender: UIButton) {
    }
    
}

extension InitialViewController: UITableViewDelegate, UITableViewDataSource {
    
    // UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    // UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return navigationItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Return proper cell with text
        return self.configureCell(tableView, cellForRowAtindexpath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let gifViewController = GifViewController(barType: .SemiTransparent, title: navigationItems[indexPath.item], shouldPop: true)
        let customTransition:UIViewControllerAnimatedTransitioning!
        switch indexPath.item {
        case 0:
            customTransition = FadeInTransition(transitionDuration: 10.0)
        case 1:
            customTransition = BottomUpTransition()
        case 2:
            customTransition = TopDownTransition()
        default:
            customTransition = FadeInTransition()
        }
        transitionController.pushViewController(gifViewController, ontoNavigationController: self.navigationController!, animatedTransition: customTransition)
    }
    
    // Helper methods
    
    func configureCell(_ tableView:UITableView, cellForRowAtindexpath indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: self.initialViewCellIdentifier) as? initialViewCell! {
            cell.foodLabel?.text = navigationItems[indexPath.item]
            cell.contentView.backgroundColor = UIColor.clear
            cell.backgroundColor = UIColor.clear
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell(style: .default, reuseIdentifier: "emptyCell")
    }
}
