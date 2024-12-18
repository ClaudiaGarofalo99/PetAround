import SwiftUI
import MapKit
import CoreLocation

// Modello per i luoghi pet-friendly
struct PetFriendlyPlace: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let description: String
    let category: String // Nuova proprietà per la categoria (es. "Parco", "Ristorante", "Hotel")
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    
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
    let petFriendlyPlaces = [
        PetFriendlyPlace(name: "Portici Dog Park", coordinate: CLLocationCoordinate2D(latitude:  14.352741, longitude: 40.818950), description: "Piazzale de lauzieres, Portici(Na), Italy", category: "park"),
        PetFriendlyPlace(name: "Grand Hotel Oriente", coordinate: CLLocationCoordinate2D(latitude: 40.842778948409624, longitude: 14.250109780400686), description: "Via Armando Diaz, 44, Naples,Italy", category: "Hotel"),
        PetFriendlyPlace(name: "Osteria La Chitarra", coordinate: CLLocationCoordinate2D(latitude: 40.845828073924096, longitude:  14.25622366200647), description: "Rampe S. Giovanni Maggiore, 1, Naples, Italy.", category: "restaurant"),
        
 
        PetFriendlyPlace(name: "Villa Comunale Dog Area", coordinate: CLLocationCoordinate2D(latitude: 40.832458, longitude: 14.227895), description: "Via Armando Diaz, Naples, Italy.", category: "park"),
        PetFriendlyPlace(name: "Hotel Royal Continental", coordinate: CLLocationCoordinate2D(latitude: 40.833429, longitude: 14.243849), description: "Via Partenope, 38, Naples, Italy", category: "Hotel"),
        PetFriendlyPlace(name: "Pizzeria Sorbillo", coordinate: CLLocationCoordinate2D(latitude: 40.851775, longitude: 14.257555), description: "Via dei Tribunali, 32, Naples, Italy.", category: "restaurant"),
        PetFriendlyPlace(name: "Parco Virgiliano", coordinate: CLLocationCoordinate2D(latitude: 40.799977, longitude: 14.182791), description: "Viale Virgilio, Naples, Italy", category: "park"),
        PetFriendlyPlace(name: "Hotel Romeo", coordinate: CLLocationCoordinate2D(latitude: 40.843253, longitude: 14.254874), description: "Via Cristoforo Colombo, 45, Naples, Italy ", category: "Hotel"),
        PetFriendlyPlace(name: "Trattoria Da Nennella", coordinate: CLLocationCoordinate2D(latitude: 40.839198, longitude: 14.246435), description: "Vico Lungo Teatro Nuovo, 103/104, Naples, Italy.", category: "restaurant"),
        PetFriendlyPlace(name: "Dog Park Arenella", coordinate: CLLocationCoordinate2D(latitude: 40.859756, longitude: 14.227865), description: "Via Domenico Fontana, Naples, Italy", category: "park" ),
        PetFriendlyPlace(name: "B&B Napoli Plebiscito", coordinate: CLLocationCoordinate2D(latitude: 40.835861, longitude: 14.247942), description: "Piazza del Plebiscito, Naples, Italy.", category: "Hotel"),
        PetFriendlyPlace(name: "Parco della Residenza", coordinate: CLLocationCoordinate2D(latitude: 40.852390, longitude: 14.263914), description: "Via Residenza, Naples, Italy", category: "park"),
           PetFriendlyPlace(name: "Hotel San Francesco", coordinate: CLLocationCoordinate2D(latitude: 40.833836, longitude: 14.261313), description: "Via Santa Maria La Nova, 1, Naples, Italy", category: "Hotel"),
           PetFriendlyPlace(name: "Ristorante La Lazzara", coordinate: CLLocationCoordinate2D(latitude: 40.853278, longitude: 14.261772), description: "Piazza San Domenico, 2, Naples, Italy", category: "restaurant"),
           PetFriendlyPlace(name: "Parco del Cavaliere", coordinate: CLLocationCoordinate2D(latitude: 40.835130, longitude: 14.258009), description: "Via Mergellina, Naples, Italy", category: "park"),
           PetFriendlyPlace(name: "Hotel Il Convento", coordinate: CLLocationCoordinate2D(latitude: 40.838177, longitude: 14.252187), description: "Vico Sant'Anna di Palazzo, Naples, Italy", category: "Hotel"),
           PetFriendlyPlace(name: "Ristorante La Piazzetta", coordinate: CLLocationCoordinate2D(latitude: 40.853467, longitude: 14.264146), description: "Piazzetta del Teatro Nuovo, Naples, Italy", category: "restaurant"),
           PetFriendlyPlace(name: "Giardini del Palazzo Reale", coordinate: CLLocationCoordinate2D(latitude: 40.839485, longitude: 14.248548), description: "Piazza del Plebiscito, Naples, Italy", category: "park"),
        PetFriendlyPlace(name: "Parco delle Colline di Napoli", coordinate: CLLocationCoordinate2D(latitude: 40.857694, longitude: 14.228585), description: "Collina dei Camaldoli, Naples, Italy", category: "park"),
            PetFriendlyPlace(name: "Hotel Excelsior", coordinate: CLLocationCoordinate2D(latitude: 40.837479, longitude: 14.242451), description: "Via Partenope, 48, Naples, Italy", category: "Hotel"),
            PetFriendlyPlace(name: "Ristorante La Cantina di Via Sapienza", coordinate: CLLocationCoordinate2D(latitude: 40.852074, longitude: 14.267401), description: "Via Sapienza, 37, Naples, Italy", category: "restaurant"),
            PetFriendlyPlace(name: "Parco della Floridiana", coordinate: CLLocationCoordinate2D(latitude: 40.818302, longitude: 14.227970), description: "Via Cimarosa, Naples, Italy", category: "park"),
            PetFriendlyPlace(name: "Hotel Il Convento", coordinate: CLLocationCoordinate2D(latitude: 40.838888, longitude: 14.255324), description: "Vico Lungo San Matteo, 8, Naples, Italy", category: "Hotel"),
            PetFriendlyPlace(name: "Ristorante Trattoria Da Lino", coordinate: CLLocationCoordinate2D(latitude: 40.848564, longitude: 14.256988), description: "Via Anticaglia, 19, Naples, Italy", category: "restaurant"),
            PetFriendlyPlace(name: "Parco del Poggio", coordinate: CLLocationCoordinate2D(latitude: 40.815516, longitude: 14.237209), description: "Piazzale del Poggio, Naples, Italy", category: "park"),
            PetFriendlyPlace(name: "Hotel Palazzo Alabardieri", coordinate: CLLocationCoordinate2D(latitude: 40.835356, longitude: 14.244961), description: "Via Alabardieri, 38, Naples, Italy", category: "Hotel"),
            PetFriendlyPlace(name: "Ristorante La Taverna del Buongustaio", coordinate: CLLocationCoordinate2D(latitude: 40.850657, longitude: 14.248329), description: "Via dei Tribunali, 16, Naples, Italy", category: "restaurant"),
            PetFriendlyPlace(name: "Parco dei Camaldoli", coordinate: CLLocationCoordinate2D(latitude: 40.868267, longitude: 14.198507), description: "Monte Sant'Angelo, Naples, Italy", category: "park")
        ]
    
    
    var petFriendlyPlacesToShowOnMap: [PetFriendlyPlace] {
            Array(petFriendlyPlaces.prefix(3))  // Mostra solo i primi 3
        }
    
    var body: some View {
        ZStack {
            // Mappa con annotazioni
            Map(coordinateRegion: $region, annotationItems: petFriendlyPlacesToShowOnMap) { place in
                            MapAnnotation(coordinate: place.coordinate) {
                    VStack {
                        Image(systemName: "pawprint.circle")
                            .foregroundColor(.accent)
                            .font(.title)
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
        // Sheet sempre visibile
        .sheet(isPresented: .constant(true)) { // La sheet è sempre attiva
            BottomSheetView(petFriendlyPlaces: petFriendlyPlaces)
                .presentationDetents([.height(150), .large]) // Detents
                .presentationDragIndicator(.automatic) // Mostra l'indicatore di drag
        }
    }
}

struct BottomSheetView: View {
    @State private var searchQuery: String = ""
    let petFriendlyPlaces: [PetFriendlyPlace]
    
    // Luoghi filtrati in base alla query di ricerca
    var filteredPlaces: [PetFriendlyPlace] {
        if searchQuery.isEmpty {
            return Array(petFriendlyPlaces.prefix(3)) // Mostra solo i primi 3 luoghi
        } else {
            return petFriendlyPlaces.filter { $0.category.localizedCaseInsensitiveContains(searchQuery) }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                // Lista di luoghi filtrati
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(filteredPlaces.isEmpty && searchQuery.isEmpty ? petFriendlyPlaces : filteredPlaces) { place in
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
            .searchable(text: $searchQuery, prompt: "Looking for pet-friendly places...")
              .navigationTitle("Pet-Friendly Places")
              .navigationBarTitleDisplayMode(.large)

        }
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
