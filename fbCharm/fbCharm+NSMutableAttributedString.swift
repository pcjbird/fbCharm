//
//  fbCharm+NSMutableAttributedString.swift
//  fbCharm
//
//  Created by pcjbird on 2018/12/16.
//  Copyright © 2018 Zero Status. All rights reserved.
//

import Foundation
import UIKit

/**
 * NSMutableAttributedString 混合字体字符串扩展
 */
@objc public extension NSMutableAttributedString {
    
    /// 使用字体名称(font-name)列表初始化混合字体字符串
    /// - Parameter text: 文本内容
    /// - Parameter names: 字体名称列表，顺序建议遵循 fallback 机制，通常是首先是拉丁字母、西里尔字母、希腊字母等西文的字体，然后以一定的顺序分别是阿拉伯字母、天城文(例如印度文)、日文、韩文、简体中文、繁体中文等文字的字体。
    /// - Parameter size: 文本大小
    /// - Parameter kern: 文字间隔，默认不指定文本间隔
    /// - Parameter paragraphStyle: 段落样式，默认不设定段落样式
    /// - Parameter fallback: 指定 fallback 到某种语言的系统字体，默认不设定
    /// - Returns: 混合字体字符串(NSMutableAttributedString)
    convenience init(text: String, names: [String], size: CGFloat, kern: CGFloat = 0.0, paragraphStyle: NSParagraphStyle? = nil, fallback: String? = nil){
        let font = UIFont(names: names, size: size)
        var attributes = Dictionary<NSAttributedString.Key , Any>()
        attributes[NSAttributedString.Key.font] = font
        if kern > 0 {
            attributes[NSAttributedString.Key.kern] = kern
        }
        if paragraphStyle != nil {
            attributes[NSAttributedString.Key.paragraphStyle] = paragraphStyle
        }
        if fallback != nil {
            let languages = Locale.preferredLanguages
            if languages.contains(fallback!) {
                attributes[NSAttributedString.Key(rawValue: kCTLanguageAttributeName as String as String)] = fallback
            }
        }
        let attributedString = NSMutableAttributedString(string: text, attributes:attributes)
        self.init(attributedString: attributedString)
    }
    
    /// 使用字体家族(font-family)列表初始化混合字体字符串
    /// - Parameter text: 文本内容
    /// - Parameter families: 字体家族列表，顺序建议遵循 fallback 机制，通常是首先是拉丁字母、西里尔字母、希腊字母等西文的字体，然后以一定的顺序分别是阿拉伯字母、天城文(例如印度文)、日文、韩文、简体中文、繁体中文等文字的字体。
    /// - Parameter size: 文本大小
    /// - Parameter kern: 文字间隔，默认不指定文本间隔
    /// - Parameter paragraphStyle: 段落样式，默认不设定段落样式
    /// - Parameter fallback: 指定 fallback 到某种语言的系统字体，默认不设定
    /// - Returns: 混合字体字符串(NSMutableAttributedString)
    convenience init(text: String, families: [String], size: CGFloat, kern: CGFloat = 0.0, paragraphStyle: NSParagraphStyle? = nil, fallback: String? = nil){
        let font = UIFont(families: families, size: size)
        var attributes = Dictionary<NSAttributedString.Key , Any>()
        attributes[NSAttributedString.Key.font] = font
        if kern > 0 {
            attributes[NSAttributedString.Key.kern] = kern
        }
        if paragraphStyle != nil {
            attributes[NSAttributedString.Key.paragraphStyle] = paragraphStyle
        }
        if fallback != nil {
            let languages = Locale.preferredLanguages
            if languages.contains(fallback!) {
                attributes[NSAttributedString.Key(rawValue: kCTLanguageAttributeName as String as String)] = fallback
            }
        }
        let attributedString = NSMutableAttributedString(string: text, attributes:attributes)
        self.init(attributedString: attributedString)
    }
    
    /// 使用字体家族(font-family)列表初始化混合字体字符串，并制定文本的字重，使用 iOS 8.2 之后的系统
    /// - Parameter text: 文本内容
    /// - Parameter families: 字体家族列表，顺序建议遵循 fallback 机制，通常是首先是拉丁字母、西里尔字母、希腊字母等西文的字体，然后以一定的顺序分别是阿拉伯字母、天城文(例如印度文)、日文、韩文、简体中文、繁体中文等文字的字体。
    /// - Parameter size: 文本大小
    /// - Parameter weight: 字重，默认 regular
    /// - Parameter kern: 文字间隔，默认不指定文本间隔
    /// - Parameter paragraphStyle: 段落样式，默认不设定段落样式
    /// - Parameter fallback: 指定 fallback 到某种语言的系统字体，默认不设定
    /// - Returns: 混合字体字符串(NSMutableAttributedString)
    @available(iOS 8.2, *)
    convenience init(text: String, families: [String], size: CGFloat, weight: UIFont.Weight = .regular, kern: CGFloat = 0.0, paragraphStyle: NSParagraphStyle? = nil, fallback: String? = nil){
        let font = UIFont(families: families, size: size, weight: weight)
        var attributes = Dictionary<NSAttributedString.Key , Any>()
        attributes[NSAttributedString.Key.font] = font
        if kern > 0 {
            attributes[NSAttributedString.Key.kern] = kern
        }
        if paragraphStyle != nil {
            attributes[NSAttributedString.Key.paragraphStyle] = paragraphStyle
        }
        if fallback != nil {
            let languages = Locale.preferredLanguages
            if languages.contains(fallback!) {
                attributes[NSAttributedString.Key(rawValue: kCTLanguageAttributeName as String as String)] = fallback
            }
        }
        let attributedString = NSMutableAttributedString(string: text, attributes:attributes)
        
        self.init(attributedString: attributedString)
    }
}
