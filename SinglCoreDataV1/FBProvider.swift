//
//  FBProvider.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 19.01.2022.
//

import Foundation
import Firebase

class FBProvider {
    
    var ref: DatabaseReference!
    
    func save(_ city: CityEntity) {
        ref = Database.database().reference()
//        self.ref.child("cities").child(user.uid).setValue(["city": city])
        self.ref.child("ciries").childByAutoId().setValue([city])

        
//        return getObject()
    }
    
//    func get() -> [CityEntity] {
//        let items = realm.objects(ItemEntity.self)
//        let item = items.compactMap { CityEntity(id: $0.id, name: $0.name, type: $0.type, timestamp: $0.timestamp) }
//        let sortedItem = item.sorted(by: {$0.timestamp > $1.timestamp})
//        return sortedItem
//    }
    
    
    
    
//    private func saveAnimal() {
//        ref = Database.database().reference()
//
//        self.ref.child("ciries").childByAutoId().setValue([city])
//
//        guard let nameText = nameText.text, self.nameText.text != "" else {return}
//        guard let typeText = typeText.text, self.typeText.text != "" else {return}
//
//        let animal: [String: Any] = [
//            "name": nameText,
//            "type": typeText
//        ]
//        print("fastPrint \(animal)")
//
//        if currentAnimal != nil {
//
//            self.ref?.getData { [weak self] (error, snapshot) in
//                if let error = error {
//                    print("Error getting data \(error)")
//                }
//                else if snapshot.exists() {
//                    let current = self?.currentAnimal
////                    current?.ref?.setValue(animal)
//                    self?.dismiss(animated: true, completion: nil)
//                    print("Got data \(snapshot.value!)")
//                }
//                else {
//                    print("No data available")
//                }
//            }
//    } else {
//            ref.childByAutoId().setValue(animal)
//        }
//    }

    
    
}


struct CityEntity {
    let id: String?
    let city: String?
    let country: String?
    let timestamp: Int64?
}
