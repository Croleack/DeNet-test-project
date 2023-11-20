//
//  RealmService.swift
//  DeNet
//
//  Created by Enzhe Gaysina on 18.11.2023.
//

import Foundation
import RealmSwift
import Combine

class MyRealmService: ObservableObject {
    static let shared = MyRealmService()
    // MARK: - Properties
    private let realm: Realm
    @Published var rootNode: Node?
    private var notificationToken: NotificationToken?
    // MARK: - Initialization
    private init() {
	   do {
		  self.realm = try Realm()
		  observeRealmChanges()
	   } catch {
		  fatalError("Error with Realm: \(error)")
	   }
    }
    // MARK: - Realm Observation
    private func observeRealmChanges() {
	   let nodes = realm.objects(Node.self)
	   
	   if nodes.isEmpty {
		  let rootNode = Node(name: "RootNode")
		  saveNode(rootNode)
		  self.rootNode = rootNode
	   } else {
		  self.rootNode = nodes.first
	   }
	   
	   notificationToken = nodes.observe { [weak self] _ in
		  guard let self = self else { return }
		  
		  self.rootNode = nodes.first
		  self.objectWillChange.send()
	   }
    }
    
    deinit {
	   notificationToken?.invalidate()
    }
    // MARK: - Node Operations
    func saveNode(_ node: Node) {
	   do {
		  try realm.write {
			 realm.add(node)
		  }
	   } catch {
		  print("Error saving node: \(error)")
	   }
    }
    
    func addChild(_ node: Node, child: Node) {
	   do {
		  try realm.write {
			 node.childrens.append(child)
			 realm.add(node)
		  }
	   } catch {
		  print("Error adding child: \(error)")
	   }
    }
    
    func deleteChild(_ node: Node) {
	   do {
		  try realm.write {
			 realm.delete(node)
		  }
	   } catch {
		  print("Error deleting node: \(error)")
	   }
    }
 
    func getNodes() -> Node? {
	   guard let firstNode = realm.objects(Node.self).first else {
		  print("Error retrieving nodes")
		  return nil
	   }
	   return firstNode
    }

}
