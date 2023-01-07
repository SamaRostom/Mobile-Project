import 'package:flutter/material.dart';
import '../Utils/data.dart' as val;
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

// class constants{
//   Future<void> _showMyDialog(BuildContext context,String alertMessage) async {
//   return showDialog<void>(
//     context: context,
//     barrierDismissible: false, // user must tap button!
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text('Alert'),
//         content: SingleChildScrollView(
//           child: ListBody(
//             children:<Widget>[
//               Text(alertMessage),
//             ],
//           ),
//         ),
//         actions: <Widget>[
//           TextButton(
//             child: const Text('Ok'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }

// }


class DialogExample extends StatelessWidget {
  String? alertMessage;
  DialogExample(this.alertMessage, {super.key});
  

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Alert'),
          content: Text(alertMessage!),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}

void errormessage(String t, String m) {
  val.snackBar = SnackBar(
    // need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: t,
      message: m,

      // change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: ContentType.failure,
    ),
  );
}