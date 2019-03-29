////
////  TestController.swift
////  Sync
////
////  Created by 纪东昂 on 24/03/2019.
////  Copyright © 2019 trying. All rights reserved.
////
//
//import UIKit
//class TestController: UIViewController, UITableViewDelegate,UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell:Filetablecell =   tableView.dequeueReusableCell(withIdentifier:"cell”) as! Filetablecell
//        
//        return cell
//    }
//    
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
//        self.tableView.tableFooterView = UIView()
//        
//    }
//}
