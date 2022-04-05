import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yasam_verileri/includes/designs.dart';
import 'package:yasam_verileri/methods/tavsiyeler.dart';
import 'package:yasam_verileri/methods/text_methods.dart';

class TavsiyeMobile extends StatefulWidget {
  final String konu;
  final String durum;
  final String imagePath;
  const TavsiyeMobile(
      {Key? key,
      required this.konu,
      required this.durum,
      required this.imagePath})
      : super(key: key);

  @override
  State<TavsiyeMobile> createState() => _TavsiyeMobileState();
}

class _TavsiyeMobileState extends State<TavsiyeMobile> {
  bool positionControl = true;
  int positionDuration = 1000;
  double opacityLevel = 0.0;

  void animations() async {
    if (widget.durum == 'Geçersiz' || widget.durum.isEmpty) {
      Navigator.pop(context);
      Get.snackbar(
          'Hata', 'Verilerde oluşan bir hata sebebiyle sayfa kullanılamıyor');
    } else {
      try {
        await Future.delayed(const Duration(milliseconds: 200));
        setState(() {
          positionControl = false;
        });
        await Future.delayed(const Duration(milliseconds: 1100));
        setState(() {
          opacityLevel = 1.0;
        });
      } catch (e) {}
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      animations();
    });
  }

  @override
  Widget build(BuildContext context) {
    List tavsiyeler = [];
    if (widget.durum != 'Geçersiz') {
      tavsiyeler = Tavsiyeler().saglikTavsiyeleri[widget.konu][widget.durum];
    }
    double bRadius = 24;
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: TextMethods()
            .headText(text: '${widget.konu.capitalize} için Tavsiyeler'),
        centerTitle: true,
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
                            right: positionControl == true ? -1000 : -115,
                            top: 0,
                            left: 0,
                            child: Image.asset('images/doctor2.png'),
                          ),
                          Positioned(
                            left: 0,
                            top: 5,
                            child: AnimatedOpacity(
                              opacity: opacityLevel,
                              duration: const Duration(milliseconds: 500),
                              child: MyDesigns().speakBaloon(
                                text: widget.imagePath,
                                image: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: tavsiyeler.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        color: Colors.blue.shade100,
                        elevation: 30,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: TextMethods().standartText(
                              text: '${i + 1}-) ${tavsiyeler[i]}'),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
