//
//  ContentView.swift
//  Location
//
//

import SwiftUI
import MapKit

struct ContentView: View {
    @ObservedObject private var locationController = LocationController()
    
    var coordinate: Binding<MKCoordinateRegion>? {
        
        guard let location = locationController.location else { return nil}
        
        return Binding(
            get: {
                return MKCoordinateRegion(
                    center: CLLocationCoordinate2D(
                        latitude: location.latitude,
                        longitude: location.longitude
                    ),
                    latitudinalMeters: 50,
                    longitudinalMeters: 50
                )}, set: { MKCoordinateRegion in
                    
                }
        )
    }
    
    var body: some View {
        if let coordinate = coordinate {
            Map(coordinateRegion: coordinate, interactionModes: .all, showsUserLocation: true, userTrackingMode: .constant(.follow)).ignoresSafeArea()
        } else {
            Text("Ingen lokation")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
