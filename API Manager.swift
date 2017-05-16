//
//  API Manager.swift
//  Clothing App
//
//  Created by Christopher Knauth on 5/16/17.
//  Copyright © 2017 Christopher Knauth. All rights reserved.
//

import Foundation

class APIManager{
    let baseURL = URL(string: "https://www.google.com/")!

    func urlRequest(with components: String...) -> URLRequest {
        var url = baseURL
        for component in components {
            url.appendPathComponent(component)
        }
        return URLRequest(url: url)
    }
}
