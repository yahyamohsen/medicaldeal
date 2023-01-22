// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:sart_up_project/styles.dart';

// import '../../../../core/utils/size_config.dart';
// import '../../../../generated/l10n.dart';

// class InfoAboutServiceType extends StatefulWidget {
//   const InfoAboutServiceType({Key? key}) : super(key: key);

//   @override
//   State<InfoAboutServiceType> createState() => _InfoAboutServiceTypeState();
// }

// class _InfoAboutServiceTypeState extends State<InfoAboutServiceType> {
//   String selectedItem = 'procedures';

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           S.of(context).service_type,
//           style: Styles.bodyText2.copyWith(
//             color: const Color(0xff323133),
//             fontSize: 14,
//             fontWeight: FontWeight.normal,
//           ),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Container(
//           padding: const EdgeInsets.only(left: 25, right: 10),
//           width: double.infinity,
//           height: SizeConfig.defaultSize * 5.5,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(16),
//               color: const Color.fromRGBO(240, 240, 240, .9)),
//           child: Center(
//               child: DropdownButtonFormField(
//             iconSize: 40,
//             decoration: const InputDecoration.collapsed(hintText: ''),
//             dropdownColor: Colors.grey,
//             value: selectedItem,
//             onChanged: (String? newValue) {
//               setState(() {
//                 selectedItem = newValue!;
//               });
//             },
//             items: <String>['procedures', 'analogue', 'Digital', 'Managed PABX']
//                 .map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(
//                   value,
//                   style: Styles.bodyText2.copyWith(
//                     color: const Color(0xff323133),
//                     fontSize: 14,
//                     fontWeight: FontWeight.normal,
//                   ),
//                 ),
//               );
//             }).toList(),
//           )),
//         ),
//       ],
//     );
//   }
// }
