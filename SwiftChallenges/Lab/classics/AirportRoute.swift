import Foundation

class AirportRoute {
    
    func makeRoute(input: Array<String>) -> Array<String> {
        var result = Array<String>()
        var dict = [String:String]()
        for i in input {
            let x = i.components(separatedBy: "-")
            guard x.count == 2 else { continue }
            dict[x[0]] = x[1]
        }

        var start: String = getStartingPoint(dict: dict)
        result.append(start)
        for _ in 1...input.count {
            guard let value = dict[start] else { break }
            result.append(value)
            start = value
        }
        return result
    }
    
    private func getStartingPoint(dict: Dictionary<String, String>) -> String {
        let keySet: Set = Set(dict.keys)
        let valueSet: Set = Set(dict.values)
        for key in keySet {
            if !valueSet.contains(key) {
                return key
            }
        }
        return ""
    }
}
