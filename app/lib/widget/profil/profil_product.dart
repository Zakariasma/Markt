import 'package:flutter/material.dart';
import 'package:markt/widget/profil/switch_button.dart';

class ProfilProduct extends StatefulWidget {
  const ProfilProduct({super.key});

  @override
  State<ProfilProduct> createState() => _ProfilProductState();
}

class _ProfilProductState extends State<ProfilProduct> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(right: 10, left: 10, top: 20),
      child:Column(
        children:[
          SwitchButton(),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            child: Wrap(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  margin: EdgeInsets.only(left:5, right:5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepOrange,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
