//
//  HeaderView.swift
//  StrechyHeader
//
//  Created by 抜井正寛 on 2019/02/11.
//  Copyright © 2019 Masahiro Nukui. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    let imageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "UNADJUSTEDNONRAW_thumb_931"))
        iv.contentMode = .scaleAspectFill
        
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .red
        addSubview(imageView)
        
        imageView.fillSuperview()
        
        // blur
        setupVisualEffectBlur()
        
    }
    
    var animator: UIViewPropertyAnimator!
    
    fileprivate func setupVisualEffectBlur() {
        animator = UIViewPropertyAnimator(duration: 3.0, curve: .linear, animations: { [weak self] in
            
            // treat this area as the end state of your animation
            let blurEffect = UIBlurEffect(style: .regular)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            
            self?.addSubview(visualEffectView)
            visualEffectView.fillSuperview()
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
