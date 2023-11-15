//
//  ContentView.swift
//  DeNet
//
//  Created by Enzhe Gaysina on 15.11.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rootNode = Node(name: "root", children: [
	   Node(name: "Child 1", children: [
		  Node(name: "Grandchild 1", children: [
			 Node(name: "Great Grandchild 1")
		  ]),
		  Node(name: "Grandchild 2", children: [
			 Node(name: "Great Grandchild 2")
		  ]),
	   ]),
	   Node(name: "Child 2", children: [
		  Node(name: "Grandchild 4"),
	   ]),
	   Node(name: "Child 3", children: [
		  Node(name: "Grandchild 3"),
	   ]),
    ])
    
    var body: some View {
	   NavigationView {
		  TreeView(node: rootNode)
			 .navigationBarTitle("Тестовое задание")
			 .navigationBarItems(
				trailing:
				    HStack {
					   Button(action: {
						  let newChild = Node(name: "Child \(self.rootNode.children.count + 1)")
						  self.rootNode.addChild(newChild)
					   }) {
						  Text("Add")
					   }
					   Button(action: {
						 
					   }) {
						  Text("Delete")
					   }
				    }
			 )
	   }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
