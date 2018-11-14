//
//  TbtNavigation.swift
//  TbtNavigation
//
//  Created by Hamza El Yousfi on 11/13/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

import Foundation
import MapboxDirections
import MapboxCoreNavigation
import MapboxNavigation

@objc(TbtNavigation)
class TbtNavigation: NSObject {
  @objc
  func takeMeToWH() {
    let origin = Waypoint(coordinate: CLLocationCoordinate2D(latitude: 38.9131752, longitude: -77.0324047), name: "Mapbox")
    let destination = Waypoint(coordinate: CLLocationCoordinate2D(latitude: 38.8977, longitude: -77.0365), name: "White House")
    let options = NavigationRouteOptions(waypoints: [origin, destination])
    Directions.shared.calculate(options) { (waypoints, routes, error) in
      guard let route = routes?.first else { return }
      let viewController = NavigationViewController(for: route)
      let appDelegate = UIApplication.shared.delegate
      appDelegate!.window!!.rootViewController!.present(viewController, animated: true, completion: nil)
    }
  }
}
