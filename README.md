
# EV Manager

EV Manager is a **Flutter-based mobile application** designed to help **Electric Vehicle (EV) users** efficiently manage their vehicle, locate nearby charging stations, monitor battery status, and plan trips with real-time data.  
The app features a **modern neon-themed UI**, dynamic station fetching, and a personalized user dashboard.

---

## Features

### Vehicle Dashboard  
- Displays vehicle status, including:  
  - Remaining charge (%)  
  - Distance traveled  
  - Estimated range  

### Nearby Charging Stations  
- Fetches and displays nearby EV charging stations dynamically.  
- Shows station name, distance, pricing, and charger types.  
- Uses OpenChargeMap API (or any configured API).  
- Stations are sorted by nearest distance.

### Interactive Map  
- Displays EV charging stations on a real-time map.  
- Integrates Flutter Map + OpenStreetMap for location tracking.  
- Allows zooming, panning, and selecting stations for details.

### User Authentication  
- Firebase Email/Password authentication.  
- Secure login required to access the app.

### Profile & Wallet *(Upcoming)*  
- Manage user and vehicle data via Firebase.  
- Integrated wallet system for EV charging payments.

---

## Tech Stack

| Technology | Usage |
|-----------|-----------------------------|
| **Flutter** | Cross-platform mobile app framework |
| **Dart** | Programming language |
| **Firebase** | Authentication & Firestore DB |
| **OpenChargeMap API** | Fetching charging station data |
| **flutter_map** | Real-time map integration |
| **OpenStreetMap** | Mapping & geolocation |

---

## Installation & Setup

### 1. Clone the repository  
```bash
git clone https://github.com/<your-username>/ev_manager.git
cd ev_manager
```

### 2. Install dependencies  
```bash
flutter pub get
```

### 3. Set up Firebase  
- Go to [Firebase Console](https://console.firebase.google.com/)  
- Create a new project → Add Android/iOS apps.  
- Download the `google-services.json` or `GoogleService-Info.plist`.  
- Place them in the respective project directories.  

### 4. Run the app  
```bash
flutter run
```

---

## Future Enhancements

- EV charging payments with wallet and UPI integration  
- Battery health analytics for predictive performance tracking  
- Smart trip planner with optimized charging routes  
- Offline mode for previously fetched charging stations  

---

## Contributing

Contributions are welcome! If you'd like to improve EV Manager:  
1. Fork the repository  
2. Create a new branch (`feature/your-feature-name`)  
3. Commit your changes  
4. Open a Pull Request  

