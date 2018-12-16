//
//  NextViewController.swift
//  fbCharmDemo
//
//  Created by pcjbird on 2018/12/16.
//  Copyright © 2018 Zero Status. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.label1.font = UIFont.init(families: ["IBM Plex Sans", "Wawati SC"], size: 24, weight: .regular)
        self.label2.font = UIFont.init(families: [UIFont.systemFont(ofSize: 24).familyName, "Lucida Grande"], size: 24, weight: .regular)
    }
    

    @IBAction func OnCloseBtnClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
