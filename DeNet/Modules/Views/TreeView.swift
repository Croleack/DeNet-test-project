//
//  TreeView.swift
//  DeNet
//
//  Created by Enzhe Gaysina on 17.11.2023.
//

import SwiftUI

struct TreeView: View {
    // MARK: - Properties
    let node: Node
    let isRootNode: Bool
    // MARK: - Body
    var body: some View {
	   VStack {
		  HStack {
			 Button("Add") {
				addNode()
			 }
			 if !isRootNode {
				Button("Remove") {
				    removeNode()
				}
			 }
		  }
		  Text(node.name)
			 .font(.caption)
		  if !node.childrens.isEmpty {
			 List(node.childrens) { child in
				NavigationLink(
				    destination: TreeView(node: child, isRootNode: false)
				) {
				    TreeView(node: child, isRootNode: false)
				}
			 }
		  }
	   }
    }
    // MARK: - Methods
    
    func addNode() {
	   MyRealmService.shared.addChild(node, child: Node(name: "newNode"))
	   MyRealmService.shared.saveNode(getRootNode(node))
    }
    func removeNode() {
	   MyRealmService.shared.deleteChild(node)
    }
    
    func getRootNode(_ node: Node) -> Node {
	   if let parent = node.parent {
		  return getRootNode(parent)
	   } else {
		  return node
	   }
    }
}
