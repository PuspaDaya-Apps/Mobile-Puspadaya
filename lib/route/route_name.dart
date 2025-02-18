// ignore_for_file: constant_identifier_names

//! contoh variabel 'const String EXAMPLE = "/ExamplePage";'

const String SPLASHSCREEN = "/";
const String ONBOARDING = "/OnBoarding";
const String LOGIN = "/Login";
const String HOMEEXAMPLE = "/HomeExample";

const String ERRORPAGE = "/ErrorPage";

// ! login workflow
const String OTP = "/login/codeOTP";
const String RESET_PASSWORD = "/login/reset-password";
const String JADWAL = '/jadwal';
const String CREATE_JADWAL = '/jadwal/create';
const String EDIT_JADWAL = '/jadwal/edit';
const String HOME = "/home";
const String KEBIJAKAN_PRIVASI = '/profile/kebijakan-privasi';
const String GANTI_KATA_SANDI = '/profile/ganti-kata-sandi';
const String UBAH_PROFILE = '/profile/ubah-profile';
const String CREATE_KEHADIRAN = '/pengukuran/kehadiran/create';
const String DETAIL_KEHADIRAN = '/pengukuran/kehadiran/detail';
const String UPDATE_KEHADIRAN = '/pengukuran/kehadiran/update';
const String CREATE_PENGUKURAN_ANAK = '/pengukuran/anak/create';
const String DETAIL_PENGUKURAN_ANAK = '/pengukuran/anak/detail';
const String UPDATE_PENGUKURAN_ANAK = '/pengukuran/anak/update';
const String CREATE_PENGUKURAN_IBU_HAMIL = '/pengukuran/ibu-hamil/create';
const String DETAIL_PENGUKURAN_IBU_HAMIL = '/pengukuran/ibu-hamil/detail';
const String UPDATE_PENGUKURAN_IBU_HAMIL = '/pengukuran/ibu-hamil/update';
const String CREATE_PENGUKURAN_TAMU = '/pengukuran/tamu/create';
const String DETAIL_PENGUKURAN_TAMU = '/pengukuran/tamu/detail';
const String UPDATE_PENGUKURAN_TAMU = '/pengukuran/tamu/update';
const String DETAIL_RIWAYAT_ANAK = '/pengukuran/detail-riwayat-anak';
const String DETAIL_RIWAYAT_IBU_HAMIL = '/pengukuran/detail-riwayat-ibu-hamil';
const String BEBAN_KERJA = '/beban-kerja';
const String CREATE_BEBAN_KERJA = '/beban-kerja/create';
const String DETAIL_BEBAN_KERJA = '/beban-kerja/detail';

// !kunjungan
const String KUNJUNGAN = '/kunjungan';
const String CREATE_KUNJUNGAN_STUNTING = '/kunjungan/anak-stunting/create';
const String CREATE_KUNJUNGAN_ANAK_TIDAK_HADIR =
    '/kunjungan/anak-tidak-hadir/create';
const String CREATE_KUNJUNGAN_IBU_HAMIL = '/kunjungan/ibu-hamil/create';

//! detail kunjungan done
const String DETAIL_KUNJUNGAN_STUNTING_DONE =
    '/kunjungan/anak-stunting/detail/done';
const String DETAIL_KUNJUNGAN_ANAK_TIDAK_HADIR_DONE =
    '/kunjungan/anak-tidak-hadir/detail/done';
const String DETAIL_KUNJUNGAN_IBU_HAMIL_DONE =
    '/kunjungan/ibu-hammil/detail/done';

//! detail stunting on going
const String DETAIL_KUNJUNGAN_STUNTING_ON_GOING =
    '/kunjungan/anak-stunting/detail/on-going';
const String DETAIL_KUNJUNGAN_ANAK_TIDAK_HADIR_ON_GOING =
    '/kunjungan/anak-tidak-hadir/detail/on-going';
const String DETAIL_KUNJUNGAN_IBU_HAMIL_ON_GOING =
    '/kunjungan/ibu-hammil/detail/on-going';

//! detail stunting not started
const String DETAIL_KUNJUNGAN_STUNTING_NOT_STARTED =
    '/kunjungan/anak-stunting/detail/not-started';
const String DETAIL_KUNJUNGAN_ANAK_TIDAK_HADIR_NOT_STARTED =
    '/kunjungan/anak-tidak-hadir/detail/not-started';
const String DETAIL_KUNJUNGAN_IBU_HAMIL_NOT_STARTED =
    '/kunjungan/ibu-hammil/detail/not-started';

//! register
const String REGISTER = '/register';

const String REGISTER_ORANG_TUA = '/register/orang-tua';
const String CREATE_REGISTER_ORANG_TUA = '/register/orang-tua/create';
const String DETAIL_REGISTER_ORANG_TUA = '/register/orang-tua/detail';
const String UPDATE_REGISTER_ORANG_TUA = '/register/orang-tua/update';

const String REGISTER_ANAK = '/register/anak';
const String CREATE_REGISTER_ANAK = '/register/orang-anak/create';
const String DETAIL_REGISTER_ANAK = '/register/orang-anak/detail';
const String UPDATE_REGISTER_ANAK = '/register/orang-anak/update';

const String REGISTER_PENGASUH = '/register/pengasuh';
const String CREATE_REGISTER_PENGASUH = '/register/pengasuh/create';
const String DETAIL_REGISTER_PENGASUH = '/register/pengasuh/detail';
const String UPDATE_REGISTER_PENGASUH = '/register/pengasuh/update';

const String REGISTER_IBU_HAMIL = '/register/ibu-hamil';
const String CREATE_REGISTER_IBU_HAMIL = '/register/ibu-hamil/create';
const String DETAIL_REGISTER_IBU_HAMIL = '/register/ibu-hamil/detail';
const String UPDATE_REGISTER_IBU_HAMIL = '/register/ibu-hamil/update';

const String REGISTER_ANGGOTA_KADER = '/register/anggota-kader';
const String CREATE_REGISTER_ANGGOTA_KADER = '/register/anggota-kader/create';
const String DETAIL_REGISTER_ANGGOTA_KADER = '/register/anggota-kader/detail';
const String UPDATE_REGISTER_ANGGOTA_KADER = '/register/anggota-kader/update';

//! alat ukur
const String ALAT_UKUR = '/alat-ukur';
const String CREATE_ALAT_UKUR = '/alat-ukur/create';
const String DETAIL_ALAT_UKUR = '/alat-ukur/detail';
const String UPDATE_ALAT_UKUR = '/alat-ukur/upate';

//! monitoring
const String MONITORING = '/monitoring';
const String DETAIL_MONITORING_STUNTING = '/monitoring/stunting';
const String DETAIL_MONITORING_UNDER_WEIGHT = '/monitoring/under-weight';
const String DETAIL_MONITORING_WASTING = '/monitoring/wasting';
const String DETAIL_MONITORING_IBU_HAMIL = '/monitoring/ibu-hamil';

//! parameter gizi
const String PARAMETER_GIZI = '/parameter-gizi';

//! laporan
const String LAPORAN = '/laporan';

//! eppgb,
const String EPPGBM = '/eppgbm';

//! faktor resiko
const String ANAK_FAKTOR_RESIKO = '/faktor-resiko';
const String BULAN_FAKTOR_RESIKO = '/faktor-resiko/bulan';
const String PARAMETER_FAKTOR_RESIKO = '/faktor-resiko/parameter';

// ! feature maintenacne
const String FEATURE_MAINTENANCE = '/maintenance';
