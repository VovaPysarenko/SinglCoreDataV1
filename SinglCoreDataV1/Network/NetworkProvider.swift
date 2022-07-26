//
//  NetworkProvider.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 28.01.2022.
//

import Foundation


//func send(request: NetworkRequest){
//    let serializedRequest = request.serializeRequest()
//    CrashReport.write(string: serializedRequest.description)
//    if JSONSerialization.isValidJSONObject(serializedRequest){
//        do{
//            let data = try JSONSerialization.data(withJSONObject: serializedRequest, options: JSONSerialization.WritingOptions.init(rawValue: 0))
//            print("sending -----------  \(serializedRequest)")
//            network.send(data: data, using: channel)
//        }catch let parserError{
//            print(parserError)
//        }
//    }
//}


//@objc func sendRequest(_ request: NetworkRequest){
//    if !isConnected && useWifi{
//        socketConnection.initiateConnection()
//        isConnected = true
//    }
//    let serializedRequest = request.serializeRequest()
//    CrashReport.write(string: serializedRequest.description)
//    if JSONSerialization.isValidJSONObject(serializedRequest){
//        do{
//            let data = try JSONSerialization.data(withJSONObject: serializedRequest, options: JSONSerialization.WritingOptions.init(rawValue: 0))
//            print("sending =========\(serializedRequest)")
//            //                print(NSString(data: data, encoding: NSUTF8StringEncoding)!)
//            if useWifi {
//                socketConnection.writeData(data)
//            }else{
//                bleConnection.send(data)
//            }
//        }catch let parserError{
//            print(parserError)
//        }
//    }
//}

//protocol JSONDeserializationProtocol{
//    func deserealizeResponse(_ params: NSDictionary)
//}
//
//class CommandResponse: NSObject, JSONDeserializationProtocol {
//    var msgId = 0
//    var rVal = 0
//    
//    required override init() {
//        super.init()
//    }
//    
//    func deserealizeResponse(_ params: NSDictionary) {
//        msgId = (params["msg_id"] as! NSNumber).intValue
//        if let rVal = (params["rval"] as? NSNumber){
//            self.rVal = rVal.intValue
//        }
//    }
//}
//
//protocol JSONSerializationProtocol{
//    func serializeRequest() -> NSDictionary
//}
//
//class CommandRequest: NSObject, JSONSerializationProtocol {
//    var msgId = -1
//    var sessionToken = -1
//    
//    func serializeRequest() -> NSDictionary {
//        return ["msg_id": msgId, "token": sessionToken]
//    }
//}
//
//func toData(request: JSONSerializationProtocol) -> Data? {
//    let serializedRequest = request.serializeRequest()
//    if JSONSerialization.isValidJSONObject(serializedRequest){
//        do{
//            let data = try JSONSerialization.data(withJSONObject: serializedRequest, options: JSONSerialization.WritingOptions.init(rawValue: 0))
//            return data
//        }catch let parserError{
//            print(parserError)
//        }
//    }
//    
//    return nil
//}
