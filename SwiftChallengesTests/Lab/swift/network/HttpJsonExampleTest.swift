//
//  HttpJsonExampleTest.swift
//  SwiftCodesTests
//
//  Copyright © 2020 kylelearnedthis. All rights reserved.
//

import XCTest

@available(OSX 10.15, *)
class HttpJsonExampleTest: XCTestCase {

    func testBasic() {
        let x = HttpJsonExample()
        x.getJson(urlString: "https://jsonplaceholder.typicode.com/posts")
    }
    
    //Replace [KEY] with your own Pixabay Key
    func testPixabayImageJson() {
        let x = HttpJsonExample()
        let key = "HELLO"
        let httpGetString = "https://pixabay.com/api/?key=\(key)&q=Glacier&safesearch=true&per_page=5"
        let result: [PixabayImage] = x.getPixabayImages(urlString: httpGetString).hits
        print("===== \(result[0].tags) =====")
    }

}
