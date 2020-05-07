import 'package:flutter/material.dart';
import 'package:travel_ui/models/hotel.dart';
class HotelCarousel extends StatefulWidget {
  @override
  _HotelCarouselState createState() => _HotelCarouselState();
}

class _HotelCarouselState extends State<HotelCarousel> {
  @override
  Widget build(BuildContext context) {
    return Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Exclusive Hotels',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                        ),
                      GestureDetector(
                        onTap: () =>
                           print('Sell All'),
                        child: Text(
                          'See All',
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 300.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: hotels.length,
                    itemBuilder: (BuildContext context, int index){
                      Hotel hotel = hotels[index];
                      return Container(
                        margin: EdgeInsets.all(10),
                        width: 240,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: <Widget>[
                            Positioned(
                              bottom: 15.0,
                             child: Container(
                                height: 120,
                                width: 240,
                                decoration: 
                                BoxDecoration(borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text( hotel.name,
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                      ),
                                      ),
                                      SizedBox(height: 2.0,),
                                      Text(hotel.address,
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      ),
                                      SizedBox(height:2.0),
                                      Text('\$${hotel.price}/night',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 6.0,
                            ),
                          ],
                              ),
                              child:ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image(
                                  height: 180,
                                  width: 220,
                                  image: AssetImage(hotel.imageUrl),
                                  fit: BoxFit.cover,
                                    ),
                                  ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            );
  }
}