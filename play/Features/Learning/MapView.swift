//
//  MapView.swift
//  play
//
//  Created by Jai Nijhawan on 06/11/23.
//

import MapKit
import SwiftUI

struct MapView: View {
    var body: some View {
        Map(initialPosition: .region(region))
    }

    private var region: MKCoordinateRegion {
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 28.7041, longitude: 77.1025),
                           span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    }
}

#Preview {
    MapView()
}
