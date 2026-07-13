//
//  NeetDailyTemperatures.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/12/26.
//  https://leetcode.com/problems/daily-temperatures/
//  Time O(N), Space O(N)

class NeetDailyTemperatures {

    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        // Default 0 = "no warmer day ahead" for every day.
        var result = Array(repeating: 0, count: temperatures.count)

        // Monotonic stack of days still waiting for a warmer day.
        // Invariant: temperatures at these indices are strictly decreasing
        // from bottom to top, so the top is always the coldest so far.
        var stack: [(temperature: Int, day: Int)] = []

        for (currentDay, currentTemp) in temperatures.enumerated() {
            // Today is warmer than the days on top of the stack, so today
            // is the answer for each of them. Pop and record the wait.
            while let coldest = stack.last, currentTemp > coldest.temperature {
                stack.removeLast()
                result[coldest.day] = currentDay - coldest.day
            }
            // Today now waits for its own warmer day.
            stack.append((currentTemp, currentDay))
        }

        // Any days left on the stack never found a warmer day, so they keep 0.
        return result
    }
}
