//
//  ViewController.swift
//  Sync
//
//  Created by 纪东昂 on 13/03/2019.
//  Copyright © 2019 trying. All rights reserved.
//

import UIKit
import Alamofire
//import SwiftyJSON
import Just

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let url="http://127.0.0.1:8080/Sync/Login"

    @IBOutlet var username:UITextField?
    @IBOutlet var password:UITextField?
    var userName=""
    var passWord = ""
    @IBAction func login() {
        self.userName=username?.text! ?? ""
        self.passWord=password?.text! ?? ""
        var para:Parameters=["username":userName,"password":passWord]

        var r=Just.get("http://127.0.0.1:8080/Sync/Login",params:para)
        print(r.text)
        if r.text=="true"{
            Usermodel.Variables.username=self.userName
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "file") as! UITableViewController
            self.navigationController?.pushViewController(vc, animated: true)
            
        }else{
            let alertViewController=UIAlertController(title: "error", message: "wrong password", preferredStyle: .alert)
            alertViewController.addAction(UIAlertAction(title: "OK", style: .default, handler:{action in print("on action")}))
            self.present(alertViewController, animated: true, completion: nil)
        }

        
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        print("call view controller")




    
    }
    
    

}

