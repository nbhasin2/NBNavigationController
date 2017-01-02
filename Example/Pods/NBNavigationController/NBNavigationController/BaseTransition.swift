//
//  BaseTransition.swift
//  GobstonesSwift
//
//  Created by Nishant Bhasin on 2017-01-01.
//  Copyright © 2017 Nishant Bhasin. All rights reserved.
//

import Foundation
import UIKit

public class BaseTransition: NSObject {
    public var transitionDuration: TimeInterval = 1.0
    
    public convenience init(transitionDuration:TimeInterval) {
        self.init()
        self.transitionDuration = transitionDuration
    }
}
