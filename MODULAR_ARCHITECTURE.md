# MODULAR DASHBOARD ARCHITECTURE

## Overview
The Traffic Management System has been restructured into a fully modular dashboard where each feature is an independent, accessible module. All modules work together seamlessly while maintaining separation of concerns.

## Architecture Structure

### Directory Layout
```
src/
├── pages/
│   ├── Dashboard.js         # Main container with centralized state management
│   └── Dashboard.css         # Dashboard layout styling
├── modules/
│   ├── TrafficMonitor.js     # Central traffic intersection visualization
│   ├── SignalControl.js      # Manual signal control and vehicle management
│   ├── EmergencyControl.js   # Emergency vehicle mode control
│   ├── PedestrianControl.js  # Pedestrian crossing control
│   ├── WeatherControl.js     # Weather mode selection
│   ├── NightModeControl.js   # Night mode toggle
│   ├── SensorMonitor.js      # Traffic sensor status display
│   ├── ViolationMonitor.js   # Traffic violation log
│   └── EventLogMonitor.js    # System event timeline
├── services/
│   └── api.js                # Backend API integration
├── components/              # Legacy components (not used in modular dashboard)
├── App.js                   # Main app entry point
└── index.js                 # React entry point
```

## Modules Description

### 1. **Dashboard** (pages/Dashboard.js)
**Purpose**: Main container that manages all system state and orchestrates module communication

**Responsibilities**:
- Centralized state management for all modules
- Backend API data fetching and polling (every 2 seconds)
- Data distribution to child modules via props
- Grid layout management

**Key State Variables**:
- `signals`: Current traffic light states (NORTH, SOUTH, EAST, WEST)
- `vehicles`: Vehicle counts per direction
- `sensors`: Sensor detection status per direction
- `emergencyActive`: Emergency mode status
- `emergencyDirection`: Active emergency vehicle direction
- `pedestrianActive`: Pedestrian crossing status
- `pedestrianCountdown`: Crossing countdown timer
- `weatherMode`: Current weather mode (NORMAL/RAIN/FOG)
- `nightMode`: Night mode enabled status
- `violations`: List of traffic violations
- `eventLogs`: System event history

### 2. **TrafficMonitor** (modules/TrafficMonitor.js)
**Purpose**: Central visualization of 4-way traffic intersection

**Features**:
- Real-time traffic light display with color-coded signals
- Animated vehicle visualization
- Lane markings and road structure
- Weather effects (rain/fog overlays)
- Night mode visual theming
- Pedestrian crossing indicators

**Props Received**:
- `signals`: Traffic light states
- `vehicles`: Vehicle counts
- `nightMode`: Night mode status
- `weatherMode`: Weather condition
- `pedestrianActive`: Pedestrian crossing status

### 3. **SignalControl** (modules/SignalControl.js)
**Purpose**: Manual control of traffic signals and vehicle management

**Features**:
- Manual signal control for all 4 directions
- Automatic mode toggle
- Add/remove vehicles per direction
- System reset functionality
- Auto mode status indicator

**API Calls**:
- `api.changeSignalManually(direction, color)`
- `api.startAutomaticMode()`
- `api.stopAutomaticMode()`
- `api.addVehicle(direction, count)`
- `api.removeVehicle(direction, count)`
- `api.resetSystem()`

### 4. **EmergencyControl** (modules/EmergencyControl.js)
**Purpose**: Activate and manage emergency vehicle mode

**Features**:
- Direction selector for emergency vehicle
- Activate/deactivate emergency mode
- Visual emergency indicators with animations
- Flashing siren graphics
- Priority lane highlighting

**API Calls**:
- `api.activateEmergency(direction)`
- `api.deactivateEmergency()`

### 5. **PedestrianControl** (modules/PedestrianControl.js)
**Purpose**: Manage pedestrian crossing requests

**Features**:
- Pedestrian crossing activation button
- Walk/Don't Walk signal display
- Countdown timer visualization
- Animated pedestrian signal graphics

**API Calls**:
- `api.activatePedestrianCrossing()`

### 6. **WeatherControl** (modules/WeatherControl.js)
**Purpose**: Select and manage weather conditions affecting traffic

**Features**:
- Weather mode selection (Normal/Rain/Fog)
- Visual mode indicators with icons
- Safety information display
- Real-time mode status

**API Calls**:
- `api.setWeatherMode(mode)`

### 7. **NightModeControl** (modules/NightModeControl.js)
**Purpose**: Toggle night mode for low-light operations

**Features**:
- Day/Night mode toggle switch
- Dark theme activation
- Blinking yellow signal mode indicator
- Animated moon/sun icon

**API Calls**:
- `api.enableNightMode()`
- `api.disableNightMode()`

### 8. **SensorMonitor** (modules/SensorMonitor.js)
**Purpose**: Display real-time traffic sensor status

**Features**:
- 4-direction sensor grid
- Vehicle detection indicators
- Animated detection status
- Color-coded sensor states

**Props Received**:
- `sensors`: Sensor detection status per direction

### 9. **ViolationMonitor** (modules/ViolationMonitor.js)
**Purpose**: Track and display traffic violations

**Features**:
- Scrollable violation log
- Severity indicators (High/Medium/Low)
- Timestamp and location information
- Violation count badge
- Auto-scrolling for new violations

