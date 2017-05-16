//
//  API Manager.swift
//  Clothing App
//
//  Created by Christopher Knauth on 5/16/17.
//  Copyright © 2017 Christopher Knauth. All rights reserved.
//

import Foundation

class APIManager{
    let baseURL = URL(string: "https://www.google.com/search")!

    func urlRequest(with components: String...) -> URLRequest {
        var url = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        var queryItems = [URLQueryItem]()
        for component in components {
            queryItems.append(URLQueryItem(name: "q", value: component))
            }
        queryItems.append(URLQueryItem(name: "tbm", value: "shop"))
        url?.queryItems = queryItems
        return URLRequest(url: url!.url!)
    }
}
