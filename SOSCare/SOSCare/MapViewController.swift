import UIKit
import MapKit
import SnapKit
import CoreLocation
import GoogleMaps
import GooglePlaces
import MJSnackBar

//class CustomPin:NSObject,MKAnnotation{
//    var coordinate: CLLocationCoordinate2D
//    var title:String?
//    var subtitle: String?
//     init(coordinate:CLLocationCoordinate2D,title:String?,subtitle: String?) {
//        self.title = title
//        self.subtitle = subtitle
//        self.coordinate = coordinate
//    }
// }


 class MapViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {
    let navBar = UINavigationBar()
    let menuBtn = UIButton()
    var locationManager = CLLocationManager()
    let initialLocation = CLLocation(latitude: 39.808320, longitude: -104.933868)
    let regionRadius: CLLocationDistance = 1000
    var rectangle = GMSPolyline()
    let sackbar : MJSnackBar! = nil
    static let API_KEY = "AIzaSyB8EFqiHtO8BC7S7DIMsmKR-AJZAX_EkEw"
    override func viewDidLoad() {
        super.viewDidLoad()
//        GMSServices.provideAPIKey("AIzaSyAzNpQj_I9dOnRbTp-dxv7DY1gdiDS5xbg")
//        GMSPlacesClient.provideAPIKey("AIzaSyAzNpQj_I9dOnRbTp-dxv7DY1gdiDS5xbg")
        var mapView = GMSMapView()
        let snackBar = MJSnackBar(onView: mapView)

        self.view.addSubview(navBar)
           navBar.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self.view.snp.top).offset(20)
            make.left.equalTo(self.view.snp.left).offset(0)
            make.right.equalTo(self.view.snp.right).offset(0)
            make.height.equalTo(44)
        }
        self.view.addSubview(menuBtn)
        menuBtn.snp.makeConstraints{(make)-> Void in
            make.top.equalTo(navBar.snp.top).offset(8)
            make.left.equalTo(navBar.snp.left).offset(8)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        menuBtn.backgroundColor = UIColor.clear
        menuBtn.setImage(UIImage(named:"ic_menu_btn"), for: .normal)
        self.view.addSubview(mapView)
        mapView.snp.makeConstraints{(make)-> Void in
            make.top.equalTo(navBar.snp.bottom).offset(0)
            make.left.equalTo(self.view.snp.left).offset(0)
            make.right.equalTo(self.view.snp.right).offset(0)
            make.bottom.equalTo(self.view.snp.bottom).offset(0)
        }
        let camera :GMSCameraPosition =  GMSCameraPosition.camera(withLatitude: 28.613939, longitude:77.209021,zoom: 10)
            let mapview = GMSMapView.map(withFrame:.zero, camera: camera)
            mapView.camera = camera
            let initialLocation = CLLocationCoordinate2D(latitude:28.613939,longitude: 77.209021)
            var  marker = GMSMarker(position: initialLocation)
            marker.title = "India"
            marker.snippet = "New Delhi"
            let pinColor = UIColor.red
            marker.icon = GMSMarker.markerImage(with: pinColor)
            marker.map = mapview
            mapView = mapview
            let destinationLocation = CLLocationCoordinate2D(latitude:28.631890,longitude: 77.248927)
            marker = GMSMarker(position: destinationLocation)
            marker.title = "India"
            marker.snippet = "Ghaziabad"
            marker.icon = GMSMarker.markerImage(with: pinColor)
            marker.map = mapview
            mapView = mapview
//            let sourceLat = "28.613939"
//            let sourceLong = "77.209021"
//            let destLat = "28.669156"
//            let destLong = "77.453758"
//            let acoordinate = "\(sourceLat),\(sourceLong)"
//            let bcoordinate = "\(destLat),\(destLong)"
        let stringUrl = "https://maps.googleapis.com/maps/api/directions/json?origin=\(28.613939),\(77.209021)&destination=\(28.631890),\(77.248927)&key=\(MapViewController.API_KEY)"
            guard let getUrl = URL(string: stringUrl)else {
                print("error")
                return
            }
            let urlRequest = URLRequest(url: getUrl)
        
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            //urlsession provides an api to download the content
            let task =  session.dataTask(with: urlRequest, completionHandler:{ data,response,error in
                //session.task retrives the contets of url
                do{
                    guard let data = data else{
                        print("error")
                        return
                    }
                    
                    guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary else{
                        return
                    }
                    
                    print(json)
                    let preRoutes = json["routes"] as! NSArray
                    let routes = preRoutes[0] as! NSDictionary
                    let routeOverviewPolyline:NSDictionary = routes.value(forKey: "overview_polyline") as! NSDictionary
                    let polyString = routeOverviewPolyline.object(forKey: "points") as! String
                    
                    DispatchQueue.main.async(execute: {
                        let path = GMSPath(fromEncodedPath: polyString)
                        let polyline = GMSPolyline(path: path)
                        polyline.strokeWidth = 5.0
                        polyline.strokeColor = UIColor.green
                        polyline.map = mapView
                    })
                    
                }catch{
                    print(error.localizedDescription)
                }
            }
                
            )
        task.resume()
        
    }
    
        
        
        //        self.locationManager.requestWhenInUseAuthorization()
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager.delegate = self
//            locationManager.desiredAccuracy = kCLLocationAccuracyBest
//            locationManager.startUpdatingLocation()
//        }
//        centerMapOnLocation(location: initialLocation)
//        mapView.delegate = self
//        mapView.mapType = .standard
        
