//
//  GraphUtils.swift
//  SwiftDS
//
//  Copyright © 2019 kylelearnedthis. All rights reserved.
//  TODO: Would like to remove generic in favor of the simple decodable JSON object in the future.

import Foundation

public class GraphUtils {
    public static func openHomeFile(inputDirectory: String, fileName: String) -> String {
        var input = ""
        let x = fileName.components(separatedBy: ".")
        let base = inputDirectory.hasPrefix("/")
            ? URL(fileURLWithPath: inputDirectory)
            : FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent(inputDirectory)
        let url = base.appendingPathComponent(x[0]).appendingPathExtension(x[1])
        do {
            input = try String(contentsOf: url, encoding: .utf8)
        } catch {
            print("open file: \(fileName) failed")
        }
        return input
    }

    public static func parseGraphJsonFile(inputDirectory: String, fileName: String) -> [String: Vertex<String>] {
        struct EdgeJSON: Decodable {
            let id: String
            let weight: String
            let direction: String
        }
        struct VertexJSON: Decodable {
            let id: String
            let edge: [EdgeJSON]?
        }
        struct VertexWrapper: Decodable {
            let vertex: VertexJSON
        }
        struct GraphJSON: Decodable {
            let graph: [VertexWrapper]
        }

        let inputString = openHomeFile(inputDirectory: inputDirectory, fileName: fileName)
        guard let data = inputString.data(using: .utf8),
              let graphJSON = try? JSONDecoder().decode(GraphJSON.self, from: data) else { return [:] }

        var vertexMap: [String: Vertex<String>] = [:]
        for wrapper in graphJSON.graph {
            let vj = wrapper.vertex
            let v = Vertex<String>(id: vj.id)
            for ej in vj.edge ?? [] {
                let edge = Edge(x: vj.id, y: ej.id, weight: Int(ej.weight) ?? 0, direction: chooseDirection(inputString: ej.direction))
                v.edgeList.append(edge)
            }
            vertexMap[vj.id] = v
        }
        return vertexMap
    }

    private static func chooseDirection(inputString: String) -> Direction {
        switch inputString {
        case "X_TO_Y": return .X_TO_Y
        case "Y_TO_X": return .Y_TO_X
        default:        return .BOTH
        }
    }
}
