//
//  ClientManager.swift
//  XPCDemo_Swift
//
//  Created by Retouch on 2019/5/14.
//  Copyright © 2019 v_jhuatang. All rights reserved.
//

import Foundation
import XPCService



class ClientManager: XPCClientProtocol {
    static let `default` = ClientManager()
    
    private lazy var xpcConnection: NSXPCConnection = {
        let conneciton = NSXPCConnection(serviceName: "com.tencent.XPCDemo-Swift.XPCService")
        conneciton.remoteObjectInterface = NSXPCInterface(with: XPCServiceProtocol.self)
        conneciton.resume()
        
        conneciton.exportedInterface = NSXPCInterface(with: XPCClientProtocol.self)
        conneciton.exportedObject = self
        
        return conneciton
    }()
    
    var xpcRemoteProxy: XPCServiceProtocol?
    
    //单列的严谨写法，防止使用init初始化
    private init() {}
    
    func test() {
        xpcRemoteProxy = xpcConnection.remoteObjectProxyWithErrorHandler {
            print("remote object proxy error:\($0)")
        } as? XPCServiceProtocol
        
        if let xpcRemoteProxy = xpcRemoteProxy {
            xpcRemoteProxy.sayHello(name: "Retouch001") {
                self.closeXpc()
            }
        }
    }
    
    func closeXpc() {
        xpcRemoteProxy?.closeXpc()
    }
    
    //MARK: ClientProtocol Method
    func acceptMessageFromService(msg: String) {
        print("accept message from service: \(msg)")
    }
    
}
