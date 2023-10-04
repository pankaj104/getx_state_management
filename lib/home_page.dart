import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/controller/voting_controller.dart';

class HomePage extends StatelessWidget {
  final VotingController votingController = Get.put(VotingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX State Management'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 150,),
            Text('Enter your age:', style: TextStyle(fontSize: 18),),
            SizedBox(height: 10),
            Container(
              width: 100,
              child: TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  votingController.age.value = int.tryParse(value) ?? 0;
                },
              ),
            ),
            SizedBox(height: 20),
            Obx(() {
              return Text(
                votingController.isEligible
                    ? 'You are eligible to vote!'
                    : 'You are not eligible to vote.',
                style: votingController.isEligible ?
                TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green) :
                TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red)

              );
            }),
          ],
        ),
      ),
    );
  }
}