**Props Received**:
- `violations`: Array of violation objects

### 10. **EventLogMonitor** (modules/EventLogMonitor.js)
**Purpose**: System event timeline and history

**Features**:
- Expandable/collapsible event log
- Categorized event icons
- Chronological event display
- Event type color coding
- Scrollable timeline

**Props Received**:
- `eventLogs`: Array of event log objects

## Data Flow Architecture

### Downward Data Flow (Props)
```
Dashboard (State)
    ↓
[Module Props Distribution]
    ↓
Individual Modules (Display)
```

### Upward Communication (Callbacks)
```
Module (User Action)
    ↓
API Call (Backend Update)
    ↓
refreshData() callback
    ↓
Dashboard (fetchSystemData)
    ↓
Updated State → Re-render Modules
```

## Module Communication Pattern

All modules follow this pattern:

1. **Receive Props**: Get current state from Dashboard
2. **User Interaction**: Handle button clicks, input changes
3. **API Call**: Send changes to backend
4. **Trigger Refresh**: Call `refreshData()` callback
5. **Re-render**: Dashboard fetches new data and updates all modules

## Layout Grid Structure

```
┌─────────────────────────────────────────────────────┐
│              HEADER (System Status)                  │
├──────────────┬─────────────────┬────────────────────┤
│              │                  │                     │
│  LEFT        │    CENTER       │    RIGHT            │
│  SIDEBAR     │    AREA         │    SIDEBAR          │
│              │                  │                     │
│ - Signal     │ - Traffic       │ - Weather           │
│   Control    │   Monitor       │   Control           │
│              │                  │ - Night Mode        │
│              │                  │ - Sensor            │
│              │                  │   Monitor           │
│              │                  │ - Violation         │
│              │                  │   Monitor           │
│              │                  │ - Event Log         │
│              │                  │                     │
├──────────────┴─────────────────┴────────────────────┤
│           BOTTOM (Emergency & Pedestrian)            │
└─────────────────────────────────────────────────────┘
```

## API Integration

All modules communicate with the backend through the centralized `api.js` service:

**Base URL**: `http://localhost:8080/api`

**Endpoints Used**:
- GET `/signals/current` - Current signal states
- POST `/signals/change` - Change signal manually
- GET `/signals/automatic/status` - Check auto mode status
- POST `/signals/automatic/start` - Start automatic mode
- POST `/signals/automatic/stop` - Stop automatic mode
- GET `/vehicles` - Get vehicle counts
- POST `/vehicles/add` - Add vehicles
- POST `/vehicles/remove` - Remove vehicles
- GET `/sensors` - Get sensor status
- GET `/emergency/status` - Emergency mode status
- POST `/emergency/activate` - Activate emergency
- POST `/emergency/deactivate` - Deactivate emergency
- GET `/pedestrian/status` - Pedestrian status
- POST `/pedestrian/activate` - Activate crossing
- GET `/weather` - Get weather mode
- POST `/weather` - Set weather mode
- GET `/nightmode` - Night mode status
- POST `/nightmode/enable` - Enable night mode
- POST `/nightmode/disable` - Disable night mode
- GET `/violations` - Get violations
- GET `/logs` - Get event logs
- POST `/reset` - Reset system

## Styling Architecture

Each module has its own CSS file with:
- **Isolated Styles**: Module-specific classes
- **Animations**: Custom keyframe animations
- **Responsive Design**: Grid/flexbox layouts
- **Color Themes**: Consistent color palette
- **Hover Effects**: Interactive feedback
- **Transitions**: Smooth state changes

**Color Palette**:
- Primary: `#2196f3` (Blue)
- Success: `#4caf50` (Green)
- Warning: `#ff9800` (Orange)
- Danger: `#f44336` (Red)
- Info: `#00bcd4` (Cyan)
- Night: `#ffd700` (Gold)

## Benefits of Modular Architecture

1. **Separation of Concerns**: Each module handles a specific feature
2. **Independent Development**: Modules can be developed and tested separately
3. **Easy Maintenance**: Changes to one module don't affect others
4. **Reusability**: Modules can be reused in other dashboards
5. **Scalability**: New modules can be added without restructuring
6. **Clear Data Flow**: Props down, callbacks up pattern
7. **Centralized State**: Single source of truth in Dashboard
8. **API Abstraction**: Backend changes isolated to api.js

## Running the Modular Dashboard

```bash
# Install dependencies
npm install

# Start development server
npm start

# Access dashboard
http://localhost:3000
```

## Module Access

All modules are accessible from the main dashboard at `http://localhost:3000`

Each module is a separate visual component on the dashboard and can be:
- **Viewed independently**: Each module is self-contained
- **Interacted with**: Each module has its own controls
- **Monitored**: Real-time updates every 2 seconds
- **Styled separately**: Each module has unique styling

## Future Enhancements

Potential additions to the modular system:
1. **Analytics Module**: Traffic statistics and charts
2. **Map Module**: Geographical traffic view
3. **Settings Module**: System configuration panel
4. **User Management Module**: Admin controls
5. **Notification Module**: Alert center
6. **History Module**: Historical data analysis
7. **Export Module**: Data export functionality
8. **Report Module**: Automated report generation

---

**Version**: 2.0  
**Last Updated**: 2024  
**Architecture**: Modular Dashboard  
**Framework**: React 18.2.0
