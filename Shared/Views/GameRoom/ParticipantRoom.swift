//
//  ParticipantRoom.swift
//  pq
//
//  Created by Roger King on 1/17/21.
//

import SwiftUI

struct ParticipantRoom: View {
    @State private var broadcastClient: BroadcastingClient? = nil
    @State private var user_connection: Pq_Streaming_Games_Timer_Connection? = nil
    var game: Game?

    func initClient() {
        self.broadcastClient = BroadcastingClient.shared
        self.broadcastClient?.connect()
        createConnection()
    }
    func createConnection() {
        if broadcastClient != nil {
            var connection = Pq_Streaming_Games_Timer_Connection.init()
            var user = Pq_User_User.init()
            user.displayName = "mobile_user"
            user.id = "12345g"
            user.isHost = false

            connection.user = user
            connection.active = true
            connection.gameID = game!.code
            self.user_connection = connection
            self.broadcastClient?.setupStream(connection: connection)
            print("Setup Connection")
        }
    }
    
    var body: some View {
        if game != nil {
            NavigationView {
                VStack {
                    Text("Welcome to \(game!.name)")
                    ConnectionStatus(connection: user_connection, client: broadcastClient)
                }
            }.onAppear(perform: initClient)
        }
    }
}

struct ParticipantRoom_Previews: PreviewProvider {
    static var previews: some View {
        ParticipantRoom(game: nil)
    }
}
