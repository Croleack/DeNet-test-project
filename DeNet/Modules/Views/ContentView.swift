//
//  ContentView.swift
//  DeNet
//
//  Created by Enzhe Gaysina on 15.11.2023.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
    @ObservedObject var service = MyRealmService.shared
    
    var rootNode: Node = { MyRealmService.shared.getNodes() ??
	   Node(name: "RootNode")
    }()
    
    var body: some View {
	   
	   NavigationView {
		  if let rootNode = service.rootNode {
			 TreeView(node: rootNode, isRootNode: true)
				.navigationBarTitle("Тестовое задание")
		  } else {
			 Text("Root nil!")
		  }
	   }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
	   ContentView()
    }
}
