//
//  TimeLineItemCell.swift
//  TimeLineSample
//
//  Created by ryoto.maeda on 2017/04/10.
//  Copyright © 2017年 ryoto.maeda. All rights reserved.
//

import UIKit

class TimeLineItemCell: UITableViewCell {

    @IBOutlet weak var topBorder: UIView!
    @IBOutlet weak var bottomBorder: UIView!
    @IBOutlet weak var timeLineImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func newState(item: TimeLineItem, prevItem: TimeLineItem?, nextItem: TimeLineItem?) {
        self.timeLineImageView.backgroundColor = item.color
        
        if let prevItem = prevItem {
            let topColor = prevItem.color
            let bottomColor = item.color
            let gradientLayer = self.generateGradientLayer(topColor: topColor, bottomColor: bottomColor)
            gradientLayer.frame = CGRect(x: 0, y: -self.topBorder.frame.height, width: self.topBorder.frame.width, height: self.topBorder.frame.height * 2)
            self.topBorder.layer.insertSublayer(gradientLayer, at: 0)
        }
        
        if let nextItem = nextItem {
            
            let topColor = item.color
            let bottomColor = nextItem.color
            let gradientLayer = self.generateGradientLayer(topColor: topColor, bottomColor: bottomColor)
            gradientLayer.frame = CGRect(x: 0, y: 0, width: self.topBorder.frame.width, height: self.topBorder.frame.height * 2)

            self.bottomBorder.layer.insertSublayer(gradientLayer, at: 0)
        }
    }
    
    func generateGradientLayer(topColor: UIColor, bottomColor: UIColor) -> CAGradientLayer {
        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        
        gradientLayer.colors = gradientColors
        
        return gradientLayer
    }
    
    

}
