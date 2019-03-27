//
//  FileViewController.swift
//  Sync
//
//  Created by 纪东昂 on 24/03/2019.
//  Copyright © 2019 trying. All rights reserved.
//

import UIKit
import Alamofire

class FileViewController: UITableViewController {
    var userArr:Array<AnyObject> = []
    let url="http://127.0.0.1:8080/Sync/Listfile"
    var para:Parameters=["createuser":Usermodel.Variables.username]
    func loadTableViewData() {
        AF.request(url, method: .post, parameters: para, encoding: URLEncoding.default, headers: nil, interceptor: nil).responseJSON {
            response in
            print(response)
            
//            let dict = response.data as? Dictionary<String,Any>
//            let fileid = dict!["fileid"] as! String
//            print(fileid)
            if let data=response.data,let uft8Text=String(data:data,encoding: .utf8){
                print(uft8Text)
               }
//            for dict in (response.data!){
//                print(dict[""])
//            }
            
//            switch response.result {
//            case .success(let data):
//                print(data)
//                print("\(type(of: data))")
////                if let value = response.result.value as? Dictionary<String,Any>{
////                    success(value as NSDictionary)
////                }
////            for i in 0..<data.count {
////                let dict = json[i] as! Dictionary<String,AnyObject>
////                let table_name = dict["table_name"] as! String
////                var array = [String]()
////                array.append(table_name)
////                print("\(array)")
////                }
//            case .failure(let error):
//                print("\(error)")
//            }
            
            }
        }
        
        //stuArr = []
//        for dict in (resultDataArr)! {
//            let mymodel = StudentModel(stuid: dict["stuid"] as! String,password: dict["password"] as! String, stuname: dict["stuname"] as! String, sex: dict["sex"] as! String, dob: dict["dob"] as! String, degree: dict["degree"] as! String,classroom: dict["classroom"] as! String, grade: dict["grade"] as! String, department: dict["department"] as! String)
//            stuArr.append(mymodel)
//            
//            
//        }
//        tableView.reloadData()
    

    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//
//        // 给cell赋值
//        if self.userArr.count > 0 {
//            //创建一个StudentModel类型的model对象，并且给model对象赋值为数据源的当前行下标的值数据
//            let model:Usermodel = userArr[indexPath.row] as! Usermodel
//            //cell的大标题和副标题分别赋值为model的idNum和stuName属性
//
//
//            //cell.textLabel?.text = "学号 "+model.stuid+" 姓名 "+model.stuname+" 性别 "+model.sex
//           // cell.detailTextLabel?.text = "出生日期 "+model.dob+" 学位 "+model.degree
////            let clabel=tableView.viewWithTag(1) as! UILabel
////            clabel.text="班级 "+model.classroom+" 年级 "+model.grade+" 学院 "+model.department
//
//        }
//        return cell //要改
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTableViewData()
    }
}
