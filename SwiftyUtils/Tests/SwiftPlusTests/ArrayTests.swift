//
//  Test.swift
//
//
//  Created by Kyaw Zay Ya Lin Tun on 30/06/2024.
//

import SwiftPlus
import Testing

struct ArrayTests {
  
  @Test("isNotEmpty", arguments: [
    [String](),
    ["a", "b", "c"]
  ])
  func isNotEmpty(arr: [String]) async throws {
    #expect(arr.isNotEmpty == !arr.isEmpty)
  }
  
  @Test("Convert array into dictionary with indices")
  func toDictionary() async throws {
    #expect([String]().toDictionary() == [:])
    #expect(["a", "b", "c"].toDictionary() == ["0": "a", "1": "b", "2": "c"])
  }
  
  
  @Test("mutateInPlace")
  func mutateInPlace() async throws {
    struct Counter: Equatable {
      var count: Int
    }
    
    var counters = (1 ... 10).map { Counter(count: $0) }
    #expect(
      counters == [
        Counter(count: 1),
        Counter(count: 2),
        .init(count: 3),
        .init(count: 4),
        .init(count: 5),
        .init(count: 6),
        .init(count: 7),
        .init(count: 8),
        .init(count: 9),
        .init(count: 10)
      ]
    )
    
    counters.mutateInPlace { $0.count += 1 }
    #expect(
      counters == [
        Counter(count: 2),
        .init(count: 3),
        .init(count: 4),
        .init(count: 5),
        .init(count: 6),
        .init(count: 7),
        .init(count: 8),
        .init(count: 9),
        .init(count: 10),
        .init(count: 11)
      ]
    )
  }
  
  @Test("custom subscript safe retrieval")
  func customSubscript() async throws {
    let arr = ["a", "b", "c"]
    #expect(arr[safe: 0] == "a")
    #expect(arr[safe: 3] == nil)
  }
}