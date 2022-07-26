//
//  CommandUtils.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 02.02.2022.
//

import Foundation

struct CommandUtils {
    
    private static let classNameForRequest = [
        257:"StartSessionResponse"
    ]
    
    
    static func fromData(data: Data) -> JSONDeserializationProtocol? {
        
        if var jsonString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
            jsonString = jsonString.replacingOccurrences(of: "{}", with: "") as NSString
            jsonString = jsonString.replacingOccurrences(of: "{]}", with: "]}") as NSString
            print("\(jsonString)")
            
            
            //let jsonDict = self.convertToDictionary(text: jsonString as String)
            //print(jsonDict as Any)
            
        }
            
        return nil
    }
    
    static func toData(request: JSONSerializationProtocol) -> Data? {
        let serializedRequest = request.serializeRequest()
        if JSONSerialization.isValidJSONObject(serializedRequest){
            do{
                let data = try JSONSerialization.data(withJSONObject: serializedRequest, options: JSONSerialization.WritingOptions.init(rawValue: 0))
                return data
            }catch let parserError{
                print(parserError)
            }
        }
        
        return nil
    }
}
