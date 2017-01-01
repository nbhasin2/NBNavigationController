# NBNavigationController
Custom navigation controller to allow more transition instead of just push and pop.

## Requirements

iOS 8+ and Xcode 8 (for Swift 3.0).

## Installation

### CocoaPods

Coming soon 

### Manual

Download and copy the folder NBNavigationController add it to your project in Xcode.

## Usage

Declare a global NBNavigationController in your class that has access to navigationController

```
let transitionController = NBNavigationController()

```

When you want to use push view with custom transition use the following in your function.

```
let yourViewController = yourViewController()
let customTransition = FadeInTransition(transitionDuration: 10.0)

transitionController.pushViewController(yourViewController, ontoNavigationController: self.navigationController!, animatedTransition: customTransition)
```

You may give it a duration or let it default to 1.0 seconds of timeInterval

#### Customization 

FadeInTransition(transitionDuration: 10.0)

or

FadeInTransition()
FadeOutTransition()
BottomUpTransition()
TopDownTransition()

## Example

Look at ExampleGobstonesSwift project. Inside the project look for InitialViewController.swift under ViewControllers. It shows how to implement the custom trasition in your project. 

```
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

```

### License

The MIT License (MIT)

Copyright (c) 2016 Nishant Bhasin. <nikieme3@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
