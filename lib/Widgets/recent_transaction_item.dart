import 'package:flutter/material.dart';

class RecentTransactionItem extends StatelessWidget {
  const RecentTransactionItem({
    Key? key,
    required this.size, required this.shopName, required this.transactionId, required this.paymentType, required this.date, required this.receivedAmount, required this.spendAmount, required this.shopLogo,
  }) : super(key: key);

  final Size size;

  final String shopName;
  final String transactionId;
  final String paymentType;
  final String date;
  final String receivedAmount;
  final String spendAmount;
  final String shopLogo;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 10),
      child: Container(
        height: size.height * .15,
        width: size.width,
        color: const Color(0xFFFBFCFE),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  child: Image.network(shopLogo),
                ),
                const SizedBox(width: 7,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(shopName,style:  TextStyle(color: Colors.black.withOpacity(.8), fontSize: 17, fontWeight: FontWeight.w500),),
                      const SizedBox(height: 6,),
                      Text('Trans ID : $transactionId',style:  TextStyle(color: Colors.black.withOpacity(.4), fontSize: 13, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 6,),
                      Row(
                        children: [
                          Image.asset('assets/digital.png'),
                          const SizedBox(width: 4,),
                          Text(paymentType,style:  TextStyle(color: Colors.black.withOpacity(.4), fontSize: 13, fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:  [
                      Text(date,style:  TextStyle(color: Colors.black.withOpacity(.4), fontSize: 14, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 6,),
                      Text(' - @  $spendAmount',style:  const TextStyle(color: Color(0xFFF07851), fontSize: 15, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 6,),
                       Text(' + @ $receivedAmount',style:  const TextStyle(color: Color(0xFF2CBC77), fontSize: 15, fontWeight: FontWeight.w700)),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}