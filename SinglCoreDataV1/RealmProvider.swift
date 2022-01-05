//
//  RealmProvider.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 04.01.2022.
//

import RealmSwift

let realm = try! Realm()

class RealmProvider {
    
    func getObject() -> [AnimalEntityMD] {
        let animals = realm.objects(AnimalEntityMD.self)
        let animalItem = animals.compactMap { AnimalEntityMD(id: $0.id, name: $0.name, type: $0.type, timestamp: $0.timestamp) }
        let sortedAnimal = animalItem.sorted(by: {$0.timestamp > $1.timestamp})
        return sortedAnimal
    }
    
    func saveObject(_ animal: AnimalEntityMD) -> [AnimalEntityMD]  {
        try! realm.write {
            realm.add(animal)
        }
        return getObject()
    }
    
    func removeObject(_ animal: AnimalEntityMD) {
        print("----FASTPRINT--removeObject-- \(animal)")
        try! realm.write {
            realm.delete(animal)
        }
    }
    
    func editObject(_ animal: AnimalEntityMD) {
        try! realm.write {
            let animals = realm.objects(AnimalEntityMD.self)
            for item in animals {
                if item.id == animal.id {
                    item.id = animal.id
                    item.name = animal.name
                    item.type = animal.type
                    item.timestamp = animal.timestamp
                }
            }
        }
    }
}

class AnimalEntityMD: Object {
    @objc dynamic var id: String?
    @objc dynamic var name: String?
    @objc dynamic var type: String?
    @objc dynamic var timestamp = 0
    
    convenience init(id: String?, name: String?, type: String?, timestamp: Int?) {
        self.init()
        self.id = id
        self.name = name
        self.type = type
        self.timestamp = timestamp ?? 0
    }
}
