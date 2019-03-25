//
//  TestController.swift
//  Sync
//
//  Created by 纪东昂 on 24/03/2019.
//  Copyright © 2019 trying. All rights reserved.
//

import UIKit
class TestController: ViewController {
    @IBOutlet var userlabel:UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userlabel?.text=Usermodel.Variables.username
    }
}
