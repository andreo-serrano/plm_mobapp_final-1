// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
// import 'package:maps_launcher/maps_launcher.dart';
import '../../widgets/appbar.dart';
import '../../widgets/button.dart';
import 'package:url_launcher/url_launcher.dart';

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  // ignore: unused_field
  static const yellow = Color(0xFFFFC909);

  final imageList = [
    'http://images.gmanews.tv/webpics/2016/03/plm_2016_03_15_15_07_52.JPG',
    'http://assets.rappler.com/612F469A6EA84F6BAE882D2B94A4B421/img/8C9C528B64444AC98381B504505B1DB1/pamantasan-lungsod-maynila.jpg',
    'http://photos.wikimapia.org/p/00/03/06/16/09_big.jpg',
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
      body: CustomSliverAppBar(
          text: 'Maps',
          image: 'assets/images/plmimage.png',
          isCenter: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              children: [
                const SizedBox(height: 30.0),
                const Text('View the vicinity map, locate our pamantasan\n in Google Maps and be familiarize with the\n different building and offices.',
                textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20.0),
                Image.asset('assets/images/vicinitymap.png', scale: 0.65),
                const SizedBox(height: 30.0),
                Image.asset('assets/images/googlemapicon.png'),
                const SizedBox(height: 10.0),
                Text('View In Google Maps', style: Theme.of(context).textTheme.titleMedium),
                const Text('Locate Pamantasan ng Lungsod ng Maynila\n using Google Maps for a better view.'),
                const SizedBox(height: 20.0),
                ButtonFill(
                    buttonText: 'View on Google Maps',
                    bgColor: Colors.amber,
                    onPressed: () {
                      const url = 'https://goo.gl/maps/7MWbvRKXEVkZBYih8';
                      launch(url.toString());
                    },
                        // () { MapsLauncher.launchQuery('General Luna, corner Muralla St, Intramuros, Manila, 1002 Metro Manila');},
                ),
                const SizedBox(height: 20.0),
                Text('Be familiarized with the different\nbuildings and offices',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center
                ),
                const SizedBox(height: 10.0),
                const Text('To see the following image, click on the right arrowhead button. And the left arrowhead button to preview back.',
                    textAlign: TextAlign.center),
                const SizedBox(height: 30),
                ConstrainedBox(
                    constraints: BoxConstraints.loose(Size(
                        MediaQuery.of(context).size.width * 0.90,
                        MediaQuery.of(context).size.width * 0.50)
                    ),
                    child: Swiper(
                      outer: false,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(imageList[index],
                            fit: BoxFit.fitWidth);
                      },
                      itemCount: imageList.length,
                      layout: SwiperLayout.TINDER,
                      itemHeight: MediaQuery.of(context).size.width * 0.50,
                      itemWidth: MediaQuery.of(context).size.width * 0.80,
                      control: const SwiperControl(),
                      pagination: const SwiperPagination(),
                    )
                )
              ],
            ),
          )
      ),

  );
}
