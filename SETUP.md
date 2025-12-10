# 🚦 Traffic Management System - Setup Guide

## Quick Start

### Step 1: Install Dependencies
```powershell
npm install
```

### Step 2: Configure Backend URL
Edit `src/services/api.js`:
```javascript
const API_BASE_URL = 'http://localhost:8080/api';
```
Change the URL to match your backend server.

### Step 3: Start Development Server
```powershell
npm start
```

The application will open automatically at `http://localhost:3000`

## Build for Production

```powershell
npm run build
```

This creates an optimized production build in the `build/` folder.

## Project Requirements

- Node.js 14+ 
- npm 6+
- Modern browser (Chrome, Firefox, Edge, Safari)

## Backend Requirements

Make sure your Java Spring Boot backend is running and has:
- CORS enabled
- All REST endpoints implemented
- Running on the configured port (default: 8080)

## Default Backend Endpoints

The frontend expects these endpoints to be available:

- `/api/signals/current`
- `/api/signals/change`
- `/api/signals/automatic/start`
- `/api/signals/automatic/stop`
- `/api/vehicles/counts`
- `/api/vehicles/add`
- `/api/vehicles/remove`
- `/api/emergency/activate`
- `/api/emergency/deactivate`
- `/api/pedestrian/activate`
- `/api/sensors/status`
- `/api/violations`
- `/api/logs`
- `/api/weather/mode`
- `/api/mode/night/enable`
- `/api/mode/night/disable`
- `/api/system/reset`

## Troubleshooting

### Port Already in Use
If port 3000 is in use:
```powershell
set PORT=3001 ; npm start
```

### CORS Errors
Add this to your Spring Boot application:
```java
@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/api/**")
                .allowedOrigins("http://localhost:3000")
                .allowedMethods("GET", "POST", "PUT", "DELETE");
    }
}
```

### Module Not Found
```powershell
rm -rf node_modules package-lock.json ; npm install
```

## Features Overview

✅ Real-time traffic signal visualization  
✅ Vehicle management with animations  
✅ Emergency vehicle mode  
✅ Pedestrian crossing system  
✅ Weather simulation (Rain, Fog)  
✅ Night mode with dark theme  
✅ Sensor monitoring  
✅ Violation tracking  
✅ System event logs  
✅ Automatic & manual control modes  

## Browser Support

- Chrome (latest)
- Firefox (latest)
- Edge (latest)
- Safari (latest)

## Performance

- Real-time updates every 2 seconds
- Smooth CSS animations
- Optimized React rendering
- Minimal API calls with parallel fetching

Enjoy your Traffic Management System! 🎉
