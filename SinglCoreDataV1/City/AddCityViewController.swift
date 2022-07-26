//
//  AddCityViewController.swift
//  SinglCoreDataV1
//
//  Created by Volodymyr Pysarenko on 19.01.2022.
//

import UIKit
import AVFAudio
import CoreBluetooth
import AVFoundation

class AddCityViewController: UIViewController {

    
    @IBOutlet weak var cityTextField: UITextField!
    
    let speechService = SpeaechProvider()
    
//    var centralManager: CBCentralManager?
//        var peripherals = [CBPeripheral]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        centralManager = CBCentralManager(delegate: self, queue: DispatchQueue.main)

    }
    
    @IBAction func savePressed(_ sender: Any) {
        guard let phrase = cityTextField.text else {return}
        speechService.say(phrase: phrase)
        print("----FASTPRINT---- \(phrase)")

    }

}


//extension AddCityViewController : CBPeripheralDelegate, CBCentralManagerDelegate {
//
////    func centralManagerDidUpdateState(_ central: CBCentralManager) {
////        if (central.state == .poweredOn){
////            self.centralManager?.scanForPeripherals(withServices: nil, options: nil)
////        }
////    }
//
//    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
//
//        let localName = peripheral.name
//        print("----FASTPRINT--localName-- \(localName)")
//
////        self.bluetoothNameLabel.text = "\(localName ?? "")"
//
////        if !peripherals.contains(peripheral) {
////            let localName = advertisementData[CBAdvertisementDataLocalNameKey]
////
////            print("\(String(describing: localName))" )
////            peripherals.append(peripheral)
////        }
//    }
//
//    func centralManagerDidUpdateState( _ central: CBCentralManager) {
//        switch central.state {
//        case .unknown:
//            print("central.state is .unknown")
//        case .resetting:
//            print("central.state is .resetting")
//        case .unsupported:
//            print("central.state is .unsupported")
//        case .unauthorized:
//            print("central.state is .unauthorized")
//        case .poweredOff:
//            print("central.state is .poweredOff")
//        case .poweredOn:
//            print("central.state is .poweredOn")
//            print("----FASTPRINT---- \(centralManager)")
//            print("----FASTPRINT---- \(central)")
////            self.bluetoothNameLabel.text = "Bluetooh is powered ON"
//        @unknown default:
//            fatalError()
//        }
//    }
//
//    func centralManager( central: CBCentralManager, didConnect peripheral: CBPeripheral) {
//        print("Connected to "+peripheral.name!)
//    }
//
//    func centralManager( _ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
//        print(error!)
//    }
//}
//
//
