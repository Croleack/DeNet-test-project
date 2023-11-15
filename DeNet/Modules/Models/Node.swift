//
//  Node.swift
//  DeNet
//
//  Created by Enzhe Gaysina on 15.11.2023.
//

import Foundation

class Node: Identifiable {
    var id = UUID()
    let name: String
    var children: [Node] = []
    weak var parent: Node?
    
    init(name: String, children: [Node] = []) {
	   self.name = name
	   self.children = children
	   self.children.forEach { $0.parent = self }
    }
    
    func addChild(_ child: Node) {
	   children.append(child)
	   child.parent = self
    }
    
    func removeChild(_ child: Node) {
	   if let index = children.firstIndex(where: { $0.id == child.id }) {
		  children.remove(at: index)
		  child.parent = nil
	   }
    }
}
