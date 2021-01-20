//
// Created by Roger King on 1/18/21.
//

import Foundation
import SwiftGRPC

class BroadcastingClient {
    static let shared = BroadcastingClient()
    private init() {}
    public var client: Pq_Streaming_Games_Timer_BroadcastServiceClient? = nil
    public var stream: Pq_Streaming_Games_Timer_BroadcastCreateStreamCall? = nil

    func connect() {
        self.client = Pq_Streaming_Games_Timer_BroadcastServiceClient.init(address: "127.0.0.1:9000", secure: false)
    }

    func setupStream(connection: Pq_Streaming_Games_Timer_Connection) {
        do {
            try? self.client?.createStream(connection) { (result: CallResult) -> () in
                print(result.resultData)
            }

        } catch {
            print("Failed to create client stream.")
        }
    }

    func heartbeat(connection: Pq_Streaming_Games_Timer_Connection, completion: @escaping (Bool) -> Void) {
        do {
            try? self.client?.heartbeat(connection) { (response: Pq_Streaming_Games_Timer_HeartbeatResponse?, result: CallResult) -> () in
                completion(result.success)
            }
        } catch {
            print("Failed to send heartbeat")
            completion(false)
        }
    }
}