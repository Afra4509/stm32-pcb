# Bill of Materials (BOM) - STM32F103 Custom Board

Berikut adalah daftar komponen (BOM) yang disarankan untuk merakit board ini. Anda dapat membeli komponen ini dari supplier seperti LCSC, DigiKey, Mouser, atau Tokopedia.

| Referensi | Komponen / Nilai | Footprint | Deskripsi |
| :--- | :--- | :--- | :--- |
| **U1** | **STM32F103C8T6** | LQFP-48 | Microcontroller ARM Cortex-M3 (Bare-Chip) |
| **U2** | **AMS1117-3.3** atau **AP2112K-3.3** | SOT-223 / SOT-23-5 | LDO Voltage Regulator (5V ke 3.3V) |
| **J1** | **USB-C Receptacle** | 16-pin / 6-pin | Power & Data Input (Data opsional) |
| **Y1** | **Crystal 8MHz** | SMD 5032 / HC49 | High-Speed External Clock (HSE) |
| **C1, C2** | **20pF** | 0603 / 0805 | Load Capacitor untuk Crystal Y1 |
| **C3, C4, C5, C6**| **100nF (0.1µF)** | 0603 / 0805 | Decoupling Capacitor (Dekat VDD/VDDA) |
| **C7** | **100nF (0.1µF)** | 0603 / 0805 | NRST Filter Capacitor |
| **C8, C9** | **10µF** | 0805 / 1206 | Input & Output Bulk Capacitor untuk LDO |
| **R1, R2** | **5.1kΩ** | 0603 / 0805 | Pull-down resistor untuk pin CC1 dan CC2 di USB-C |
| **R3** | **1.5kΩ** | 0603 / 0805 | Pull-up resistor untuk USB D+ (opsional/tergantung desain) |
| **R4, R5** | **10kΩ** | 0603 / 0805 | Pull-down untuk BOOT0 dan Pull-up untuk NRST/Button |
| **R6, R7** | **1kΩ - 2.2kΩ** | 0603 / 0805 | Current Limiting Resistor untuk LED |
| **LED1** | **LED Merah/Hijau** | 0603 / 0805 | Power Indicator LED |
| **LED2** | **LED Biru/Kuning** | 0603 / 0805 | User LED (Terhubung ke PC13) |
| **SW1** | **Push Button (SPST)**| SMD 3x4 / 6x6 | Reset Button |
| **SW2** | **Push Button (SPST)**| SMD 3x4 / 6x6 | User Button (Terhubung ke PA0) |
| **J2** | **Pin Header 1x4** | 2.54mm Pitch | SWD Programming Header (3V3, SWDIO, SWCLK, GND) |
| **J3, J4** | **Pin Header 1x20** | 2.54mm Pitch | GPIO Expansion Header |
| **J5** | **Pin Header 1x3** | 2.54mm Pitch | BOOT0 Selection Jumper |

## Catatan Perakitan
1. **Penyolderan MCU**: Solder IC STM32F103C8T6 terlebih dahulu menggunakan teknik drag soldering atau hot air. Perhatikan orientasi pin 1 (titik pada IC).
2. **Kapasitor Decoupling**: Tempatkan C3-C6 (100nF) sangat dekat dengan pin VDD dan VSS pada IC STM32.
3. **USB-C**: Jika Anda menyolder secara manual, pastikan tidak ada bridge (korsleting) antara pin VBUS, GND, dan D+/D-. Gunakan flux yang cukup.
