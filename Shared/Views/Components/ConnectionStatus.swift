//
// Created by Roger King on 1/19/21.
//

import SwiftUI

struct ConnectionStatus: View {
    @State var color: Color = Color.red;
    @State var connectedText: String = "disconnected";
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    var connection: Pq_Streaming_Games_Timer_Connection?;
    var client: BroadcastingClient?;

    func didLoad () {
        Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    }

    func startHeartbeat() {
        if client != nil && connection != nil {
            try? client?.heartbeat(connection: connection!) { connected in
                if connected {
                    color = Color.green
                    connectedText = "connected"
                }
            }
        }
    }

    var body: some View {
        HStack {
            Text(connectedText).font(.system(size: 11))
            Circle.init().fill(color).frame(width: 10, height: 10).onReceive(timer) { time in
                startHeartbeat()
            }
        }
    }
}
