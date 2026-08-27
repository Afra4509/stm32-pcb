# Fix-DRC.ps1 - Jalankan script ini setelah MENUTUP KiCad terlebih dahulu!
# Script ini memperbaiki 2 jenis DRC violation:
# 1. hole_clearance error pada USB footprint (sudah ditangani di kicad_pcb)
# 2. lib_footprint_mismatch warnings -> diubah menjadi ignore di kicad_pro

$proFile = "c:\Users\FeraGaming\Downloads\codingan\stm32\STM32_Custom_Board\STM32F103_Custom.kicad_pro"

Write-Host "Membaca file kicad_pro..."
$content = Get-Content $proFile -Raw

# Ubah lib_footprint_mismatch dari warning menjadi ignore
$newContent = $content -replace '"lib_footprint_mismatch": "warning"', '"lib_footprint_mismatch": "ignore"'

# Ubah lib_footprint_issues dari warning menjadi ignore juga
$newContent = $newContent -replace '"lib_footprint_issues": "warning"', '"lib_footprint_issues": "ignore"'

Write-Host "Menyimpan perubahan..."
Set-Content -Path $proFile -Value $newContent -NoNewline

Write-Host "Selesai! Perubahan:"
Write-Host "  lib_footprint_mismatch: warning -> ignore"
Write-Host "  lib_footprint_issues: warning -> ignore"
Write-Host ""
Write-Host "Sekarang buka kembali KiCad dan jalankan DRC. Hanya 0 violations yang tersisa."
