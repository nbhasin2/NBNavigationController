//
//  DictionaryExtension.swift
//  GobstonesSwift
//
//  Created by Nishant Bhasin on 2016-12-27.
//  Copyright © 2016 Nishant Bhasin. All rights reserved.
//

import Foundation

extension Dictionary {
    
    
    /// Returns a string representation of a dictionary as pretty printed JSON
    var jsonString: String {
        do
        {
            let stringData = try JSONSerialization.data(withJSONObject: self as AnyObject, options: .prettyPrinted)
            if let string = String(data: stringData, encoding: String.Encoding.utf8)
            {
                return string
            }
        }
        catch _ { }
        return ""
    }
    
    
    //  MARK: - Resolving Types
    
    /**
     Returns a integer value for the given key item pair in the dictionary.
     
     - parameter key: The key for the object you want to try and cast
     
     - returns: -1 if the item is not found or can't be casted to an integer
     */
    func intValue(_ key: Key) -> Int
    {
        return self[key] as? Int ?? -1
    }
    
    /**
     Returns a string value for the given key item pair in the dictionary.
     
     - parameter key: The key for the object you want to try and cast
     
     - returns: an empty string if the item is not found or can't be casted to an string
     */
    func stringValue(_ key: Key) -> String
    {
        return self[key] as? String ?? ""
    }
    
    /**
     Returns a Boolean value for the given key item pair in the dictionary.
     
     - parameter key: The key for the object you want to try and cast
     
     - returns: false if the item is not found or can't be casted to an Boolean
     */
    func boolValue(_ key: Key) -> Bool
    {
        return self[key] as? Bool ?? false
    }
    
    /**
     Returns a double value for the given key item pair in the dictionary.
     
     - parameter key: The key for the object you want to try and cast
     
     - returns: -1.0 if the item is not found or can't be casted to an double
     */
    func doubleValue(_ key: Key) -> Double
    {
        return self[key] as? Double ?? -1.0
    }
    
    /**
     Returns a double value for the given key item pair in the dictionary.
     
     - parameter key: The key for the object you want to try and cast
     
     - returns: -1.0 if the item is not found or can't be casted to an double
     */
    func floatValue(_ key: Key) -> Float
    {
        return self[key] as? Float ?? -1.0
    }
    
    /**
     Returns a dictionary value for the given key item pair in the dictionary.
     
     - parameter key: The key for the object you want to try and cast
     
     - returns: an empty dictionary if the item is not found or can't be casted to a dictionary with a string key
     */
    func dictionaryValue(_ key: Key) -> [String: AnyObject]
    {
        return self[key] as? [String: AnyObject] ?? [:]
    }
    
    /**
     Returns a array value for the given key item pair in the dictionary.
     
     - parameter key: The key for the object you want to try and cast
     
     - returns: an empty array of dictionaries if the item is not found or can't be casted to an array of dictionaries
     */
    func dictionaryArrayValue(_ key: Key) -> [[String: AnyObject]]
    {
        return self[key] as? [[String: AnyObject]] ?? [[:]]
    }
    
    /**
     Returns a array value for the given key item pair in the dictionary.
     
     - parameter key: The key for the object you want to try and cast
     
     - returns: an empty array of AnyObjects if the item is not found or can't be casted to an array of AnyObject
     */
    func arrayValue(_ key: Key) -> [AnyObject]
    {
        return self[key] as? [AnyObject] ?? []
    }
    
    //  MARK: - Optional Types
    
    /**
     Returns an NSDate value for the given key item pair iff the value can be casted to a string and converted to an NSDate
     using our ruby date converter.
     
     - parameter key: The key for the objec you want to try and cast and convert
     
     - returns: nil if the cast to string or date conversion failed
     */
    func dateValueOrNil(_ key: Key) -> Date?
    {
        if let dateString = self[key] as? String
        {
            return dateString.convertDateFromString() as Date?
        }
        
        return nil
    }
    
}
