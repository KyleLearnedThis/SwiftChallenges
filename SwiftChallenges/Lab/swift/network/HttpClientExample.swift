//
//  HttpClientExample.swift
//  SwiftCodes
//
//  Copyright © 2020 kylelearnedthis. All rights reserved.
//

import Foundation

class HttpClientExample {
    static func get(url: String) {
        let url = URL(string: url)!
        let semaphore = DispatchSemaphore(value: 0)
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
    }
}
