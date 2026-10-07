## Konfigurasi .env (Environment Variables)

Aplikasi ini menggunakan environment variables untuk mengelola URL API dan parameter server agar kode tetap bersih.

Sebelum menjalankan aplikasi, silakan buat file bernama .env di root folder proyek (sejajar dengan pubspec.yaml), lalu masukkan konfigurasi berikut:

```env
BASE_URL=http://uruz.id
ENV_SERVER=dev
REFERRER=bodev.uruz.id
```

Catatan: Pastikan tidak ada spasi tambahan atau tanda kutip di sekitar nilai variabel.

## Fitur dan Kriteria Penilaian yang Diimplementasikan

- API Integration dan Response Handling: Menggunakan Dio untuk hit endpoint POST /api/authV5 lengkap dengan handling HTTP Status Code (200 Sukses, 401 Unauthorized, 500 Server Error).
- Secure Storage dan Route Guard: Menggunakan flutter_secure_storage untuk menyimpan data user ID/token secara enkripsi, sekaligus bertindak sebagai perantara otomatis (jika token ada langsung ke Dashboard, jika kosong ke halaman Login).
- Form Validation: Input Form dilengkapi dengan validator wajib isi dan fungsi .trim() untuk menghindari input spasi kosong.
- Error Handling dan UI Toast: Jika kredensial salah atau koneksi timeout, aplikasi akan memunculkan alert Snackbar reaktif di bagian ATAS (TOP) layar.
- Responsive UI Layout: Menggunakan Layout Constraints agar tampilan form tetap proporsional dan rapi saat dijalankan di layar HP maupun via Flutter Web/Desktop.

## Cara Menjalankan Aplikasi

1. Pastikan file .env di atas sudah dibuat.
2. Jalankan perintah untuk mengambil dependensi:
   flutter pub get
3. Run aplikasi ke device/emulator pilihan Anda:
   flutter run
