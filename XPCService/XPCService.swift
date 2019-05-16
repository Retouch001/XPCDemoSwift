//
//  XPCService.swift
//  XPCService
//
//  Created by Retouch on 2019/5/14.
//  Copyright © 2019 v_jhuatang. All rights reserved.
//

import Foundation

class XPCService: NSObject, XPCServiceProtocol {
    weak var connection: NSXPCConnection?

    func sayHello(name: String, complete: @escaping () -> Void) {
        print("Hello World \(name)")
        (connection?.remoteObjectProxy as? XPCClientProtocol)?.acceptMessageFromService(msg: "I LOVE YOU!!!!")
        complete()
    }
    
    func closeXpc() {
        CFRunLoopStop(CFRunLoopGetMain());
        exit(0);
    }
    
}
