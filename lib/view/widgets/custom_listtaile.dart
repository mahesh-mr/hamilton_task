import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../const/const.dart';
import '../const/size.dart';

class CustomerTaileWidget extends StatelessWidget {
  const CustomerTaileWidget({
    Key? key,
    required this.buildingNmae,
    required this.image,
    required this.customerNmae,
    required this.type,
    this.sutitleTwo = "",
    this.starRate,
  }) : super(key: key);
  final String buildingNmae;

  final String image;
  final String customerNmae;
  final String? sutitleTwo;
  final String? starRate;
  final String type;
  @override
  Widget build(BuildContext context) {
    //  final img =baseImage+image;
    // final imgs =img   ??="https://i.pngimg.me/thumb/f/720/m2H7K9A0Z5m2G6b1.jpg";
    return Container(
      padding: const EdgeInsets.all(9),
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: appBackground,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFa8a4a4).withOpacity(1),
            offset: const Offset(1, 4),
            blurRadius: 15,
            spreadRadius: -8,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(
                 image),
                  fit: BoxFit.fill),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFa8a4a4).withOpacity(1),
                  offset: const Offset(1, 4),
                  blurRadius: 15,
                  spreadRadius: -8,
                )
              ],
              // image: DecorationImage(image: NetworkImage(baseImage + image))
            ),
            
            // child: Image.network(image,
            //     errorBuilder: (context, error, stackTrace) => Padding(
            //           padding: const EdgeInsets.all(3.0),
            //           child: Image.network(
            //               "https://i.pngimg.me/thumb/f/720/m2H7K9A0Z5m2G6b1.jpg"),
            //         ),
            //     loadingBuilder: (BuildContext context, Widget child,
            //         ImageChunkEvent? loadingProgress) {
            //       if (loadingProgress == null) {
            //         return child;
            //       }
            //       return const Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     }),
          ),
          w10,
          Expanded(
            child: Container(
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    customerNmae,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(buildingNmae, style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis)),
                  Padding(
                  
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(sutitleTwo!),
                  ),
                ],
              ),
            ),
          ),
          type == "1"
              ? Container(
                  margin: const EdgeInsets.only(top: 50, right: 10),
                  height: 30,
                  width: 45,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        CupertinoIcons.star_fill,
                        size: 18,
                        color: appYellow,
                      ),
                      Text(
                        starRate!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                      //  Icon(CupertinoIcons.phone_circle_fill),
                      //  Image.asset("assets/whatsapp.png",height: 30,width: 20,)
                    ],
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
