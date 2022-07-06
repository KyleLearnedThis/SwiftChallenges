//
//  TinyURL.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 6/30/22.
//  https://leetcode.com/problems/encode-and-decode-tinyurl/

import Foundation

class TinyURL {
    var baseURL = "http://tinyurl.com"
    var map = [String:String]()

    // Encodes a URL to a shortened URL.
    func encode(_ longUrl: String) -> String {
        var id = UUID().uuidString
        if !map[id, default: ""].isEmpty {
            id = UUID().uuidString
        }
        map[id] = longUrl
        return "\(baseURL)/\(id)"
    }

    // Decodes a shortened URL to its original URL.
    func decode(_ shortUrl: String) -> String {
        let lastPart = shortUrl.split(separator: "/").last!
        let shortId = String(lastPart)
        let result = map[shortId, default:  ""]
        return result
    }

    let base62chars = [Character]("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz")
    let maxBase : UInt32 = 62

    private func hash(withBase base: UInt32 = 62, length: Int) -> String {
        var code = ""
        for _ in 0..<length {
            let random = Int(arc4random_uniform(min(base, maxBase)))
            code.append(base62chars[random])
        }
        return code
    }

    func encode(_ longUrl: String, _ length: Int) -> String {
        var id = hash(withBase: maxBase, length: length)
        if !map[id, default: ""].isEmpty {
            id = hash(withBase: maxBase, length: length)
        }
        map[id] = longUrl
        return "\(baseURL)/\(id)"
    }
}
