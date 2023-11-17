//
//  TreeView.swift
//  DeNet
//
//  Created by Enzhe Gaysina on 17.11.2023.
//

import SwiftUI

struct TreeView: View {
    let node: Node
    
    var body: some View {
	   VStack {
		  Text(node.name)
			 .font(.caption) 
		  if !node.children.isEmpty {
			 List(node.children) { child in
				NavigationLink(destination: TreeView(node: child)) {
				    TreeView(node: child)
				}
			 }
		  }
	   }
    }
}
