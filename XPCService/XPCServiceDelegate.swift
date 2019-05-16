//
//  XPCServiceDelegate.swift
//  XPCService
//
//  Created by Retouch on 2019/5/14.
//  Copyright © 2019 v_jhuatang. All rights reserved.
//

import Foundation

class XPCServiceDelegate: NSObject, NSXPCListenerDelegate {
    
    func listener(_ listener: NSXPCListener, shouldAcceptNewConnection newConnection: NSXPCConnection) -> Bool {
        let exportedObject = XPCService()
        exportedObject.connection = newConnection
        
        newConnection.exportedInterface = NSXPCInterface(with: XPCServiceProtocol.self)
        newConnection.remoteObjectInterface = NSXPCInterface(with: XPCClientProtocol.self)

        newConnection.exportedObject = exportedObject
        
        newConnection.resume()
        return true
    }
}
