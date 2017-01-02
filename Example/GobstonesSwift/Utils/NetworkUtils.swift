//
//  NetworkUtils.swift
//  GobstonesSwift
//
//  Created by Nishant Bhasin on 2016-12-21.
//  Copyright © 2016 Nishant Bhasin. All rights reserved.
//

import Foundation
import UIKit

enum JSONError: String, Error {
    case NoData = "ERROR: no data"
    case ConversionFailed = "ERROR: conversion from JSON failed"
}

class NetworkUtils {
    
//    func fetchRandomGif(completion: (_ label: UILabel) -> ()) {
//     
//    }
    
    func fetchRandomGif(completion: @escaping (_ gifUrl: String) -> Void) {
        let urlPath = "http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC"
        guard let endpoint = URL(string: urlPath) else {
            print("Error creating endpoint")
            return
        }
        
        let request = URLRequest(url: endpoint)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                guard let data = data else {
                    throw JSONError.NoData
                }
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? Dictionary<String, Any> else {
                    throw JSONError.ConversionFailed
                    
                }
                
                print(json.dictionaryValue("data").stringValue("image_original_url"))
                completion(json.dictionaryValue("data").stringValue("image_original_url"))
                
            } catch let error as JSONError {
                print(error.rawValue)
            } catch let error as NSError {
                print(error.debugDescription)
            }
            }.resume()
    }
}
