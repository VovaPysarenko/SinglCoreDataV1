//
//  CityTableView.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 19.01.2022.
//

import UIKit

class CityTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var cities = [CityEntity]()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as? CityTableViewCell {
            let cityItem = cities[indexPath.row]
            cell.cityLabel.text = cityItem.city
            cell.countryLabel.text = cityItem.country
            return cell
        }
        return UITableViewCell()
    }
    



}
