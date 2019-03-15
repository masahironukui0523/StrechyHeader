//
//  StretchyHeaderLayout.swift
//  StrechyHeader
//
//  Created by 抜井正寛 on 2019/02/12.
//  Copyright © 2019 Masahiro Nukui. All rights reserved.
//

import UIKit

class StretchyHeaderLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        layoutAttributes?.forEach({ (attributes) in
            
            // headerが一つの時だけしか動作しない
            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader && attributes.indexPath.section == 0{
                
                guard let collectionView = collectionView else { return }
                
                let contentOffsetY = collectionView.contentOffset.y
                
                
                if contentOffsetY > 0 {
                    return
                }
                
                let width = collectionView.frame.width
                
                let height = attributes.frame.height - contentOffsetY
                
                attributes.frame = CGRect(x: 0, y: contentOffsetY, width: width, height: height)
            }
            
        })
        
        return layoutAttributes
        
    }
    
    // Asks the layout object if the new bounds require a layout update.
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

}
