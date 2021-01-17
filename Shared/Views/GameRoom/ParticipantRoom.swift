//
//  ParticipantRoom.swift
//  pq
//
//  Created by Roger King on 1/17/21.
//

import SwiftUI

struct ParticipantRoom: View {
    var roomId: String
    
    var body: some View {
        Text("Welcome to \(roomId)")
    }
}

struct ParticipantRoom_Previews: PreviewProvider {
    static var previews: some View {
        ParticipantRoom(roomId: "")
    }
}
