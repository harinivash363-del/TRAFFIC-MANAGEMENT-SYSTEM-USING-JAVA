# Smart Traffic Management System - Frontend

A comprehensive, interactive React-based frontend for a Traffic Management System with real-time updates and visual simulations.

## 🚀 Features

### ✨ Core Features
- **4-Way Traffic Intersection** - Realistic animated traffic signals with smooth transitions
- **Vehicle Management** - Add/remove vehicles with animated car icons
- **Real-time Updates** - Auto-polling backend every 2 seconds
- **Manual & Automatic Modes** - Switch between manual control and automatic signal management

### 🚨 Advanced Features
- **Emergency Vehicle Mode** - Priority lane with flashing animations and siren effects
- **Pedestrian Crossing** - Walk/Don't Walk signals with countdown timer and zebra crossing animations
- **Sensor Status** - Real-time vehicle detection with blinking indicators
- **Traffic Violations** - Scrollable log with timestamps and severity levels
- **Event Timeline** - Color-coded system events with expand/collapse functionality

### 🌦️ Environmental Modes
- **Weather Control** - Normal, Rain, and Fog modes with visual effects
- **Night Mode** - Dark theme with blinking yellow signals and glow effects

### 📊 Monitoring Panels
- Live violation tracking
- System event logs
- Sensor status indicators
- Connection status monitoring

## 🛠️ Installation

1. **Install Dependencies**
   ```powershell
   npm install
   ```

2. **Configure Backend URL**
   
   Edit `src/services/api.js` and update the backend URL:
   ```javascript
   const API_BASE_URL = 'http://localhost:8080/api'; // Change to your backend URL
   ```

3. **Start the Development Server**
   ```powershell
   npm start
   ```

   The app will open at `http://localhost:3000`

## 🎮 Usage

### Starting the Application

1. Make sure your Java Spring Boot backend is running
2. Start the React frontend with `npm start`
3. The UI will automatically connect and start polling the backend

### UI Layout

- **Top Header** - System title and status indicators (Auto/Manual, Emergency, Weather, Night Mode)
- **Left Panel** - Manual controls for signals, vehicles, and system management
- **Center Panel** - Main traffic intersection with animated signals and vehicles
- **Right Panel** - Monitoring (Sensors, Violations, Event Logs, Weather, Night Mode)
- **Bottom Status Bar** - Connection status and last update time

### Controls

#### Manual Signal Control
1. Select direction (North/South/East/West)
2. Select signal color (Red/Yellow/Green)
3. Click "Change Signal"

#### Vehicle Management
1. Select lane
2. Enter vehicle count
3. Click "Add Vehicles" or "Remove Vehicles"

#### Emergency Mode
1. Select emergency lane
2. Click "ACTIVATE EMERGENCY"
3. All other lanes turn RED, selected lane turns GREEN
4. Click "DEACTIVATE EMERGENCY" to return to normal

#### Pedestrian Crossing
1. Click "PRESS TO WALK"
2. All vehicle signals turn RED
3. Countdown timer shows remaining crossing time
4. Automatically returns to normal after timer expires

#### Weather Control
- Click on Weather mode buttons (Normal/Rain/Fog)
- Visual effects applied to intersection

#### Night Mode
- Toggle the Night Mode switch
- All signals change to blinking yellow
- Dark theme activated

## 🎨 UI Components

### TrafficIntersection
- 4-way intersection with roads and center box
- Animated traffic lights with glow effects
- Vehicle icons that move during green signal
- Zebra crossings that glow during pedestrian mode
- Weather effects (rain animation, fog overlay)
- Night mode with blinking yellow lights

### ControlPanel
- Signal control section
- Automatic mode toggle
- Vehicle management
- System reset

### EmergencyPanel
- Emergency activation controls
- Flashing red border when active
- Siren animation
- Status indicators

### PedestrianPanel
- Walk/Don't Walk signals
- Animated countdown timer
- Pedestrian crossing information

### SensorPanel
- Grid view of all lane sensors
- Blinking indicators for detected vehicles
- Color-coded status (Green = Detected, Grey = Clear)

### ViolationPanel
- Scrollable violation list
- Severity indicators (High/Medium/Low)
- Timestamp and lane information
- Empty state when no violations

### EventLog
- Vertical timeline of system events
- Color-coded event types
- Expand/collapse functionality
- Time-stamped entries

