//
//  AnimalPresenter.swift
//  SinglCoreDataV1
//
//  Created by Vladislav Nikolaychuk on 22.12.2021.
//

import Foundation

class AnimalPresenter: AnimalPresenterProtocol {
    func getData() {
        print("DATA GETTED")
    }
    
    var view: AnimalViewProtocol!
    
}


protocol AnimalPresenterProtocol: AnyObject {
    var view: AnimalViewProtocol! {get set}
    func getData()
}


protocol AnimalViewProtocol: AnyObject {
    var presenter: AnimalPresenterProtocol! {get set}
}
