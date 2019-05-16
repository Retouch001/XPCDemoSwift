//
//  main.swift
//  XPCService
//
//  Created by Retouch on 2019/5/14.
//  Copyright © 2019 v_jhuatang. All rights reserved.
//

import Foundation

let delegate = XPCServiceDelegate()
let listener = NSXPCListener.service()
listener.delegate = delegate
listener.resume()
