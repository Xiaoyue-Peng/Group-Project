//
//  EditController.swift
//  Sync
//
//  Created by 纪东昂 on 28/03/2019.
//  Copyright © 2019 trying. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper
import Just
import Alamofire

class EditController: ViewController,UITextViewDelegate {
    
    var fileid:String?
    var fileinitid:String?
    var mdcontent=""
    let url2="http://127.0.0.1:8080/Sync/Getfile"
    
    
    
    var dataArray2:Array<Filemodel> = []
    
    @IBOutlet weak var content: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTableViewData()
        content.delegate = self
        content.font = UIFont.systemFont(ofSize: 28);
        content.text=dataArray2[0].content
        content.isEditable = true
    }
    
    func loadTableViewData() {
        var para:Parameters=["fileinitid":fileinitid!]
        var r=Just.get(url2,params: para)
        print(r.text)
        dataArray2=Mapper<Filemodel>().mapArray(JSONArray: r.json as! [[String : Any]])
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        //开始编辑时候出发
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        //结束编辑时候出发
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return true //如果返回false，文本视图不能编辑
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        return true //如果返回false，表示编辑结束之后，文本视图不可再编辑
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        //文本视图内容改变时，触发本方法,如果是回车符号，则textView释放第一响应值，返回false
        if (text ==  "\n") {
            content.resignFirstResponder()
            return false;
        }
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        mdcontent=content.text
        print(mdcontent)
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        //文本视图 改变选择内容，触发本代理方法
    }
    
    
    @IBAction func save(_ sender: Any) {
        var para:Parameters=["fileinitid":fileinitid!]
        
        var r=Just.get(url2,params: para)
        print(r.text)
        var datatemp=Mapper<Filemodel>().mapArray(JSONArray: r.json as! [[String : Any]])
        //var mever=dataArray2[0].preversion
        var itsver=Int(datatemp[0].preversion!)
        var mever=Int(dataArray2[0].preversion!)!+1
        if mever > itsver!{
            let alertViewController=UIAlertController(title: "success", message: "save successfully", preferredStyle: .alert)
            alertViewController.addAction(UIAlertAction(title: "OK", style: .default, handler:{action in print("on action")}))
            self.present(alertViewController, animated: true, completion: nil)
            let now=Date()
            let timeInterval:TimeInterval=now.timeIntervalSince1970
            var timestamp=Int(timeInterval)
            //var meverr=mever-1
            var uppara:Parameters=["fileinitid":fileinitid!,"content":mdcontent,"preversion":mever,"updateuser":Usermodel.Variables.username,"updatetime":timestamp,"createuser":dataArray2[0].createuser!,"createtime":dataArray2[0].createtime!,"filename":dataArray2[0].filename as String? ]
            Just.get("http://127.0.0.1:8080/Sync/Update",params: uppara)
        }else{
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "compare") as! UIViewController
            self.navigationController?.pushViewController(vc, animated: true)
            Vmodel.Variables.fileid=dataArray2[0].fileid!
            Vmodel.Variables.fileinitid=dataArray2[0].fileinitid!
            Vmodel.Variables.preversion=String(mever)
            Vmodel.Variables.content=mdcontent
        }
        
    }
    
    
    
    
    
    
    
}
