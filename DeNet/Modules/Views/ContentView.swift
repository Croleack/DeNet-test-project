//
//  ContentView.swift
//  DeNet
//
//  Created by Enzhe Gaysina on 15.11.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rootNode = Node(name: "root", children: [
	   Node(name: generateRandomName(), children: [
		  Node(name: generateRandomName(), children: [
			 Node(name: generateRandomName())
		  ]),
		  Node(name: generateRandomName(), children: [
			 Node(name: generateRandomName())
		  ]),
	   ]),
	   Node(name: generateRandomName(), children: [
		  Node(name: generateRandomName()),
	   ]),
	   Node(name: generateRandomName(), children: [
		  Node(name: generateRandomName()),
	   ]),
    ])
    
    var body: some View {
	   NavigationView {
		  TreeView(node: rootNode)
			 .navigationBarTitle("Тестовое задание")

	   }
    }
}

func generateRandomName() -> String {
    var randomBytes = [UInt8](repeating: 0, count: 20)
    _ = SecRandomCopyBytes(kSecRandomDefault, randomBytes.count, &randomBytes)
    
    return randomBytes.map { String(format: "%02hhx", $0) }.joined()
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
