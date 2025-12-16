import 'package:flutter/material.dart';
import 'package:forms360_uikit/forms360_uikit.dart';
import 'package:forms360_uikit/src/widgets/pop_up/delete_custom_pop_up.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delete PopUp Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DeletePopUpExample(),
    );
  }
}

class DeletePopUpExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete PopUp with Loading Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Click the button below to see the delete popup with loading functionality',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: DeleteCustomPopUp(
                      title: 'Delete Item',
                      description: 'Are you sure you want to delete this item? This action cannot be undone.',
                      onTap: () async {
                        // Simulate an async operation (like API call)
                        await Future.delayed(Duration(seconds: 3));
                        
                        // Close the dialog after the operation completes
                        Navigator.of(context).pop();
                        
                        // Show a success message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Item deleted successfully!'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      buttonText: 'Delete',
                      platformType: PlatformAlertType.WEB,
                    ),
                  ),
                );
              },
              child: Text('Show Delete PopUp'),
            ),
          ],
        ),
      ),
    );
  }
}