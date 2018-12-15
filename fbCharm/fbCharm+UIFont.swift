//
//  fbCharm+UIFont.swift
//  fbCharm
//
//  Created by pcjbird on 2018/12/15.
//  Copyright © 2018 Zero Status. All rights reserved.
//

import Foundation
import UIKit

/**
 * UIFont
 */
public extension UIFont {
    convenience init(names: [String], size: CGFloat) {
        
        if names.first != nil {
            let mainFontName = names.first!
            
            let descriptors = names.map { UIFontDescriptor(fontAttributes: [.name: $0]) }
            
            let attributes: [UIFontDescriptor.AttributeName: Any] = [
                UIFontDescriptor.AttributeName.cascadeList: descriptors,
                UIFontDescriptor.AttributeName.name: mainFontName,
                UIFontDescriptor.AttributeName.size: size,
                ]
            
            let customFontDescriptor: UIFontDescriptor = UIFontDescriptor(fontAttributes: attributes)
            self.init(descriptor: customFontDescriptor, size: size)
        }
        else{
            let systemFont = UIFont.systemFont(ofSize: size)
            let systemFontDescriptor: UIFontDescriptor = systemFont.fontDescriptor
            self.init(descriptor: systemFontDescriptor, size: size)
        }
    }
    
    convenience init(families: [String], size: CGFloat) {
        
        if families.first != nil {
            let mainFontFamily = families.first!
            let descriptors = families.map { UIFontDescriptor(fontAttributes: [.family: $0]) }
            
            let attributes: [UIFontDescriptor.AttributeName: Any] = [
                UIFontDescriptor.AttributeName.cascadeList: descriptors,
                UIFontDescriptor.AttributeName.family: mainFontFamily,
                UIFontDescriptor.AttributeName.size: size
            ]
            
            let customFontDescriptor: UIFontDescriptor = UIFontDescriptor(fontAttributes: attributes)
            self.init(descriptor: customFontDescriptor, size: size)
        }
        else{
            let systemFont = UIFont.systemFont(ofSize: size)
            let systemFontDescriptor: UIFontDescriptor = systemFont.fontDescriptor
            self.init(descriptor: systemFontDescriptor, size: size)
        }
    }
    
    @available(iOS 8.2, *)
    convenience init(families: [String], size: CGFloat, weight: UIFont.Weight = .regular) {
        
        if families.first != nil {
            let mainFontFamily = families.first!
            let descriptors = families.map { UIFontDescriptor(fontAttributes: [.family: $0]) }
            let traits = [UIFontDescriptor.TraitKey.weight: weight]
            
            let attributes: [UIFontDescriptor.AttributeName: Any] = [
                UIFontDescriptor.AttributeName.cascadeList: descriptors,
                UIFontDescriptor.AttributeName.family: mainFontFamily,
                UIFontDescriptor.AttributeName.size: size,
                UIFontDescriptor.AttributeName.traits: traits
            ]
            
            let customFontDescriptor: UIFontDescriptor = UIFontDescriptor(fontAttributes: attributes)
            self.init(descriptor: customFontDescriptor, size: size)
        }
        else{
            let systemFont = UIFont.systemFont(ofSize: size, weight: weight)
            let systemFontDescriptor: UIFontDescriptor = systemFont.fontDescriptor
            self.init(descriptor: systemFontDescriptor, size: size)
        }
    }
}
