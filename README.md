# NBNavigationController
Custom navigation controller to allow more transition instead of just push and pop.

## Requirements

iOS 8+ and Xcode 8 (for Swift 3.0).

## Installation

### CocoaPods
```
pod 'NBNavigationController'
```

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

## License

This project is licensed under the MIT license. See the [LICENSE](LICENSE.txt) file for more info.
