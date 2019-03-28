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
        AF.request(url, method: .post, parameters: para, encoding: URLEncoding.default, headers: nil, interceptor: nil).response{
            response in
            if let data=response.data, let uft8Text=String(data:data,encoding: .utf8){
                if uft8Text=="true"{
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
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        AF.request("http:127.0.0.1:8080/Sync/Login").responseString{ response in
//            print(response)
////            print(response.request!)
////            print(response.response!)
////            print(response.result)
////            print(response.data!)
////            if let data=response.data, let uft8Text=String(data:data,encoding: .utf8){
////                print(uft8Text)
////            }
//
//        }
//        let fileURL=Bundle.main.url(forResource: "test", withExtension: "txt")
//        print(fileURL)
//        let fileString=fileURL?.path
//        if FileManager.default.fileExists(atPath: fileString!){
//            print("found")
//        }else{print("error")}
        let homePath = NSHomeDirectory()
        print(homePath+"current path")
//        let fileURL=homePath+"/documents" as URL
//        let request=AF.upload(fileURL, to: uploadURL).responseJSON {
//            response in
//            debugPrint(response)
//        }


//        let paths=NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
//        var path=paths.first
//        print("documents path:"+path!)
////        let path=FileManager
//        let path1=NSHomeDirectory()
//        print(path1)
//        let path2=FileManager.default.url(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask, appropriateFor: nil, create: false)
//        print(path2)


//        photoLib()   //call photolibrary
        
//        var para = []
//        para["id"] = "CodingFire"
//        para["passWord"] = "1234567890"
        
//        let user = "user"
//        let password = "password"
//        let para : [String:Any]=["username":"mark","password":"mark"]
////        AF.request("https://httpbin.org/basic-auth/\(user)/\(password)")
////            .authenticate(user: user, password: password)
////            .responseJSON { response in
////                debugPrint(response)
////        }
////        AF.request(url, method: .post, parameters: para)
//        AF.request(url, method: .post, parameters: para, encoding: URLEncoding.default, headers: nil, interceptor: nil)

    
    }
    func photoLib(){
        print("call photolib")

        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            print("call this123")
            let picker=UIImagePickerController()
            picker.delegate=self
            picker.sourceType = .photoLibrary
            self.present(picker, animated: true, completion: {() -> Void in})
        }
        else{
            print("can not access photo")
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        guard let jpegData=pickedImage.jpegData(compressionQuality: 0.5) else {
            return
        }
        self.uploadImage(imageData: jpegData)
        self.dismiss(animated: true, completion: nil)
    }
    func uploadImage(imageData:Data){
        
        print("12")
    


  
    }

}

