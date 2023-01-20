//
//  ContentView.swift
//  MapView
//
//  Created by Айбек on 20.01.2023.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        MapView().edgesIgnoringSafeArea(.all)
    }
}

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        let mapview = MKMapView()
        
        mapview.delegate = context.coordinator
        
        let annotationOne = MKPointAnnotation()
        annotationOne.title = "Astana"
        annotationOne.subtitle = "The capital of the Republic of Kazakhstan"
        annotationOne.coordinate = CLLocationCoordinate2D(latitude: 51.08, longitude: 71.26)
        mapview.addAnnotation(annotationOne)
        
        let annotationTwo = MKPointAnnotation()
        annotationTwo.title = "Almaty"
        annotationTwo.subtitle = "A city of Republican Significance"
        annotationTwo.coordinate = CLLocationCoordinate2D(latitude: 43.15, longitude: 76.54)
        mapview.addAnnotation(annotationTwo)
        
        let annotationThree = MKPointAnnotation()
        annotationThree.title = "Shymkent"
        annotationThree.subtitle = "A city of Republican Significance"
        annotationThree.coordinate = CLLocationCoordinate2D(latitude: 42.18, longitude: 69.36 )
        mapview.addAnnotation(annotationThree)
        
        return mapview
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        //
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            print(mapView.centerCoordinate)
        }
        
        func mapView(_ MapView: MKMapView, viewFor annotationTwo: MKAnnotation) -> MKAnnotationView? {
            let pinview = MKMarkerAnnotationView(annotation: annotationTwo, reuseIdentifier: nil)
            pinview.canShowCallout = true
            return pinview
        }
        
        init(_ parent: MapView) {
            self.parent = parent
        }
    }
}
























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
