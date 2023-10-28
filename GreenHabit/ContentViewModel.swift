//
//  ContentViewModel.swift
//  GreenHabit
//
//  Created by Anya Li on 8/29/23.
//
import MapKit
import UserNotifications
enum MapDetails{
    static let startingLocation = CLLocationCoordinate2D(latitude: 37.25112389382974, longitude: -121.96120101714706)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
}
final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
//    var profile: ProfileItem
//    init(profile: ProfileItem){
//        self.profile = profile
//        super.init()
//    }
//    @EnvironmentObject var profileStore: ProfileStore

    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesIsEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            locationManager!.delegate = self
            self.locationManager?.allowsBackgroundLocationUpdates = true
            self.locationManager?.showsBackgroundLocationIndicator = true
            monitorRegionAtLocation(center: MapDetails.startingLocation, identifier: "Home")

        }
        else{
            print("Show an alert letting them know this is off")
        }
    }
    private func checkLocationAuthorization(){
        guard let locationManager = locationManager else {return}
        
        switch locationManager.authorizationStatus{
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted likely due to parental controls.")
        case .denied:
            print("You have denied this app location permission. Go to settings to change it.")
        case .authorizedAlways,.authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MapDetails.defaultSpan)
        @unknown default:
            break
        }
    }
    
    func monitorRegionAtLocation(center: CLLocationCoordinate2D, identifier: String ) {
        // Make sure the devices supports region monitoring.
        if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
            // Register the region.
            let maxDistance = locationManager!.maximumRegionMonitoringDistance
            let region = CLCircularRegion(center: center,
                 radius: maxDistance, identifier: identifier)
            region.notifyOnEntry = true
            region.notifyOnExit = false
       
            locationManager!.startMonitoring(for: region)
            
        }
    }
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion){
        let content = UNMutableNotificationContent()
        content.title = "School"
        content.subtitle = "Work"
        content.sound = UNNotificationSound.default

//        var dateComponents = DateComponents()
//        dateComponents.calendar = Calendar.current
        var timeSuggestions = ["Turn off the lights. Turn off devices.", "Print less. Use both sides of paper. \n    Use digital resources, emails and e-books.", "Reduce food waste. Learn to compost \n    and recycle.", "Walk, bike, carpool or use public \n    transportation than drive.", "Reduce Screen Time. Spend more time \n    outdoors and connect with nature", "Reduce food waste. Learn to compost \n    and recycle.", "Take shorter showers. Turn off tap while \n    brushing teeth. Unplug."]
        
        let dateCurrent = Date()
        let calendarCurrent = Calendar.current
        let hourCurrent = calendarCurrent.component(.hour, from: dateCurrent)
        let minCurrent = calendarCurrent.component(.minute, from: dateCurrent)

//        var dateComponents = DateComponents()
//        dateComponents.calendar = Calendar.current
//
//
//        dateComponents.hour = 7
//        dateComponents.minute = 20
        
        // Create the trigger as a repeating event.

        if(hourCurrent>=6 && hourCurrent<10){
            content.subtitle = timeSuggestions[0]
        }
        else if(hourCurrent>=10 && hourCurrent<12){
            content.subtitle = timeSuggestions[1]
        }
        else if(hourCurrent>=12 && hourCurrent<14){
            content.subtitle = timeSuggestions[2]
        }
        else if(hourCurrent>=14 && hourCurrent<16){
            content.subtitle = timeSuggestions[3]
        }
        else if(hourCurrent>=16 && hourCurrent<20){
            content.subtitle = timeSuggestions[4]
        }
        else if(hourCurrent>=20 && hourCurrent<22){
            content.subtitle = timeSuggestions[5]
        }
        else if(hourCurrent>=22 && hourCurrent<=24){
            content.subtitle = timeSuggestions[6]
        }

//        let components = Calendar.current.dateComponents([.hour, .minute], from: )
//        let hour = components.hour ?? 0
//        let minute = components.minute ?? 0
//                    dateComponents.weekday = 1
//        components.hour = hour
//        dateComponents.minute = minute
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)

        // show this notification five seconds from now
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.5, repeats: false)

        // choose a random identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        // add our notification request
        UNUserNotificationCenter.current().add(request)
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}

