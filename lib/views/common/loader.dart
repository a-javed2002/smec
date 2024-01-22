import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 80.0,
        height: 80.0,
        decoration: BoxDecoration(
          // color: mainColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
            ),
            SizedBox(height: 10.0),
            Text(
              'Loading...',
              style: TextStyle(color: Colors.purple),
            ),
          ],
        ),
      ),
    );
  }
}


// bool isLoading = true;

// ...

// Visibility(
//   visible: isLoading,
//   child: CustomLoader(),
// )