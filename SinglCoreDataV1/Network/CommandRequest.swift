//
//  CommandRequest.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 02.02.2022.
//

import UIKit

protocol JSONSerializationProtocol {
    func serializeRequest() -> NSDictionary
}

class CommandRequest: NSObject, JSONSerializationProtocol {
    var msgId = -1
    var sessionToken = -1
    
    func serializeRequest() -> NSDictionary {
        return ["msg_id": msgId, "token": sessionToken]
    }
}
