//
//  MapViewController.swift
//  BaseAppV2
//
//  Created by Shaun Bevan on 4/24/18.
//  Copyright © 2018 SilverLogic. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps

final class MapViewController: BaseViewController {

    // MARK: - IBOutlets


    // MARK: - Private Instance Attributes
    var locationManager = CLLocationManager()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = nil
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
        }
        DispatchQueue.main.async { [weak self] in
            self?.locationManager.startUpdatingLocation()
        }

        let camera = GMSCameraPosition.camera(withLatitude: 25.794764, longitude: -80.133155, zoom: 25.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.setMinZoom(10, maxZoom: 25.0)
        view = mapView

        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 25.794764, longitude: -80.133155)
        marker.title = "Miami Beach Convention Center"
        marker.map = mapView
    }
}


// MARK: - CLLocationManagerDelegate & MKMapViewDelegate
extension MapViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    }
}
