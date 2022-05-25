
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_taks_card/Controllers/controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import '../Classes/card_class.dart';
import '../Widgets/card.dart';
import '../Widgets/recent_transaction_item.dart';


class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);


  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final controller = Get.put((Controller()));


  int index = 2;


  @override
  Widget build(BuildContext context) {



    final items = <Widget>[
      Image.asset('assets/home_icon.png',),
      Image.asset('assets/discount_icon.png'),
      Image.asset('assets/qr_Icon.png'),
      Image.asset('assets/card_icon.png'),
      Image.asset('assets/user_icon.png'),
    ];


    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 25),
          child: IconButton(
            onPressed: null,
            icon: Icon(Icons.arrow_back_ios, color: Colors.black,size: 23,),
          ),
        ),
        title:Text('Card',style: TextStyle(color: Colors.black.withOpacity(.7),fontSize: 25,fontWeight: FontWeight.w700),),
        centerTitle: true,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: CircleAvatar(
              backgroundColor: Color(0xFF2CBC77),
                child: IconButton(onPressed: null, icon: Icon(Icons.add,color: Colors.white,size: 25,))),
          )
        ],
      ),

      body: CustomScrollView(
        slivers: [
          SliverList( delegate: SliverChildListDelegate(
              [
                AppCard(size: size),
                const SizedBox(height: 45,),
                Padding(

                  padding: const EdgeInsets.only(left: 20),
                  child: Text('Recent Transaction',style: TextStyle(color: Colors.black.withOpacity(.7),fontWeight: FontWeight.w700,fontSize: 20),),
                ),
                const SizedBox(height: 20,),

                FutureBuilder<CardClass?>(
                  future: controller.getData(),
                  builder: (context, snapshot) {

                    if (snapshot.hasData) {
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.data.transactions.length,
                          itemBuilder: (context, index){
                            return RecentTransactionItem(size: size,
                                shopName: snapshot.data!.data.transactions[index].shopName,
                                transactionId: snapshot.data!.data.transactions[index].transactionId,
                                paymentType: snapshot.data!.data.transactions[index].paymentType,
                                date: snapshot.data!.data.transactions[index].timestamp,
                                receivedAmount: snapshot.data!.data.transactions[index].amountRecieved.toString(),
                                spendAmount: snapshot.data!.data.transactions[index].amountSend.toString(),
                                shopLogo: snapshot.data!.data.transactions[index].shopLogo);
                          }
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    // By default, show a loading spinner.
                    return const CircularProgressIndicator();
                  },
                )
              ]
          ),)
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        index: index,
        color: Colors.white,
        backgroundColor: Colors.lightBlue.withOpacity(.5),
        buttonBackgroundColor: Color(0xFF2CBC77),

      ),
    );
  }
}


