import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yasam_verileri/includes/designs.dart';
import 'package:yasam_verileri/methods/text_methods.dart';
import 'package:yasam_verileri/methods/utils.dart';
import 'package:yasam_verileri/screens/mobile_screens/settings.dart';
import 'package:yasam_verileri/screens/tavsiye_page.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  int? vakit;
  int? sigara;
  int? boy;
  int? kilo;
  bool? sosyal;
  String? isim;
  int? spor;
  bool positionControl = true;
  bool positionControl2 = false;
  int positionDuration = 1000;
  double opacityLevelFirst = 0.0;
  double opacityLevelSec = 0.0;
  bool heightAnimationControl = false;

  final data = GetStorage();

  void getData() {
    if (data.read('vakit') != null) {
      vakit = data.read('vakit').toInt();
      sigara = data.read('sigara').toInt();
      boy = data.read('boy').toInt();
      kilo = data.read('kilo').toInt();
      sosyal = data.read('sosyal');
      isim = data.read('isim');
      spor = data.read('spor').toInt();
    }
  }

  void animations() async {
    try {
      setState(() {
        positionControl = false;
      });

      await Future.delayed(
        const Duration(milliseconds: 1500),
      );
      setState(() {
        opacityLevelFirst = 1.0;
      });
      await Future.delayed(
        const Duration(seconds: 5),
      );
      setState(() {
        opacityLevelFirst = 0.0;
      });
      await Future.delayed(const Duration(milliseconds: 1500));
      setState(() {
        opacityLevelSec = 1.0;
      });
      await Future.delayed(const Duration(seconds: 4));
      setState(() {
        opacityLevelSec = 0.0;
      });
      await Future.delayed(const Duration(milliseconds: 750));
      setState(() {
        positionDuration = 250;
        positionControl2 = true;
        heightAnimationControl = true;
      });
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    getData();
    Future.delayed(Duration.zero, () {
      animations();
    });
  }

  @override
  Widget build(BuildContext context) {
    double bRadius = 24;
    double radius = 28;
    double padding = 8;
    double paddingHorizontal = 30;

    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: TextMethods().headText(
          text: 'Yaşam Verileri',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const SettingsPageMobile());
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 30,
                    borderRadius: BorderRadius.circular(bRadius),
                    child: Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(bRadius),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          AnimatedPositioned(
                            duration: Duration(milliseconds: positionDuration),
                            bottom: 0,
                            right: positionControl2 == true
                                ? 0
                                : positionControl == true
                                    ? -1000
                                    : -150,
                            top: 0,
                            left: 0,
                            child: Image.asset('images/doctor.png'),
                          ),
                          Positioned(
                            left: 0,
                            child: AnimatedOpacity(
                              opacity: opacityLevelFirst,
                              duration: const Duration(milliseconds: 500),
                              child: MyDesigns().speakBaloon(
                                  text:
                                      'Merhaba $isim!\nVerilerin işleme alındı.\nSeninle birazdan\n ilgileneceğim..'),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            child: AnimatedOpacity(
                              opacity: opacityLevelSec,
                              duration: const Duration(milliseconds: 500),
                              child: MyDesigns().speakBaloon(
                                  text:
                                      'Verilerine kısa bir\ngöz geçirdim..\nTavsiyelerin hazır! '),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AnimatedContainer(
                    height: heightAnimationControl == false
                        ? 0.01
                        : sigara == 0
                            ? 250
                            : 350,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        sigara == 0
                            ? Container()
                            : Bounceable(
                                onTap: () {
                                  Get.to(() => TavsiyePage(
                                      konu: 'sigara',
                                      imagePath: 'images/no-smoking.png',
                                      durum: MyUtils()
                                          .sigara(sigara: sigara!.toDouble())));
                                },
                                child: ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: padding,
                                      horizontal: paddingHorizontal),
                                  leading: CircleAvatar(
                                    radius: radius,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage: const AssetImage(
                                        'images/no-smoking.png'),
                                  ),
                                  title: TextMethods().standartText(
                                      text: 'Sigara ile ilgili Tavsiyeler'),
                                  trailing: const Icon(Icons.arrow_forward),
                                ),
                              ),
                        sigara == 0
                            ? Container()
                            : const Divider(
                                thickness: 2,
                              ),
                        Bounceable(
                          onTap: () {
                            Get.to(() => TavsiyePage(
                                konu: 'spor',
                                imagePath: 'images/sport.png',
                                durum: MyUtils().spor(spor: spor!.toDouble())));
                          },
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: padding,
                                horizontal: paddingHorizontal),
                            leading: CircleAvatar(
                              radius: radius,
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  const AssetImage('images/sport.png'),
                            ),
                            title: TextMethods().standartText(
                                text: 'Spor ile ilgili Tavsiyeler'),
                            trailing: const Icon(Icons.arrow_forward),
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                        ),
                        Bounceable(
                          onTap: () {
                            Get.to(() => TavsiyePage(
                                konu: 'kilo',
                                imagePath: 'images/height.png',
                                durum: MyUtils().vucutKitleIndexDurum(
                                    vucutKitleIndex: MyUtils()
                                        .vucutKitleIndexHesapla(
                                            boy: boy!, kilo: kilo!))));
                          },
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: padding,
                                horizontal: paddingHorizontal),
                            leading: CircleAvatar(
                              radius: radius,
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  const AssetImage('images/height.png'),
                            ),
                            title: TextMethods().standartText(
                                text: 'Kilo ile ilgili Tavsiyeler'),
                            trailing: const Icon(Icons.arrow_forward),
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                        ),
                        Bounceable(
                          onTap: () {
                            Get.to(() => TavsiyePage(
                                konu: 'vakit',
                                imagePath: 'images/yoga.png',
                                durum: MyUtils().vakitVeSosyal(
                                    vakit: vakit!.toDouble(),
                                    sosyal: sosyal!)));
                          },
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: padding,
                                horizontal: paddingHorizontal),
                            leading: CircleAvatar(
                              radius: radius,
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  const AssetImage('images/yoga.png'),
                            ),
                            title: TextMethods().standartText(
                                text: 'Vakit ile ilgili Tavsiyeler'),
                            trailing: const Icon(Icons.arrow_forward),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
