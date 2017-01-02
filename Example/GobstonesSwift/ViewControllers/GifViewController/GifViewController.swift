//
//  GifViewController.swift
//  GobstonesSwift
//
//  Created by Nishant Bhasin on 2016-12-27.
//  Copyright © 2016 Nishant Bhasin. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class GifViewController: BaseViewController, CustomNavBarDelegate{
    fileprivate var networkUtils: NetworkUtils?
    @IBOutlet weak var gifViiew: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    func setup() {
        self.networkUtils = NetworkUtils()
        DispatchQueue.global(qos: .userInitiated).async {
            self.networkUtils?.fetchRandomGif(completion: {(gifUrl: String) -> Void in
                
                DispatchQueue.main.async {
                    self.gifViiew.sd_setImage(with: URL(string: gifUrl))
                }
                
            })
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationBar?.delegate = self
    }
    
    // MARK: - Navigationbar Delegate
    
    func leftButtonPressed() {
        self.navigationController?.popViewController(animated: true)
    }
}
