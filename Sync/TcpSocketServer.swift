////
////  tcpserver.swift
////  Sync
////
////  Created by 纪东昂 on 10/03/2019.
////  Copyright © 2019 trying. All rights reserved.
////
//
//import Foundation
//import CocoaAsyncSocket
//
//class TcpSocketServer:GCDAsyncSocket {
//    
//    static let INSTANCE = TcpSocketServer()
//    
//    typealias serverCallBack = (_ success:Bool, _ error:NSError?, _ data:AnyObject?)->()
//    
//    let port:UInt16 = 9001
//    
//    // tcp client array
//    var clients = Array<GCDAsyncSocket>()
//    
//    func startServer()->Bool{
//        do{
//            self.setDelegate(self, delegateQueue: DispatchQueue.global())
//            try accept(onPort: self.port)
//        }catch{
//            print("tcp server accept on port error")
//            print(error)
//            return false
//        }
//        return true
//    }
//    
//    func receieve(data:String!){
//        dispatch_async(DispatchQueue.global(), {()->Void in
//            print(data)
//            TcpSocketServer.INSTANCE.sendAll(data: "this is server "){(success,error,data) in
//                
//            }
//        })
//    }
//    
//    func sendAll(data:String!,callBack:serverCallBack?){
//        DispatchQueue.async(group: DispatchQueue.global(), execute: {()->Void in
//            let result = data.data(usingEncoding: NSUTF8StringEncoding)
//            print("send msg=")
//            print(result)
//            for client in self.clients{
//                client.writeData(result!, withTimeout: -1, tag: 1)
//            }
//            if callBack == nil{
//                return
//            }
//            dispatch_async(dispatch_get_main_queue(), {()->Void in
//                let success:Bool = true
//                callBack!(success:success, error:nil,data:nil)
//            })
//        })
//    }
//}
//
//extension TcpSocketServer: GCDAsyncSocketDelegate{
//    func socket(sock: GCDAsyncSocket, didAcceptNewSocket newSocket: GCDAsyncSocket) {
//        //这里sock指服务器的socket，newSocket指客户端的Socket，
//        print("[client %s:%d connect server]", newSocket.connectedHost,newSocket.connectedPort)
//        //保存客户端的Socket，不然刚连接成功就会自动关闭
//        self.clients.append(newSocket)
//        //sock只负责连接服务器，newSocket设置成-1,表示一直保持连接
//        newSocket.readData(withTimeout: -1, tag: 100)
//    }
//    func socket(client: GCDAsyncSocket, didReadData data: NSData, withTag tag: Int)
//    {
//        print("[recieve client %s:%d message]",client.connectedHost,client.connectedPort)
//        var receieveStr:String = (NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue))! as String
//        //去除换行符、回车符1
//        receieveStr = receieveStr.stri//receieveStr.stringByReplacingOccurrencesOfString("\r", withString: "")
//        receieveStr = receieveStr.stringByReplacingOccurrencesOfString("\r", withString: "")
//        // 结束删除客户端
//        if receieveStr.compare("quit") == ComparisonResult.orderedSame {
//            client.disconnect()
//            let len = self.clients.count
//            for i in 0..<len{
//                if self.clients[i].connectedUrl == client.connectedUrl{
//                    self.clients.removeAtIndex(i)
//                }
//            }
//        }
//        self.receieve(data: receieveStr)
//    }
//    func socket(client: GCDAsyncSocket, didWriteDataWithTag tag: Int) {
//        print("[send client %s:%d message]",client.connectedHost,client.connectedPort)
//        //服务器每次写数据之前都需要读取一次数据，之后才可以返回数据
//        client.readDataWithTimeout(-1, tag: 100)
//    }
//    func socketDidDisconnect(sock: GCDAsyncSocket, withError err: NSError?){
//        if ((err) != nil) {
//            printLog("断开连接失败")
//            return
//        }
//        print("%s:%d 断开连接",sock.connectedHost,sock.connectedPort)
//        
//    }
//}
