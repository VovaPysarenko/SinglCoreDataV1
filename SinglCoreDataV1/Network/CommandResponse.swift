//
//  CommandResponse.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 02.02.2022.
//

import UIKit

protocol JSONDeserializationProtocol{
    func deserealizeResponse(_ params: NSDictionary)
}

class CommandResponse: NSObject, JSONDeserializationProtocol {
    var msgId = 0
    var rVal = 0
    
    required override init() {
        super.init()
    }
    
    func deserealizeResponse(_ params: NSDictionary) {
        msgId = (params["msg_id"] as! NSNumber).intValue
        if let rVal = (params["rval"] as? NSNumber){
            self.rVal = rVal.intValue
        }
    }
}
