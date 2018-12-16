//
//  ViewController.swift
//  fbCharmDemo
//
//  Created by pcjbird on 2018/12/15.
//  Copyright © 2018 Zero Status. All rights reserved.
//

import UIKit
import fbCharm

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var fallbackSwitch: UISwitch!
    @IBOutlet weak var paragraphSwitch: UISwitch!
    @IBOutlet weak var kernSwitch: UISwitch!
    @IBOutlet weak var fontweightSwitch: UISwitch!
    @IBOutlet weak var jpSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.updateText()
    }


    @IBAction func OnFallbackChanged(_ sender: Any) {
        self.updateText()
    }
    
    
    @IBAction func OnParagrahChanged(_ sender: Any) {
        if !paragraphSwitch.isOn {
            kernSwitch.isOn = false
            kernSwitch.isEnabled = false
            jpSwitch.isOn = false
            jpSwitch.isEnabled = false
        }
        else{
             kernSwitch.isEnabled = true
            jpSwitch.isEnabled = true
        }
        self.updateText()
    }
    
    @IBAction func OnKernChanged(_ sender: Any) {
        self.updateText()
    }
    
    @IBAction func OnFontWeightChanged(_ sender: Any) {
        self.updateText()
    }
    
    @IBAction func OnFallbackToJPChanged(_ sender: Any) {
        self.updateText()
    }
    
    func updateText() {
        let text = "これは日本語文章と Roman Text の混植文章です。美しいヒラギノと San Francisco で日本語とローマ字を書きます。System Font のフォントメトリクスには独自の調整が入っています。\n\n这是一段中文简体。\n這是一段中文繁體。\nうつくしい森で飾られたモーリオ市、\n郊外のぎらぎらひかる草の波。\n祇辻飴葛蛸鯖鰯噌庖箸\n底辺直卿蝕薩化\nABCDEFGHIJKLM\nabcdefghijklm\n1234567890\niClockᴹᴵᴺᴵ\nClockª"
        let fontSize: CGFloat = 18.0
        
        let bHeavy = fontweightSwitch.isOn
        let bParagragh = paragraphSwitch.isOn
        let bKern = kernSwitch.isOn
        let bFallback = fallbackSwitch.isOn
        let bJPFallback = jpSwitch.isOn
        
        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .justified
        paragraphStyle.minimumLineHeight = fontSize * 1.5
        paragraphStyle.maximumLineHeight = paragraphStyle.minimumLineHeight
        self.label.attributedText = NSMutableAttributedString(string: "")
        if !bFallback {
            if !bParagragh {
                self.label.font = UIFont(families: [], size: fontSize, weight: bHeavy ? .heavy : .regular)
                self.label.text = text
            }
            else{
                self.label.attributedText = NSMutableAttributedString(text: text, families: [], size: fontSize, weight: bHeavy ? .heavy : .regular, kern: bKern ? 4.0 : 0.0, paragraphStyle:paragraphStyle)
            }
        }
        else {
            if !bParagragh {
                self.label.font = UIFont(families: ["Lucida Grande", "Baskerville", "Apple SD Gothic Neo", "Wawati SC"], size: fontSize, weight: bHeavy ? .heavy : .regular)
                self.label.text = text
            }
            else{
                self.label.attributedText = NSMutableAttributedString(text: text, families: ["Lucida Grande", "Baskerville", "Apple SD Gothic Neo", "Wawati SC"], size: fontSize, weight: bHeavy ? .heavy : .regular, kern: bKern ? 4.0 : 0.0, paragraphStyle:paragraphStyle, fallback: bJPFallback ? "jp" : nil)
                
            }
        }
    }
}

