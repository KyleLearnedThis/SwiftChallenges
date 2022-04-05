//
//  FileOpener.swift
//  SwiftCodes
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//

import Foundation

public class FileOpener {
    public func openHomeFile(inputDirectory: String, fileName: String) -> String {
        var input = ""
        let x = fileName.components(separatedBy: ".")
        let home = FileManager.default.homeDirectoryForCurrentUser
        let url = home.appendingPathComponent(inputDirectory)
            .appendingPathComponent(x[0])
            .appendingPathExtension(x[1])
        do {
            input = try String(contentsOf: url, encoding: .utf8)
            print("===== input: \(input)=====")
        } catch {
            print("open file: \(fileName) failed")
        }
        return input
    }

    public func parseGraphJsonFile(inputDirectory: String, fileName: String) {
        let inputString = openHomeFile(inputDirectory: inputDirectory, fileName: fileName)
        let data = inputString.data(using: String.Encoding.utf8)!
        let json = try? JSONSerialization.jsonObject(with: data, options: [])

        if let dict1 = json as? [String: Any] {
            if let vertexArray = dict1["graph"] as? [Any] {
                for vertex in vertexArray {
                    if let dict2 = vertex as? [String: Any] {
                        let vertexValue = dict2["vertex"]
                        if let dict3 = vertexValue as? [String: Any] {
                            let vertexId = dict3["id"]!
                            print("======== id: \(vertexId) ========")
                            if let edgeArray = dict3["edge"] as? [Any] {
                                for edge in edgeArray {
                                    if let edgeValue = edge as? [String: String] {
                                        let edgeId = edgeValue["id"]!
                                        let edgeWeight = edgeValue["weight"]!
                                        let edgeDirection = edgeValue["direction"]!
                                        print("========== eId: \(edgeId) ==========")
                                        print("========== eWeight: \(edgeWeight) ==========")
                                        print("========== eDirection: \(edgeDirection) ==========")
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    public func openTestFileInDocument() {
        let fileName = "Test"
        let dir = try? FileManager.default.url(for: .documentDirectory,
                                               in: .userDomainMask, appropriateFor: nil, create: true)
        // If the directory was found, we write a file to it and read it back
        if let fileURL = dir?.appendingPathComponent(fileName).appendingPathExtension("txt") {

            // Write to the file named Test
            let outString = "Write this text to the file"
            do {
                try outString.write(to: fileURL, atomically: true, encoding: .utf8)
            } catch {
                print("Failed writing to URL: \(fileURL), Error: " + error.localizedDescription)
            }

            // Then reading it back from the file
            var inString = ""
            do {
                inString = try String(contentsOf: fileURL)
            } catch {
                print("Failed reading from URL: \(fileURL), Error: " + error.localizedDescription)
            }
            print("Read from the file: \(inString)")
        }
    }
}
