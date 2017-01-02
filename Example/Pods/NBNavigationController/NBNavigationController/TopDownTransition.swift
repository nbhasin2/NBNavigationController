//
// TopDownTransition.swift
//
// The MIT License (MIT)
//
// Copyright (c) 2017 Nishant Bhasin. <nikieme3@gmail.com>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Foundation
import UIKit

public class TopDownTransition: BaseTransition, UIViewControllerAnimatedTransitioning {
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return transitionDuration
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        guard
            let toView = transitionContext.view(forKey: UITransitionContextViewKey.to),
            let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
            else {
                transitionContext.completeTransition(true)
                return
        }
        
        toView.frame = container.frame
        toView.frame.origin.y = -toView.frame.maxY
        container.addSubview(toView)
        
        UIView.animate(
            withDuration: transitionDuration,
            animations: {
                fromViewController.view.frame.origin.y = container.frame.maxY
                toView.frame = container.frame
            },
            completion: { _ in
                transitionContext.completeTransition(true)
            }
        )
    }
    
}
