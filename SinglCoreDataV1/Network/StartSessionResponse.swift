//
//  StartSessionResponse.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 02.02.2022.
//
import UIKit

class StartSessionResponse: CommandResponse {
    var sessionToken = -1
    
    override func deserealizeResponse(_ params: NSDictionary) {
        super.deserealizeResponse(params)
        if let token = params["param"] as? NSNumber{
            sessionToken = token.intValue
        }
    }
}
