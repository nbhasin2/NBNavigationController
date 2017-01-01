//
// FadeInTransition.swift
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

import UIKit

public class NBNavigationController: NSObject {

    public var customTransition: UIViewControllerAnimatedTransitioning?
    public weak var delegate: UINavigationControllerDelegate?

    public func pushViewController(_ controller: UIViewController, ontoNavigationController navigationController: UINavigationController, animatedTransition: UIViewControllerAnimatedTransitioning) {
        self.delegate = navigationController.delegate
        self.customTransition = animatedTransition
        navigationController.delegate = self
        navigationController.pushViewController(controller, animated: true)
    }

    public func popNavigationController(_ navigationController: UINavigationController, animatedTransition: UIViewControllerAnimatedTransitioning) {
        self.delegate = navigationController.delegate
        self.customTransition = animatedTransition
        navigationController.delegate = self
        navigationController.popViewController(animated: true)
    }
}

// MARK: - UINavigationControllerDelegate Extension

extension NBNavigationController: UINavigationControllerDelegate{
    
    public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.customTransition
    }
    
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        navigationController.delegate = self.delegate
        self.delegate = nil
    }
}

