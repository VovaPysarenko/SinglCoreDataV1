//
//  StartViewController.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 18.01.2022.
//

import UIKit

class StartViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    @IBOutlet var textfieldBizCat: UITextField!
    @IBOutlet var pickerBizCat: UIPickerView! = UIPickerView()
    
    var bizCat = ["Cat One", "Cat Two", "Cat Three"]


    override func viewDidLoad() {
        super.viewDidLoad()
        pickerBizCat.delegate = self
        pickerBizCat.dataSource = self
        pickerBizCat.isHidden = true;
        textfieldBizCat.text = bizCat[0]
    }

    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView!) -> Int{
        return 1
    }

    // returns the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return bizCat.count
    }

    func pickerView(pickerView: UIPickerView!, titleForRow row: Int, forComponent component: Int) -> String! {
        return bizCat[row]
    }

    func pickerView(pickerView: UIPickerView!, didSelectRow row: Int, inComponent component: Int)
    {
        textfieldBizCat.text = bizCat[row]
        pickerBizCat.isHidden = true;
    }
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return 3
//    }
//
//
////    var test = StartSessionResponse
//
//    @IBOutlet weak var piker: UIPickerView!
//
//    @IBOutlet weak var pickerSecond: UIPickerView!
//    //    var test = ["msg_id": -1, "token": -1]
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        piker.delegate = self
//        piker.dataSource = self
//        pickerSecond.dataSource = self
//        pickerSecond.delegate = self
////        test.deserealizeResponse(<#T##self: StartSessionResponse##StartSessionResponse#>)
////        let id = toData()
////        print("----FASTPRINT---- \(id)")
//
//
//    }
////
////    func toData() -> Data? {
////        let serializedRequest = ["msg_id": -1, "token": -1] as! NSDictionary
////        if JSONSerialization.isValidJSONObject(serializedRequest){
////            do{
////                let data = try JSONSerialization.data(withJSONObject: serializedRequest, options: JSONSerialization.WritingOptions.init(rawValue: 0))
////                print("----FASTPRINT---- \(data)")
////                return data
////            }catch let parserError{
////                print(parserError)
////            }
////        }
////
////        return nil
////    }
//
//    @IBAction func CDataPressed(_ sender: Any) {
//        navigationController?.pushViewController(AnimalConfigurator.create(), animated: true)
//    }
//
//    @IBAction func realmPressed(_ sender: Any) {
//        navigationController?.pushViewController(ItemConfigurator.create(), animated: true)
//    }
//
    @IBAction func fireBasePressed(_ sender: Any) {
        print("----FASTPRINT----")
        navigationController?.pushViewController(MainSideBarVC(), animated: true)
//        navigationController?.pushViewController(CityViewController(), animated: true)
    }
//
}
