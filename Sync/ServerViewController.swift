////
////  ServerViewController.swift
////  Sync
////
////  Created by 纪东昂 on 10/03/2019.
////  Copyright © 2019 trying. All rights reserved.
////
//
//import Foundation
//import UIKit
//import CocoaAsyncSocket
//
//class ServerViewController: UIViewController {
//    //端口
//    @IBOutlet weak var portTF: UITextField!
//
//    //消息
//    @IBOutlet weak var msgTF: UITextField!
//
//    //信息显示
//    @IBOutlet weak var infoTV: UITextView!
//
//    //服务端和客户端的socket引用
//    var serverSocket: GCDAsyncSocket?
//    var clientSocket: GCDAsyncSocket?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//
//    //对InfoTextView添加提示内容
//    func addText(text: String) {
//        infoTV.text = infoTV.text.stringByAppendingFormat("%@\n", text)
//    }
//
//    ///监听
//    @IBAction func listeningAct(sender: AnyObject) {
//
//        serverSocket = GCDAsyncSocket(delegate: self, delegateQueue: dispatch_get_main_queue())
//
//        do {
//            try serverSocket?.acceptOnPort(UInt16(portTF.text!)!)
//            addText("监听成功")
//        }catch _ {
//            addText("监听失败")
//        }
//
//    }
//
//    ///发送
//    @IBAction func sendAct(sender: AnyObject) {
//        let data = msgTF.text?.dataUsingEncoding(NSUTF8StringEncoding)
//        //向客户端写入信息   Timeout设置为 -1 则不会超时, tag作为两边一样的标示
//        clientSocket?.writeData(data, withTimeout: -1, tag: 0)
//    }
//
//}
//
//extension ServerViewController: GCDAsyncSocketDelegate {
//
//    //当接收到新的Socket连接时执行
//    func socket(sock: GCDAsyncSocket!, didAcceptNewSocket newSocket: GCDAsyncSocket!) {
//
//        addText("连接成功")
//        addText("连接地址" + newSocket.connectedHost)
//        addText("端口号" + String(newSocket.connectedPort))
//        clientSocket = newSocket
//
//        //第一次开始读取Data
//        clientSocket!.readDataWithTimeout(-1, tag: 0)
//    }
//
//    func socket(sock: GCDAsyncSocket!, didReadData data: NSData!, withTag tag: Int) {
//        let message = String(data: data,encoding: NSUTF8StringEncoding)
//        addText(message!)
//        //再次准备读取Data,以此来循环读取Data
//        sock.readDataWithTimeout(-1, tag: 0)
//    }
//
//}
