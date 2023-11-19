//
//  Node.swift
//  DeNet
//
//  Created by Enzhe Gaysina on 15.11.2023.
//

import Foundation
import RealmSwift
import Combine

class Node: Object, Identifiable {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var name: String = ""
    var childrens = List<Node>()
    weak var parent: Node?
    
    convenience init(name: String, children: [Node] = []) {
	   self.init()
	   self.name = name
	   childrens.append(objectsIn: children)
	   childrens.forEach { $0.parent = self }
    }
}
