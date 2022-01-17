//
//  RealmProvider.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 04.01.2022.
//

import RealmSwift

class RealmProvider {
    let realm = try! Realm()
    
    func getObject() -> [ItemEntity] {
        let items = realm.objects(ItemEntity.self)
        let item = items.compactMap { ItemEntity(id: $0.id, name: $0.name, type: $0.type, timestamp: $0.timestamp) }
        let sortedItem = item.sorted(by: {$0.timestamp > $1.timestamp})
        return sortedItem
    }
    
    func saveObject(_ item: ItemEntity) -> [ItemEntity]  {
        try! realm.write {
            realm.add(item)
        }
        return getObject()
    }
    
    func removeObject(_ item: ItemEntity) {
        let items = realm.objects(ItemEntity.self)
        for value in items {
            if value.id == item.id {
                try! realm.write {
                    realm.delete(value)
                }
            } else {
                print("error")
            }
        }
    }
    
    func editObject(_ item: ItemEntity) -> [ItemEntity] {
        let items = realm.objects(ItemEntity.self)
        try! realm.write {
            for value in items {
                if value.id == item.id {
                    value.id = item.id
                    value.name = item.name
                    value.type = item.type
                    value.timestamp = item.timestamp
                    self.realm.add(value)
                }
            }
        }
        return getObject()
    }
}

class ItemEntity: Object {
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
