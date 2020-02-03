//
//  LobbyViewController.swift
//  Assassins
//
//  Created by Joshua Liu on 2/1/20.
//  Copyright © 2020 HackUCI. All rights reserved.
//

import UIKit
<<<<<<< Updated upstream
import CoreLocation

class LobbyViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()

        view.backgroundColor = .gray
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    // do stuff
                }
            }
        }
    }

}

=======

class LobbyViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func GoToGame(_ sender: Any) {
    }
    
}
>>>>>>> Stashed changes
