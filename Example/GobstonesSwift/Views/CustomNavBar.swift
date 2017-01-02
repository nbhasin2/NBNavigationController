//
//  CustomNavBar.swift

import Foundation
import UIKit

@objc protocol CustomNavBarDelegate {
    @objc optional func leftButtonPressed()
}

class CustomNavBar: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var blurContentView: UIView!
    var delegate: CustomNavBarDelegate?
    
    var shouldPop = false
    var navTitle:String?
    var style:BarType = BarType.None
    
    init(title:String, shouldPop:Bool = false, frame:CGRect, style: BarType = BarType.None) {
        super.init(frame: frame)
        self.loadViewFromNib()
        self.navTitle = title
        self.shouldPop = shouldPop
        self.style = style
        setup()
    }
    
    convenience init(title:String, shouldPop:Bool, style: BarType = BarType.None) {
        let frameRect = CGRect(x: 0, y: 0, width: UIApplication.shared.statusBarFrame.size.width, height: navBarHeight)
        self.init(title: title, shouldPop: shouldPop, frame: frameRect, style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init() {
        self.init()
        self.loadViewFromNib()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
    }
    
    /*
     Initializer method for loading the view from nib.
     */
    fileprivate func loadViewFromNib()
    {
        let nib = UINib(nibName: "CustomNavBar", bundle: Bundle(for: type(of: self)))
        if let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView
        {
            view.frame = self.bounds
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.addSubview(view)
        }
    }
    
    func setup()
    {
        switch self.style {
        case .None:
            self.isHidden = true
        case .Purple, .SemiTransparent:
            self.backButton.setTitle("Back", for: UIControlState.normal)
            self.backButton.addTarget(self, action: #selector(CustomNavBar.leftButtonAction), for: UIControlEvents.touchUpInside)
            if !shouldPop {
                self.backButton.isHidden = true
            }
            self.titleLabel.text = self.navTitle
            self.titleLabel.textColor = UIColor.lightGray
        }
    }
    
    func leftButtonAction(_ sender: UIButton) {
        self.delegate?.leftButtonPressed?()
    }
}
