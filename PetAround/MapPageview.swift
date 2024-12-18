import SwiftUI
import MapKit
import CoreLocation

// Modello per i luoghi pet-friendly
struct PetFriendlyPlace: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let description: String
    let category: String // Categoria (es. "Parco", "Ristorante", "Hotel")
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D? // Posizione corrente
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newLocation = locations.last else { return }
        self.location = newLocation.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
}

struct Mappa: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.8522, longitude: 14.2681), // Centro a Napoli
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    @StateObject private var locationManager = LocationManager()
    
    // Luoghi iniziali
    let petFriendlyPlaces = [
        PetFriendlyPlace(name: "Portici Dog Park", coordinate: CLLocationCoordinate2D(latitude: 40.818950, longitude: 14.352741), description: "Piazzale de lauzieres, Portici(Na), Italy", category: "park"),
        PetFriendlyPlace(name: "Grand Hotel Oriente", coordinate: CLLocationCoordinate2D(latitude: 40.842778948409624, longitude: 14.250109780400686), description: "Via Armando Diaz, 44, Naples,Italy", category: "Hotel"),
        PetFriendlyPlace(name: "Osteria La Chitarra", coordinate: CLLocationCoordinate2D(latitude: 40.845828073924096, longitude: 14.25622366200647), description: "Rampe S. Giovanni Maggiore, 1, Naples, Italy.", category: "restaurant"),
       
        PetFriendlyPlace(name: "Villa Comunale Dog Area", coordinate: CLLocationCoordinate2D(latitude: 40.830100, longitude: 14.220500), description: "Via Armando Diaz, Naples, Italy.", category: "park"),
            PetFriendlyPlace(name: "Hotel Royal Continental", coordinate: CLLocationCoordinate2D(latitude: 40.833429, longitude: 14.243849), description: "Via Partenope, 38, Naples, Italy", category: "Hotel"),
            PetFriendlyPlace(name: "Pizzeria Sorbillo", coordinate: CLLocationCoordinate2D(latitude: 40.851775, longitude: 14.257555), description: "Via dei Tribunali, 32, Naples, Italy.", category: "restaurant"),
            PetFriendlyPlace(name: "Parco Virgiliano", coordinate: CLLocationCoordinate2D(latitude: 40.799977, longitude: 14.182791), description: "Viale Virgilio, Naples, Italy", category: "park"),
            PetFriendlyPlace(name: "Hotel Romeo", coordinate: CLLocationCoordinate2D(latitude: 40.843253, longitude: 14.254874), description: "Via Cristoforo Colombo, 45, Naples, Italy", category: "Hotel"),
            PetFriendlyPlace(name: "Trattoria Da Nennella", coordinate: CLLocationCoordinate2D(latitude: 40.839198, longitude: 14.246435), description: "Vico Lungo Teatro Nuovo, 103/104, Naples, Italy.", category: "restaurant"),
            PetFriendlyPlace(name: "Dog Park Arenella", coordinate: CLLocationCoordinate2D(latitude: 40.857200, longitude: 14.218300), description: "Via Domenico Fontana, Naples, Italy", category: "park"),
            PetFriendlyPlace(name: "B&B Napoli Plebiscito", coordinate: CLLocationCoordinate2D(latitude: 40.835861, longitude: 14.247942), description: "Piazza del Plebiscito, Naples, Italy.", category: "Hotel"),
            
            // Torre del Greco, Portici ed Ercolano: migliorata la distanza
            PetFriendlyPlace(name: "Parco delle Ginestre", coordinate: CLLocationCoordinate2D(latitude: 40.779500, longitude: 14.375000), description: "Via delle Ginestre, Torre del Greco, Italy", category: "park"),
            PetFriendlyPlace(name: "Hotel Poseidon", coordinate: CLLocationCoordinate2D(latitude: 40.783000, longitude: 14.367000), description: "Via Cesare Battisti, 80, Torre del Greco, Italy", category: "Hotel"),
            PetFriendlyPlace(name: "Ristorante Il Grottino", coordinate: CLLocationCoordinate2D(latitude: 40.801000, longitude: 14.335500), description: "Via Nazionale, Torre del Greco, Italy", category: "restaurant"),
            PetFriendlyPlace(name: "Lido Balnearea", coordinate: CLLocationCoordinate2D(latitude: 40.809500, longitude: 14.350400), description: "Corso Resina, Ercolano, Italy", category: "restaurant"),
            PetFriendlyPlace(name: "Dog Park Ercolano", coordinate: CLLocationCoordinate2D(latitude: 40.799200, longitude: 14.318800), description: "Via Mario Zaro, Ercolano, Italy", category: "park"),
            PetFriendlyPlace(name: "Hotel Herculaneum", coordinate: CLLocationCoordinate2D(latitude: 40.805000, longitude: 14.340000), description: "Via Roma, Ercolano, Italy", category: "Hotel"),
            PetFriendlyPlace(name: "Ristorante Da Salvatore", coordinate: CLLocationCoordinate2D(latitude: 40.817300, longitude: 14.330000), description: "Via Libertà, Portici, Italy", category: "restaurant"),
            PetFriendlyPlace(name: "B&B La Terrazza", coordinate: CLLocationCoordinate2D(latitude: 40.822000, longitude: 14.350000), description: "Via Cavour, 19, Portici, Italy", category: "Hotel"),
            PetFriendlyPlace(name: "Parco del Miglio d’Oro", coordinate: CLLocationCoordinate2D(latitude: 40.796000, longitude: 14.356000), description: "Corso Resina, Ercolano, Italy", category: "park"),
        PetFriendlyPlace(name: "Parco Archeologico di Ercolano", coordinate: CLLocationCoordinate2D(latitude: 40.805721, longitude: 14.341283), description: "Via dei Papiri Ercolanesi, Ercolano, Italy", category: "park"),
            PetFriendlyPlace(name: "Giardino Botanico di Portici", coordinate: CLLocationCoordinate2D(latitude: 40.817980, longitude: 14.342580), description: "Via Università, Portici, Italy", category: "park"),
            PetFriendlyPlace(name: "Parco Salvo D’Acquisto", coordinate: CLLocationCoordinate2D(latitude: 40.796450, longitude: 14.373900), description: "Via Benedetto Cozzolino, Torre del Greco, Italy", category: "park"),
            PetFriendlyPlace(name: "La Braceria Vesuvio", coordinate: CLLocationCoordinate2D(latitude: 40.820700, longitude: 14.339900), description: "Via Armando Diaz, Portici, Italy", category: "restaurant"),
            PetFriendlyPlace(name: "Ristorante La Vela Blu", coordinate: CLLocationCoordinate2D(latitude: 40.789400, longitude: 14.354600), description: "Via Litoranea, Torre del Greco, Italy", category: "restaurant"),
            PetFriendlyPlace(name: "Pizzeria Vesuvio", coordinate: CLLocationCoordinate2D(latitude: 40.802600, longitude: 14.337800), description: "Corso Resina, Ercolano, Italy", category: "restaurant"),
            PetFriendlyPlace(name: "Osteria Vesuviana", coordinate: CLLocationCoordinate2D(latitude: 40.814900, longitude: 14.331200), description: "Via San Cristoforo, Portici, Italy", category: "restaurant"),
            PetFriendlyPlace(name: "Villa Signorini Relais", coordinate: CLLocationCoordinate2D(latitude: 40.811200, longitude: 14.340700), description: "Via Roma, 43, Ercolano, Italy", category: "Hotel"),
            PetFriendlyPlace(name: "Palazzo Rosenthal Vesuview", coordinate: CLLocationCoordinate2D(latitude: 40.794000, longitude: 14.414300), description: "Via Fossa della Monica, Torre del Greco, Italy", category: "Hotel"),
            PetFriendlyPlace(name: "Hotel Il Quadrifoglio", coordinate: CLLocationCoordinate2D(latitude: 40.816700, longitude: 14.346500), description: "Via Libertà, Portici, Italy", category: "Hotel"),
            PetFriendlyPlace(name: "Casa Rossa 1888", coordinate: CLLocationCoordinate2D(latitude: 40.800100, longitude: 14.368900), description: "Via Benedetto Cozzolino, Ercolano, Italy", category: "Hotel"),
            PetFriendlyPlace(name: "Parco Europa", coordinate: CLLocationCoordinate2D(latitude: 40.810200, longitude: 14.326400), description: "Via Europa, Portici, Italy", category: "park"),
            PetFriendlyPlace(name: "Villa delle Ginestre", coordinate: CLLocationCoordinate2D(latitude: 40.789800, longitude: 14.379100), description: "Via Villa delle Ginestre, Torre del Greco, Italy", category: "park")
        ]
    
    @State private var placesToShowOnMap: [PetFriendlyPlace] = []
    
    var body: some View {
        ZStack {
            // Mappa con annotazioni dinamiche
            Map(coordinateRegion: $region, annotationItems: placesToShowOnMap + userLocationAnnotation) { place in
                MapAnnotation(coordinate: place.coordinate) {
                    VStack {
                        if place.name == "My Location" {
                            // Pin stile Apple Maps (con ombra blu)
                            Image(systemName: "location.circle.fill")
                                .foregroundColor(.accent) // Colore rosso come Apple Maps
                                .font(.title)
                                .padding(1)
                                .background(Circle().fill(Color.white).shadow(color: .blue, radius: 10, x: 0, y: 0)) // Ombra blu
                        } else {
                            Image(systemName: "pawprint.circle.fill")
                                .foregroundColor(.accentColor)
                                .font(.title)
                                .padding(1)
                                .background(Circle().fill(Color.white))
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                placesToShowOnMap = Array(petFriendlyPlaces.prefix(3))
            }
            
            // Pulsante per centrare la posizione
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: centerOnUserLocation) {
                        Image(systemName: "location.fill")
                            .font(.system(size: 24))
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(radius: 5)
                    }
                    .padding()
                }
            }
        }
        // Sheet per i luoghi pet-friendly
        .sheet(isPresented: .constant(true)) {
            BottomSheetView(petFriendlyPlaces: petFriendlyPlaces, placesToShowOnMap: $placesToShowOnMap)
                .presentationDetents([.height(150), .large])
                .presentationDragIndicator(.automatic)
                .presentationBackgroundInteraction(.enabled)
        }
    }
    
    // Funzione per ottenere l'annotazione della posizione utente
    var userLocationAnnotation: [PetFriendlyPlace] {
        guard let userLocation = locationManager.location else { return [] }
        return [PetFriendlyPlace(name: "My Location", coordinate: userLocation, description: "Your current location", category: "user")]
    }
    
    func centerOnUserLocation() {
        if let userLocation = locationManager.location {
            region.center = userLocation
        }
    }
}

