//
//  API Manager.swift
//  Clothing App
//
//  Created by Christopher Knauth on 5/16/17.
//  Copyright © 2017 Christopher Knauth. All rights reserved.
//

import Foundation

class APIManager{
    let baseURL = URL(string: "https://www.google.com/")
    
    func getShirts() {
        let session = URLSession.shared
        let url = baseURL?.appendingPathComponent("#q=Shirt")
        session.dataTask(with: url!) { data, response, error in
            guard error == nil else {
                return
            }
            do {
            let json = try JSONSerialization.jsonObject(with: data!, options:JSONSerialization.ReadingOptions.allowFragments)
            print(json)
            } catch {
                return
                }
            
            
            }.resume()
        
    }
    
    
    
}
