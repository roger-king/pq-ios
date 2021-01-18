//
//  JoinView.swift
//  pq
//
//  Created by Roger King on 1/17/21.
//

import SwiftUI
import Alamofire

struct JoinView: View {
    @State private var roomId: String = ""
    @State var selection: Int? = nil
    @State private var foundGame: Game? = nil
    
    func join() -> Void {
        print("Navigating to:", roomId)
        let request = AF.request("http://127.0.0.1:8000/api/qb/v1/games/\(roomId)/join", method: .put)
        request.responseDecodable(of: Game.self) { (response) in
            guard let game = response.value else { return }
            foundGame = game
            selection = 1
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10, content: {
                TextField("PQ Code", text: $roomId)
                NavigationLink(destination: ParticipantRoom(game: foundGame), tag: 1, selection: $selection) {
                        Button("Join \(roomId)", action: join)
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
