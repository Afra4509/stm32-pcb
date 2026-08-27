# STM32F103 PCB Design

Repository: https://github.com/Afra4509/stm32-pcb

# Custom STM32F103C8T6 Bare-Chip Development Board

Proyek ini adalah desain custom board berbasis **STM32F103C8T6** yang disolder langsung pada PCB (bare-chip). Desain ini menggunakan template KiCad yang telah dikonfigurasi untuk power delivery, reset circuit, dan external oscillator.

## Fitur Utama Board
- **MCU**: STM32F103C8T6 (LQFP-48)
- **Regulator 3.3V**: LDO (Low Dropout) untuk konversi 5V dari USB/VIN ke 3.3V.
- **Decoupling**: 4x 100nF capacitor diletakkan sedekat mungkin dengan pin VDD, dan 10uF bulk capacitor.
- **Clock**: External Crystal 8MHz (atau 16MHz) + 2x 20pF load capacitors.
- **Bootloader**: Jumper/Switch BOOT0 dengan pull-down 10kΩ.
- **Programming**: 4-pin SWD header (3V3, SWDIO, SWCLK, GND).
- **Konektivitas**: Pin GPIO diekspos melalui header 2.54mm.

## Modifikasi yang Diperlukan (Tugas Lanjutan di KiCad)
Karena keterbatasan AI dalam membuat dan menempatkan footprint serta UUID dalam format S-Expression KiCad, Anda perlu melakukan beberapa modifikasi di KiCad Editor untuk memenuhi desain akhir:

### 1. Mengganti USB Micro-B ke USB-C
Secara default, skematik ini menggunakan **USB Micro-B**. Untuk mengubahnya ke **USB-C**:
1. Buka `STM32F103_Custom.kicad_sch` di KiCad.
2. Hapus simbol USB Micro-B.
3. Tambahkan simbol `USB_C_Receptacle_USB2.0`.
4. Hubungkan pin VBUS ke 5V dan GND ke Ground.
5. Tambahkan **dua buah resistor 5.1kΩ**. Hubungkan CC1 ke GND dan CC2 ke GND (wajib agar power 5V keluar dari host).
6. Hubungkan pin D+ ke PA12 dan D- ke PA11. Pastikan Anda memiliki resistor pull-up 1.5kΩ di D+ jika menggunakan skema full-speed USB standar (STM32 tertentu butuh ini).

### 2. Menambahkan User LED
1. Tambahkan komponen LED dan Resistor (misal 1kΩ) pada skematik.
2. Hubungkan pin anoda LED ke 3.3V.
3. Hubungkan pin katoda ke resistor, lalu ke **PC13** pada STM32 (Active Low).
4. Berikan label "USER LED".

### 3. Menambahkan User Button
1. Tambahkan komponen Push Button (SPST).
2. Hubungkan satu sisi ke GND dan sisi lainnya ke **PA0**.
3. Tambahkan resistor pull-up eksternal 10kΩ ke 3.3V pada sisi PA0, atau gunakan pull-up internal MCU.
4. Berikan label "USER BUTTON".

### 4. Layout dan Routing (PCB Editor)
Buka file `STM32F103_Custom.kicad_pcb`:
- **Placement**: Pindahkan konektor USB-C yang baru, LED, dan Button ke tempat yang mudah diakses.
- **Routing**: Rutekan (track) jalur USB-C (D+ dan D- sebagai differential pair), serta jalur GPIO ke LED dan Button.
- **GND Plane**: Board ini menggunakan copper pour untuk GND Plane di layer bawah (B.Cu).
- **Silkscreen**: Tambahkan teks indikator untuk LED, Button, dan pin 3V3/5V/GND di area Silkscreen.

## Aturan Desain (DRC / ERC)
Sebelum mengirimkan ke manufaktur (seperti JLCPCB atau PCBWay):
- Jalankan **ERC (Electrical Rules Checker)** di Schematic Editor untuk memastikan tidak ada net yang melayang (floating).
- Jalankan **DRC (Design Rules Checker)** di PCB Editor.
- Pastikan clearance antara jalur memenuhi standar manufaktur (minimal 0.15mm atau 6 mils).

## Struktur File
- `STM32F103_Custom.kicad_pro` : File proyek utama.
- `STM32F103_Custom.kicad_sch` : File skematik.
- `STM32F103_Custom.kicad_pcb` : File layout PCB.

Terima kasih, dan selamat merakit board STM32 kustom Anda!
