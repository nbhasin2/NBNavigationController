//
//  BaseTransition.swift
//  GobstonesSwift
//
//  Created by Nishant Bhasin on 2017-01-01.
//  Copyright © 2017 Nishant Bhasin. All rights reserved.
//

import Foundation
import UIKit

class BaseTransition: NSObject {
    var transitionDuration: TimeInterval = 1.0
    
    convenience init(transitionDuration:TimeInterval) {
        self.init()
        self.transitionDuration = transitionDuration
    }
}