### WeatherPanel
- Three weather modes (Normal, Rain, Fog)
- Visual mode indicators
- Weather-specific information messages

### NightModePanel
- Animated toggle switch
- Day/Night indicators
- Night mode status information

## 🔌 API Integration

The app connects to the following backend endpoints:

### Signals
- `GET /api/signals/current` - Get current signal states
- `POST /api/signals/change` - Change signal manually
- `POST /api/signals/automatic/start` - Start automatic mode
- `POST /api/signals/automatic/stop` - Stop automatic mode
- `GET /api/signals/automatic/status` - Get automatic mode status

### Vehicles
- `GET /api/vehicles/counts` - Get vehicle counts
- `POST /api/vehicles/add` - Add vehicles
- `POST /api/vehicles/remove` - Remove vehicles

### Emergency
- `POST /api/emergency/activate` - Activate emergency mode
- `POST /api/emergency/deactivate` - Deactivate emergency mode
- `GET /api/emergency/status` - Get emergency status

### Pedestrian
- `POST /api/pedestrian/activate` - Activate pedestrian crossing
- `GET /api/pedestrian/status` - Get pedestrian status

### Sensors
- `GET /api/sensors/status` - Get all sensor statuses

### Violations
- `GET /api/violations` - Get all violations
- `DELETE /api/violations/clear` - Clear violations

### System Logs
- `GET /api/logs` - Get system logs
- `DELETE /api/logs/clear` - Clear logs

### Weather
- `POST /api/weather/mode` - Set weather mode
- `GET /api/weather/mode` - Get current weather mode

### Night Mode
- `POST /api/mode/night/enable` - Enable night mode
- `POST /api/mode/night/disable` - Disable night mode
- `GET /api/mode/night/status` - Get night mode status

### System
- `POST /api/system/reset` - Reset entire system

## 🎯 Key Features Implementation

### Real-time Updates
- Uses React hooks (useState, useEffect)
- Polls backend every 2 seconds
- Promise.allSettled for parallel API calls
- Error handling and connection status tracking

### Animations
- CSS keyframe animations for smooth transitions
- Blinking effects for warnings and alerts
- Fade-in/fade-out effects
- Transform animations for hover states

### Responsive Design
- Grid-based layout
- Breakpoints for different screen sizes
- Collapsible panels on mobile
- Scrollable panels for overflow content

## 📦 Project Structure

```
src/
├── components/
│   ├── TrafficIntersection.js
│   ├── TrafficIntersection.css
│   ├── ControlPanel.js
│   ├── ControlPanel.css
│   ├── EmergencyPanel.js
│   ├── EmergencyPanel.css
│   ├── PedestrianPanel.js
│   ├── PedestrianPanel.css
│   ├── SensorPanel.js
│   ├── SensorPanel.css
│   ├── ViolationPanel.js
│   ├── ViolationPanel.css
│   ├── EventLog.js
│   ├── EventLog.css
│   ├── WeatherPanel.js
│   ├── WeatherPanel.css
│   ├── NightModePanel.js
│   └── NightModePanel.css
├── services/
│   └── api.js
├── App.js
├── App.css
├── index.js
└── index.css
```

## 🚧 Troubleshooting

### Backend Connection Issues
- Verify backend is running on correct port
- Check `API_BASE_URL` in `src/services/api.js`
- Check browser console for CORS errors
- Ensure backend has CORS enabled

### No Data Showing
- Check connection status in bottom status bar
- Open browser DevTools and check Network tab
- Verify backend endpoints are returning data
- Check for JavaScript errors in Console tab

## 🎨 Customization

### Changing Colors
Edit the respective CSS files to change component colors. Key color variables are in gradient backgrounds.

### Adjusting Poll Interval
In `App.js`, change the interval value:
```javascript
const interval = setInterval(fetchSystemData, 2000); // Change 2000 to desired ms
```

### Modifying Backend URL
In `src/services/api.js`:
```javascript
const API_BASE_URL = 'http://your-backend-url:port/api';
```

## 📝 Notes

- The system uses in-memory storage on the backend (no database)
- All state is refreshed on page reload
- Animations are optimized for modern browsers
- Best viewed on screens 1200px or wider

## 🎉 Enjoy!

Your complete Traffic Management System frontend is ready to use. Connect it to your Spring Boot backend and experience a fully functional, visually stunning traffic control simulation!