//        mapView.isZoomEnabled = true
//        mapView.isScrollEnabled = true
//        mapView.showsUserLocation = true

//        if let coor = mapView.userLocation.location?.coordinate{
//            mapView.setCenter(coor, animated: true)
//        }
        
//        let sourceLocation = CLLocationCoordinate2D(latitude:39.805240, longitude: -104.932156)
//        let destinationLocation = CLLocationCoordinate2D(latitude:39.886936, longitude:-104.811896)
//        let sourcePin = CustomPin(coordinate: sourceLocation, title: "Taco Star", subtitle: "")
//        let destinationPin = CustomPin(coordinate: destinationLocation, title: "king soapers", subtitle: "")
//        mapView.addAnnotation(sourcePin)
//        mapView.addAnnotation(destinationPin)
//        let sourcePlaceMark = MKPlacemark(coordinate:sourceLocation)
//        let destinationPlaceMark = MKPlacemark(coordinate: destinationLocation)
//        let directionRequest = MKDirectionsRequest()
//        directionRequest.source = MKMapItem(placemark: sourcePlaceMark)
//        directionRequest.destination = MKMapItem(placemark: destinationPlaceMark)
//        directionRequest.transportType = .automobile
//        let directions = MKDirections(request: directionRequest)
//        directions.calculate {(response,error) in
//            guard let directresponse = response else{
//                if let error = error{
//                    print(error)
//                }
//                return
//            }
//
//            let route = directresponse.routes[0]
//            self.mapView.add(route.polyline, level: .aboveRoads)
//            let rect = route.polyline.boundingMapRect
//            self.mapView.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
//
//        }
        
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.navBar.bounds
        gradientLayer.colors = [UIColor(hexString: "#3498DB").cgColor,UIColor(hexString:"#2ECC71").cgColor]
        navBar.layer.addSublayer(gradientLayer)
        navBar.layer.borderColor = UIColor.blue.cgColor

      }
   }

//    func centerMapOnLocation(location: CLLocation) {
//        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
//                                                                  regionRadius, regionRadius)
//        mapView.setRegion(coordinateRegion, animated: true)
//    }
    
//    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//        let renderes = MKPolylineRenderer(overlay: overlay)
//        renderes.strokeColor = UIColor.blue
//        renderes.lineWidth = 4
//        return renderes
//    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
//        mapView.mapType = MKMapType.standard
//        let span = MKCoordinateSpanMake(0.01, 0.01)
//        let region = MKCoordinateRegion(center: locValue, span: span)
//        mapView.setRegion(region, animated: true)
//
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = locValue
//        annotation.title = "Govandi"
//        annotation.subtitle = "current location"
//        mapView.addAnnotation(annotation)
//
//        //centerMap(locValue)
//    }


