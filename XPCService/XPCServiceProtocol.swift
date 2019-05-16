//
//  XPCServiceProtocol.swift
//  XPCService
//
//  Created by Retouch on 2019/5/14.
//  Copyright © 2019 v_jhuatang. All rights reserved.
//

import Foundation

@objc(XPCServiceProtocol) public protocol XPCServiceProtocol {
    func sayHello(name: String, complete: @escaping () -> Void)
    func closeXpc()
}
