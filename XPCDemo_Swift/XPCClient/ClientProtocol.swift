//
//  ClientProtocol.swift
//  XPCDemo_Swift
//
//  Created by Retouch on 2019/5/16.
//  Copyright © 2019 v_jhuatang. All rights reserved.
//

import Foundation

@objc public protocol XPCClientProtocol {
    func acceptMessageFromService(msg: String)
}
