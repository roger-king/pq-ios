//
//  Game.swift
//  pq (iOS)
//
//  Created by Roger King on 1/18/21.
//

import Foundation

struct Game: Decodable {
    let id: Int
    let is_host: Bool
    let is_over: Bool
    let is_started: Bool
    let name: String
    let host_code: String
    let code: String
    let start_time: String
}
