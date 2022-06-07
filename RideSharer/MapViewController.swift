//
//  MapViewController.swift
//  RideSharer
//
//

import UIKit
import MapKit

class MapViewController: UIViewController {

//    Step 2: Create an IBOutlet in the View Controller that manages the MapKitView
    @IBOutlet weak var mapView: MKMapView!
    
//    Step 3: Check the Location Service.
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkLocationServices()
    
    }
    
    func checkLocationServices() {
      if CLLocationManager.locationServicesEnabled() {
          checkLocationAuthorization()
      } else {
        // Show alert letting the user know they have to turn this on.
      }
    }
    
//    Step 4: Check Location Authorization Status
    func checkLocationAuthorization() {
        switch locationManager.authorizationStatus {
        case .authorizedWhenInUse:
          mapView.showsUserLocation = true
        case .denied:  // Show alert telling users how to turn on permissions
            showDeniedAlert()
        case .notDetermined:
          locationManager.requestWhenInUseAuthorization()
          mapView.showsUserLocation = true
        case .restricted:    // Show an alert letting them know what’s up
          break
        case .authorizedAlways:
          break

        @unknown default:
            break
        }
    }
    
    func showDeniedAlert() {
//        Creating an alert controller
        let alert = UIAlertController(title: "Denied", message: "You don't have provided permission", preferredStyle: .alert)
//        Configuring the user actions
        let okAction = UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil)
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)    }
    
}
