class MyUtils {
  double vucutKitleIndexHesapla({required int boy, required int kilo}) {
    double sonuc = kilo / (boy * boy);
    return sonuc;
  }

  String vucutKitleIndexDurum({required double vucutKitleIndex}) {
    double x = vucutKitleIndex;
    if (x <= 18.4) {
      return 'Zayıf';
    } else if (x <= 24.9 && x > 18.4) {
      return 'Normal';
    } else if (x <= 29.9 && x > 24.9) {
      return 'Kilolu';
    } else if (x <= 34.9 && x > 29.9) {
      return 'Fazla Kilolu';
    } else if (x <= 44.9 && x > 34.9) {
      return 'Şişman';
    } else if (x > 44.9) {
      return 'Fazla Şişman';
    } else {
      return 'Geçersiz index';
    }
  }

  String vakitVeSosyal({required double vakit, required bool sosyal}) {
    String res = 'Geçersiz';
    if ((vakit < 7 && vakit >= 5) && sosyal == true) {
      res = 'çok-sosyal';
    } else if ((vakit < 5 && vakit >= 2) && sosyal == true) {
      res = 'orta-sosyal';
    } else if (vakit <= 2 && sosyal == true) {
      res = 'az-sosyal';
    } else if ((vakit < 5 && vakit >= 5) && sosyal == false) {
      res = 'çok-asosyal';
    } else if ((vakit < 5 && vakit >= 2) && sosyal == false) {
      res = 'orta-asosyal';
    } else if (vakit <= 2 && sosyal == false) {
      res = 'az-asosyal';
    }
    return res;
  }

  String spor({required double spor}) {
    String res = 'Geçersiz';
    if (spor <= 2 && spor > 0) {
      res = 'az';
    } else if (spor <= 4 && spor > 2) {
      res = 'orta';
    } else if (spor <= 7 && spor > 4) {
      res = 'çok';
    } else if (spor == 0) {
      res = 'hiç';
    }
    return res;
  }

  String sigara({required double sigara}) {
    String res = 'Geçersiz';
    if (sigara <= 15 && sigara > 0) {
      res = 'az';
    } else if (sigara <= 30 && sigara > 15) {
      res = 'orta';
    } else if (sigara <= 60 && sigara > 30) {
      res = 'çok';
    } else if (sigara == 0) {
      res = 'hiç';
    }
    return res;
  }
}
