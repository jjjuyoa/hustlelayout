import 'package:flutter/material.dart';

class memberPage extends StatelessWidget {
  final String universityName;
  final String clubNames;

  memberPage({
    required this.universityName,
    required this.clubNames,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Member Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: _clubProfile(),
                ),
                Container(
                  child: Image.asset('assets/hustleRogo.png'),
                ),
              ],
            ),
            Container(),
          ],
        ),
      ),
    );
  }

  Widget _clubProfile(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('aaaaaaaaa'),
        Text('aaaaaaaaa'),
        Text('aaaaaaaaa'),
        Text('aaaaaaaaa'),
        Text('aaaaaaaaa'),
      ],
    );
  }
}
