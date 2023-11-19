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
    
    private let realm: Realm
    
    private init() {
	   do {
		  self.realm = try Realm()
	   } catch {
		  fatalError("Error with Realm: \(error)")
	   }
    }
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
