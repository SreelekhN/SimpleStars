//
//  StarView.swift
//  SimpleStarsDemo
//
//  Created by sreelekh N on 17/10/22.
//

import UIKit
protocol StarViewDelegate: StarsViewComponent {
    func tapAction(tag: Int)
}

final public class StarView: UIView {
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var btn: UIButton!
    
    weak var delegate: StarViewDelegate?
    
    @IBAction func btnAction(_ sender: Any) {
        self.delegate?.tapAction(tag: self.tag)
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
}
