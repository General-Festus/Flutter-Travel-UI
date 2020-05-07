import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/models/destination.dart';
import 'package:travel_ui/models/activity.dart';

class DestinationScreen extends StatefulWidget {

  final Destination destination;
  DestinationScreen({this.destination});
  
  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  _buildRatingStars(int rating) {
    String stars = '';
    for(int i = 0;  i < rating; i++) {
       stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
              boxShadow: [BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 2.0),
              blurRadius: 6.0,
              ),]
              ),
                child: Hero(
                  tag: widget.destination.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image(
                      image: AssetImage(widget.destination.imageUrl),
                      fit: BoxFit.cover,
                        ),
                    ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30,
                      color: Colors.black,
                      onPressed: () => Navigator.pop(context),
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                      icon: Icon(Icons.search),
                      iconSize: 30,
                      color: Colors.black,
                      onPressed: () => Navigator.pop(context),
                    ),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.sortAmountDown),
                      iconSize: 25,
                      color: Colors.black,
                      onPressed: () => Navigator.pop(context),
                    ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.destination.city,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 1.2,
                    ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(FontAwesomeIcons.locationArrow,size: 15.0, color: Colors.white,),
                        SizedBox(width: 5,),
                        Text(widget.destination.country,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 20.0
                        ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20.0,
                bottom: 20.0,
                child: Icon(
                  Icons.location_on, 
                color: Colors.white70,
                size: 25.0,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10, bottom: 15.0),
              itemCount: widget.destination.activities.length,
              itemBuilder: (BuildContext context, int index) {
              Activity activity = widget.destination.activities[index];
              return Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(40, 5, 20, 5),
                    height: 170,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(100, 20, 20, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                           Container(
                             width: 120,
                             child: Text(activity.name,
                             style: TextStyle(
                               fontSize: 18.0,
                               fontWeight: FontWeight.w600, 
                             ),
                             overflow: TextOverflow.ellipsis,
                             maxLines: 2,
                             ),
                           ),
                           Column(
                             children: <Widget>[
                               Text('\$${activity.price}',
                               style: TextStyle(
                                 fontSize: 22,
                                 fontWeight:FontWeight.w600, 
                               ),),
                                Text(
                                  'per pax',
                               style: TextStyle(
                                 color: Colors.grey,
                                 fontWeight:FontWeight.w600, 
                               ),),
                             ],
                           ),
                          ],),
                          Text(
                            activity.type,
                          style: TextStyle(
                            color: Colors.grey, 
                          ),),
                          _buildRatingStars(activity.rating),
                          SizedBox(height: 10,),
                          Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(5.0),
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                 activity.startTimes[0],
                                ),
                              ),
                              SizedBox(width: 10.0,),
                               Container(
                                 padding: EdgeInsets.all(5.0),
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  activity.startTimes[1],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20.0,
                    top: 15.0,
                    bottom: 15.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        width: 110.0,
                        image: AssetImage(
                          activity.imageUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              );
              },),
          ),
        ],
      ),
    );
  }
}