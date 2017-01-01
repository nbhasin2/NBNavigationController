//
//  BaseViewController.swift
//  GobstonesSwift
//
//  Created by Nishant Bhasin on 2016-12-21.
//  Copyright © 2016 Nishant Bhasin. All rights reserved.
//

import Foundation
import UIKit

enum BarType {
    case None,
    SemiTransparent,
    Purple
}

class BaseViewController: UIViewController {
    
    fileprivate var barType:BarType = .None
    fileprivate var navTitle = ""
    fileprivate var shouldPop = false
    var navigationBar:CustomNavBar?
    
    init(barType:BarType, title: String, shouldPop: Bool) {
        super.init(nibName: nil, bundle: nil)
        self.barType = barType
        self.navTitle = title
        self.shouldPop = shouldPop
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.navigationBar.barStyle = .black
        self.navigationController!.navigationBar.isHidden = true
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        if self.navigationBar == nil {
            self.navigationBar = CustomNavBar(title: self.navTitle, shouldPop: self.shouldPop, style: self.barType)
            self.view.addSubview(navigationBar!)
        }
    }
}
