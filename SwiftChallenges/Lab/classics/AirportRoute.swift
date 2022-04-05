import Foundation

class AirportRoute {
    
    func makeRoute(input: Array<String>) -> Array<String> {
        var result = Array<String>()
        var dict = [String:String]()
        for i in input {
            let x = i.components(separatedBy: "-")
            let key = x[0]
            let value = x[1]
            print("====== key: \(key) value: \(value)")
            dict[key] = value
        }
        
        var start: String = getStartingPoint(dict: dict)
        print("Start: \(start)")
        result.append(start)
        for _ in 1...input.count {
            let value = dict[start]!
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
