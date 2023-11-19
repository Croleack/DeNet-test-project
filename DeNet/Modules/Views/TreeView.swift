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
			 Button("Remove") {
				removeNode()
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
	   let newNode = Node(name: generateRandomName())
	   MyRealmService.shared.addChild(node, child: newNode)
	   MyRealmService.shared.saveNode(newNode)
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
    func generateRandomName() -> String {
	   var randomBytes = [UInt8](repeating: 0, count: 20)
	   _ = SecRandomCopyBytes(kSecRandomDefault,
						 randomBytes.count,
						 &randomBytes)
	   
	   return randomBytes.map { String(format: "%02hhx", $0) }.joined()
    }
}
