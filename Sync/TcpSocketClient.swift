////
////  TcpSocketClient.swift
////  Sync
////
////  Created by 纪东昂 on 10/03/2019.
////  Copyright © 2019 trying. All rights reserved.
////
//
//import Foundation
//
//class TcpSocketClient:GCDAsyncSocket {
//    
//    static let INSTANCE = TcpSocketClient()
//    
//    typealias clientCallBack = (success:Bool, error:NSError?, data:AnyObject?)->()
//    
//    func receieve(data:String!){
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {()->Void in
//            print(data)
//            let t = "this is client"
//            TcpSocketClient.INSTANCE.send(t){(success,error,data) in
//            }
//        })
//    }
//    
//    func send(data:String!,callBack:clientCallBack?){
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {()->Void in
//            let result = data.dataUsingEncoding(NSUTF8StringEncoding)
//            self.writeData(result!, withTimeout: -1, tag: 1)
//            if callBack == nil{
//                return
//            }
//            dispatch_async(dispatch_get_main_queue(), {()->Void in
//                let success:Bool = true
//                callBack!(success:success, error:nil,data:nil)
//            })
//        })
//    }
//    
//    func connect(host:String,port:UInt16)->Bool{
//        self.setDelegate(self, delegateQueue: dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0))
//        do{
//            try self.connectToHost(host, onPort: port)
//        }catch {
//            print("connect %s:%d fail ",host,port)
//            print(error)
//            return false
//        }
//        return true
//    }
//}
//
//
//extension TcpSocketClient: GCDAsyncSocketDelegate{
//    
//    func socket(client: GCDAsyncSocket, didReadData data: NSData, withTag tag: Int)
//    {
//        print("[recieve server %s:%d message]",client.connectedHost,client.connectedPort)
//        var receieveStr:String = (NSString(data:data,encoding: NSUTF8StringEncoding))! as String
//        //去除换行符、回车符
//        receieveStr = receieveStr.stringByReplacingOccurrencesOfString("\r", withString: "")
//        receieveStr = receieveStr.stringByReplacingOccurrencesOfString("\r", withString: "")
//        // 结束删除客户端
//        if receieveStr.compare("quit") == NSComparisonResult.OrderedSame {
//            client.disconnect()
//        }
//        self.receieve(receieveStr)
//    }
//    func socket(client: GCDAsyncSocket, didWriteDataWithTag tag: Int) {
//        print("[send server %s:%d message]",client.connectedHost,client.connectedPort)
//        //服务器每次写数据之前都需要读取一次数据，之后才可以返回数据
//        client.readDataWithTimeout(-1, tag: 100)
//    }
//    func socket(sock: GCDAsyncSocket, didConnectToHost host: String, port: UInt16) {
//        print("[connect server %s:%d success]",sock.connectedHost,sock.connectedPort)
//    }
//    func socketDidDisconnect(sock: GCDAsyncSocket, withError err: NSError?){
//        if ((err) != nil) {
//            print("%s:%d 断开连接失败",sock.connectedHost,sock.connectedPort)
//            return
//        }
//        print("%s:%d 断开连接",sock.connectedHost,sock.connectedPort)
//        
//    }
//}
