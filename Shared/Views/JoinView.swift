//
//  JoinView.swift
//  pq
//
//  Created by Roger King on 1/17/21.
//

import SwiftUI

struct JoinView: View {
    @State private var roomId: String = ""
    
    func join() -> Void {
        print("Navigating to:", roomId)
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10, content: {
                TextField("PQ Code", text: $roomId)
                    NavigationLink(destination: ParticipantRoom(roomId: roomId)) {
                        Text("Join \(roomId)")
                    }
            }).padding(30)
        }.navigationTitle("PQ \(roomId)")
    }
}

struct JoinView_Previews: PreviewProvider {
    static var previews: some View {
        JoinView()
    }
}
