//
//  Array+TimeLineSample.swift
//  TimeLineSample
//
//  Created by ryoto.maeda on 2017/04/10.
//  Copyright © 2017年 ryoto.maeda. All rights reserved.
//

import Foundation

extension Array {
    subscript (safe index: Int) -> Element? {

        get {
            return indices ~= index ? self[index] : nil
        }
        
        set (value) {
            if value == nil {
                return
            }
            
            if !(indices ~= index) {
                return
            }
            
            self[index] = value!
        }
    }
}
