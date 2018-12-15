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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let text = "これは日本語文章と Roman Text の混植文章です。美しいヒラギノと San Francisco で日本語とローマ字を書きます。System Font のフォントメトリクスには独自の調整が入っています。\n\nあのイーハトーヴォの\nすきとおった風、\n夏でも底に冷たさをもつ青いそら、\nうつくしい森で飾られたモーリオ市、\n郊外のぎらぎらひかる草の波。\n祇辻飴葛蛸鯖鰯噌庖箸\n底辺直卿蝕薩化\nABCDEFGHIJKLM\nabcdefghijklm\n1234567890iClockᴹᴵᴺᴵClockªMINI"
        let fontSize: CGFloat = 22.0
        
        // 適当に行間を空ける処理
        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = fontSize * 1.5
        paragraphStyle.maximumLineHeight = paragraphStyle.minimumLineHeight
        
        let attributedString = NSMutableAttributedString(text: text, families: ["Lucida Grande", "Baskerville", "Apple SD Gothic Neo"], size: 18.0, weight: .light, kern: 4.0, paragraphStyle: paragraphStyle)
        self.label.attributedText = attributedString
        
        //let font = UIFont(families: ["Lucida Grande", "Baskerville", "Apple SD Gothic Neo"], size: 20, weight: .medium)
        //self.label.font = font
        //self.label.text = text
    }


}

