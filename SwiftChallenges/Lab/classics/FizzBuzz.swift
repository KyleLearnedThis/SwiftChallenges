import Foundation

class FizzBuzz {
    func fizzBuzzV1(number: Int) -> Array<String> {
        var result : Array<String> = Array<String>()
        for i in 1 ... number {
            if (i % 15  == 0) {
                result.append("FizzBuzz")
            } else if (i % 3 == 0) {
                result.append("Fizz")
            } else if (i % 5 == 0) {
                result.append("Buzz")
            } else {
                result.append("\(i)")
            }
        }
        return result
    }

    func fizzBuzzV2(number: Int) -> [String] {
        return Array(1 ... number).map { i -> String in
            switch (i % 3 == 0, i % 5 == 0) {
            case (true, false):
                return "Fizz"
            case (false, true):
                return "Buzz"
            case (true, true):
                return "FizzBuzz"
            default:
                return "\(i)"
            }
        }
    }
}
