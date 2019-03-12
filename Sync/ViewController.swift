//
//  ViewController.swift
//  Sync
//
//  Created by 纪东昂 on 04/02/2019.
//  Copyright © 2019 trying. All rights reserved.
//

import UIKit
import CocoaAsyncSocket
import Alamofire


class ViewController: UIViewController, GCDAsyncSocketDelegate{
//    @IBOutlet var serverInput:UITextField!
    
    var clientsocket:GCDAsyncSocket?
    var serverSocket:GCDAsyncSocket?
    var acceptedServerSocket:GCDAsyncSocket?
    let serverPort:UInt16 = 80
    let serverAddress="127.0.0.1"
    
    
//    @IBAction func conBtnClick(sender:AnyObject){
//        do {
//
//
//            try clientsocket.connectedHost(serverInput.text! ,onPort:serverPort)
//        } catch  {
//            print("error")
//        }
//    }
//    @IBAction func btn_discon(sender:UIButton){
//        socket.disconnect()
//        print("手动断开")
//    }
   


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        clientsocket=GCDAsyncSocket(delegate: self, delegateQueue: DispatchQueue.main)
//        serverSocket=GCDAsyncSocket(delegate: self, delegateQueue: DispatchQueue.main)
//        do {
//            try serverSocket?.accept(onPort: serverPort)
//        } catch  {
//            print("error1")
//        }
//        do {
//            try clientsocket?.connect(toHost: "127.0.0.1", onPort: serverPort)
//            print("connect to server")
//            var msg="test if i can write data into server"
//            let data=Data(msg.utf8)
//            clientsocket?.write(data, withTimeout: -1, tag: 0)
//            var mes=clientsocket?.readStream()
//            print(mes)
//        } catch  {
//            print("error2")
//        }
       
        AF.request("http:127.0.0.1").responseString{ response in
            print(response)
            print(response.request!)
            print(response.response!)
            print(response.result)
            print(response.data!)
            if let data=response.data, let uft8Text=String(data:data,encoding: .utf8){
                print(uft8Text)
            }
            
        }
//        let fileURL=Bundle.main.url(forResource: "ServerViewController", withExtension: "swift")
//        let fileString="/Sync/ServerViewCon"
//        if FileManager.default.fileExists(atPath: fileString!){
//            print("found")
//        }else{print("error")}
//        AF.upload(fileURL!, to: "http://127.0.0.1").responseJSON{response in
//            debugPrint(response)
//        }
    }
//    func onSocket(sock:GCDAsyncSocket!,didConnectToHost host:String!,port:UInt16){
//        print("has connect")
//    }
//    
//    func onSocket(sock:GCDAsyncSocket!,didReadData data:NSData!,withTag tag:Int){
//        print("has receive")
//        print("data:\(data.length)")
//        socket.readData(withTimeout: 10, tag: 0)
//    }
//    func onSocketDidDisconnect(sock:GCDAsyncSocket!){
//        print("has disconnect")
//    }
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
    
}

