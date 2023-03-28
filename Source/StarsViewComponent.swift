//
//  StarsView.swift
//  SimpleStarsDemo
//
//  Created by sreelekh N on 17/10/22.
//

import UIKit
public protocol SimpleStarsViewBinding: AnyObject {
    func userTappedRating(rating: Int)
    func selectedImage() -> String
    func nonSelectedImage() -> String
    func numberOfStars() -> Int
    func currentRating() -> Int
    
    // If rendered as template image
    func imageTintColor() -> UIColor
}

public extension SimpleStarsViewBinding {
    func selectedImage() -> String {
        return "star.fill"
    }
    
    func nonSelectedImage() -> String {
        return "star"
    }
    
    func numberOfStars() -> Int {
        return 5
    }
    
    func currentRating() -> Int {
        return 0
    }
    
    func imageTintColor() -> UIColor {
        return UIColor.systemYellow
    }
}

public final class StarsViewComponent: UIView, StarViewDelegate {
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var stackView: UIStackView!
    
    private var btnViews: [StarView] = []
    public weak var delegate: SimpleStarsViewBinding? {
        didSet {
            self.reloadData()
        }
    }
    
    public func reloadData() {
        guard let delegate else { return }
        self.createStars(delegate: delegate)
        self.rating = delegate.currentRating()
    }
    
    private func createStars(delegate: SimpleStarsViewBinding) {
        self.btnViews = (0..<delegate.numberOfStars()).map { _ in
            let view = StarView()
            view.btn.tintColor = delegate.imageTintColor()
            view.btn.setImage(str: delegate.nonSelectedImage())
            return view
        }
        for (index, view) in btnViews.enumerated() {
            view.tag = index
            view.delegate = self
            stackView.addArrangedSubview(view)
        }
    }
    
    private var rating: Int = 0 {
        didSet {
            guard let delegate else { return }
            for i in 0..<delegate.numberOfStars() {
                if i < rating {
                    btnViews[i].btn.setImage(str: delegate.selectedImage())
                } else {
                    btnViews[i].btn.setImage(str: delegate.nonSelectedImage())
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        registerView()
        addView(subview: view)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        registerView()
        addView(subview: view)
    }
    
    func tapAction(tag: Int) {
        self.rating = tag + 1
        self.delegate?.userTappedRating(rating: self.rating)
    }
}
