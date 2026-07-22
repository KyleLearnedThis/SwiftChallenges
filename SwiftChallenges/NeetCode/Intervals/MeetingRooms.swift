//
//  MeetingRooms.swift
//  SwiftChallenges
//
//  Created by KyleLearnedThis on 7/20/26.
//

// 252. Meeting Rooms
//
// Given an array of meeting time intervals where intervals[i] = [start_i, end_i],
// determine if a person could attend all meetings.
//
// Example 1:
//   Input:  [[0, 30], [5, 10], [15, 20]]
//   Output: false   ([0,30] overlaps [5,10] and [15,20])
//
// Example 2:
//   Input:  [[7, 10], [2, 4]]
//   Output: true    (no overlaps)
//
// Note: meetings that only touch at an endpoint (one ends when the next begins,
// e.g. [1,5] and [5,10]) do NOT count as overlapping.
class MeetingRooms {

    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        if intervals.isEmpty { return true }
        let sorted = intervals.sorted { $0[0] < $1[0] }
        for i in 0..<sorted.count - 1 {
            let first = sorted[i]
            let second = sorted[i+1]
            
            // first's end time > second's start time
            if first[1] > second[0] {
                return false
            }
        }
        return true
    }
}
