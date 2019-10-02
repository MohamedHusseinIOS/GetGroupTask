//
//  BranchesViewController.swift
//  GetGroupTask
//
//  Created by Mohamed Hussien on 01/10/2019.
//  Copyright © 2019 HNF. All rights reserved.
//

import UIKit
import GoogleMaps

class BranchesViewController: BaseViewController {

    @IBOutlet weak var mapView: GMSMapView!
    
    var model: CarModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Branchs"
        // Do any additional setup after loading the view.
    }
    
    override func configureUI() {
        configureMapView(branchs: model?.branches)
    }
    
    func configureMapView(branchs: [Branch]?){
        let camera = GMSCameraPosition.camera(withLatitude: branchs?.first?.latitude ?? 0.0,
                                              longitude: branchs?.first?.longitude ?? 0.0, zoom: 15.0)
        
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        //mapView.delegate = self
        self.mapView.animate(to: camera)
        guard let branchsArr = branchs else { return }
        for branch in branchsArr {
            guard let latitude = branch.latitude, let longitude = branch.longitude else { continue }
            let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let marker = GMSMarker()
            marker.position = location
            marker.snippet = branch.address
            marker.map = mapView
            mapView.selectedMarker = marker
        }
    }
}
