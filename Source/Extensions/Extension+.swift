//
//  Extension+.swift
//  SimpleStarsDemo
//
//  Created by sreelekh N on 17/10/22.
//

import UIKit
extension UIView {
    func registerView() {
        self.frame = UIScreen.main.bounds
        let name = self.className
        let bundle = Bundle(for: self.classForCoder)
        let nib = UINib(nibName: name, bundle: bundle)
        nib.instantiate(withOwner: self, options: nil)
    }
    
    func addView(subview: UIView) {
        subview.frame = UIScreen.main.bounds
        subview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(subview)
    }
}

public protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

public extension ClassNameProtocol {
    static var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }
}

extension NSObject: ClassNameProtocol {}

extension UIButton {
    func setImage(str: String) {
        DispatchQueue.main.async {
            self.setImage(str.getImage, for: .normal)
        }
    }
}

extension String {
    var getImage: UIImage {
        if let image = UIImage(systemName: self) {
            return image
        } else if let image = UIImage(named: self) {
            return image
        }
        return UIImage()
    }
}
