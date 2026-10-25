EESchema Schematic File Version 4
LIBS:power
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
Sheet 1 1
Title "HoloMotion Gesture Controller"
Comment1 "ESP32-S3 + BMI270 + PCM5102A + capacitive pinch"
Comment2 "Prototype module-level wiring; verify exact DevKit pinout before PCB fabrication"
Comment3 "HoloMotion"
$EndDescr
Text Notes 900 900 0 120 ~ 24
HOLOMOTION GESTURE CONTROLLER — MODULE-LEVEL SCHEMATIC
Text Notes 900 1250 0 70 ~ 12
Use 3V3 logic throughout. USB-C 5V powers the ESP32-S3 DevKit; its regulated 3V3 rail powers BMI270 and PCM5102A.
Text Notes 900 1550 0 80 ~ 16
ESP32-S3 DEVKIT-C1 (U1)
Text Notes 900 1800 0 60 ~ 12
GPIO8 SDA ───────────── BMI270 SDA (U2)
Text Notes 900 1950 0 60 ~ 12
GPIO9 SCL ───────────── BMI270 SCL (U2)
Text Notes 900 2100 0 60 ~ 12
GPIO4 IMU_INT1 ──────── BMI270 INT1 (U2)
Text Notes 900 2250 0 60 ~ 12
GPIO5 TOUCH_THUMB ───── copper electrode E1
Text Notes 900 2400 0 60 ~ 12
GPIO6 TOUCH_INDEX ───── copper electrode E2
Text Notes 900 2550 0 60 ~ 12
GPIO16 I2S_BCLK ─────── PCM5102A BCK (U3)
Text Notes 900 2700 0 60 ~ 12
GPIO17 I2S_LRCLK ────── PCM5102A LRCK (U3)
Text Notes 900 2850 0 60 ~ 12
GPIO18 I2S_DOUT ─────── PCM5102A DIN (U3)
Text Notes 900 3200 0 80 ~ 16
POWER / GROUND
Text Notes 900 3450 0 60 ~ 12
USB-C VBUS 5V → U1 5V; U1 3V3 → U2 VDD/VDDIO and U3 AVDD/DVDD
Text Notes 900 3600 0 60 ~ 12
Place C1 100uF + C2 100nF at 3V3 entry; add 100nF local to U2 and U3.
Text Notes 900 3950 0 80 ~ 16
AUDIO OUTPUT
Text Notes 900 4200 0 60 ~ 12
U3 PCM5102A LOUT/ROUT → J1 3.5 mm TRS line output (tip=L, ring=R, sleeve=GND)
Text Notes 900 4350 0 60 ~ 12
For a speaker, feed J1 into a separate powered class-D amplifier module.
Text Notes 900 4800 0 80 ~ 16
FIRMWARE GESTURE MAPPING
Text Notes 900 5050 0 60 ~ 12
gyro X/Y → rotation; acceleration magnitude → expansion; E1+E2 contact → pinch; yaw trend → color; pinch edge → next shape
Text Notes 900 5400 0 55 ~ 12
WARNING: this is a module-level prototype schematic, not a production-ready PCB. Confirm the exact ESP32-S3 DevKit-C1 revision and pin breakout.
$EndSCHEMATC