struct BottomSheetView: View {
    @State private var searchQuery: String = ""
    let petFriendlyPlaces: [PetFriendlyPlace]
    @Binding var placesToShowOnMap: [PetFriendlyPlace]
    
    var filteredPlaces: [PetFriendlyPlace] {
        if searchQuery.isEmpty {
            return petFriendlyPlaces
        } else {
            return petFriendlyPlaces.filter { $0.category.localizedCaseInsensitiveContains(searchQuery) }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(filteredPlaces) { place in
                            NavigationLink(destination: destinationView(for: place)) {
                                HStack {
                                    Image(systemName: "pawprint.circle.fill")
                                        .font(.system(size: 30))
                                        .foregroundColor(.accentColor)
                                    VStack(alignment: .leading) {
                                        Text(place.name)
                                            .font(.system(size: 14))
                                            .bold()
                                            .foregroundColor(.black)
                                        Text(place.description)
                                            .font(.system(size: 12))
                                            .foregroundColor(.gray)
                                    }
                                    Spacer()
                                }
                                .padding()
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(10)
                                .padding(.horizontal)
                            }
                        }
                    }
                }
            }
            .onChange(of: searchQuery) { _ in
                updateMapWithFilteredPlaces()
            }
            .searchable(text: $searchQuery, prompt: "Looking for pet-friendly places...")
            .navigationTitle("Pet-Friendly Places")
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
    func updateMapWithFilteredPlaces() {
        placesToShowOnMap = filteredPlaces
    }
    
    func destinationView(for place: PetFriendlyPlace) -> some View {
           switch place.category {
           case "park":
               return AnyView(DogParkView())
           case "Hotel":
               return AnyView(Location2())
           case "restaurant":
               return AnyView(location3())
           default:
               return AnyView(Text("Dettagli non disponibili"))
           }
       }
   }


#Preview {
    Mappa()
}

