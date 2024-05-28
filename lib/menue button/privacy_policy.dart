import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(77, 75, 72, 1.0),
          title: const Text(
            '            Privacy Policy',
            style: TextStyle(color: Colors.white),
          )),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: 5),
                child: Text(
                  'privacy policy',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ),
              // SizedBox(
              //   width: 10,
              // ),
              Text(
                'This privacy policy applies to the journey app (hereby referred to as "Application") for mobile devices that was created by Akhila A (hereby referred to as "Service Provider") as a Free service. This service is intended for use "AS IS".',
                style: TextStyle(fontSize: 15),
              ),
              Text(
                'Information Collection and Use',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'The Application collects information when you download and use it. This information may include information such as  ',
                style: TextStyle(fontSize: 15),
              ),

              Text(
                '             your device Internet Protocol address(e.g IP \n             address)',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),

              Text(
                '                   The pages of the Application that you visit the\n                   time and date of your visit,the time spent on \n                   those pages',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Text('The time spent on the Application'),
              SizedBox(
                height: 10,
              ),
              Text(
                  '                 The operating system you use on your mobile \n                 device'),
              SizedBox(
                height: 10,
              ),
              Text(
                  'The Application does not gather precise information about the location of your mobile device.'),
              SizedBox(
                height: 8,
              ),
              Text(
                  'The Service Provider may use the information you provided to contact you from time to time to provide you with important information, required notices and marketing promotions.'),
              Text(''),
              Text(
                  'For a better experience, while using the Application, the Service Provider may require you to provide us with certain personally identifiable information,including but not limited to gender,'),
              Text(
                  'name,username..The information that the Service Provider request will be retained by them and used as described in this privacy policy.'),
              SizedBox(
                height: 8,
              ),
              Text(
                'Third Party Access',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  'Only aggregated, anonymized data is periodically transmitted to external services to aid the Service Provider in improving the Application and their service. The Service Provider in improving'),
              Text(
                  'the Application and their service.The Service Provider may share your information with third parties in the ways that are described in this privacy statement.'),
              SizedBox(
                height: 10,
              ),

              Text(
                  ' please note that the application utilizes third-party services that have their own Privacy Policy about handling data. Below are the links to the Privacy Policy of the third-party service providers used by the Application:'),
              SizedBox(
                height: 10,
              ),

              Text('Google Play Services'),
              SizedBox(
                height: 8,
              ),
              Text(
                  'The Service Provider may disclose User Provided and Automatically Collected Information:'),
              SizedBox(
                height: 10,
              ),
              Text(
                  '             as required by law, such as to comply with a subpoena, \n             or similar legal process;'),
              SizedBox(
                height: 10,
              ),
              Text(
                  '          when they believe in good faith that disclosure is \n          necessary to protect their rights, protect your safety  \n          or the safety of others, investigate fraud, or respond \n          to a government request;'),
              SizedBox(
                height: 10,
              ),

              Text(
                  '             with their trusted services providers who work on their \n             behalf, do not have an independent use of the \n             information we disclose to them, and have agreed to \n             adhere to the rules set forth in this privacy statement.'),
              Text(''),
              Text(
                'Opt-Out Rights',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  'You can stop all collection of information by the Application easily by uninstalling it. You may use the standard uninstall processes as may be available as part of'),
              Text(
                  'your mobile device or via the mobile application marketplace or network.'),
              Text(
                'Data Retention Policy',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  'The Service Provider will retain User Provided data for as long as you use the Application and for a reasonable time thereafter.If you d like them to delete User Provided Data that'),
              Text(
                  'you have provided via the Application please contact them at,akhilaakhipkd@gmail.com and they will respond in a reasonable time.'),

              Text(
                'Children',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  'The Service Provider does not use the Application to knowingly solicit data from or market to children under the age of 13.'),
              SizedBox(
                height: 10,
              ),
              Text(
                  'The Application does not address anyone under the age of 13. The Service Provider does not knowingly collect personally identifiable information from children under 13 years of age.'),
              Text(
                  'In the case the Service Provider discover that a child under 13 has provided personal information, the Service Provider will immediately delete this from their servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact the Service Provider '),

              Text(
                  '(akhilaakhipkd@gmail.com) so that they will be able to take the necessary actions.'),
              SizedBox(
                height: 10,
              ),
              Text(
                'Security',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  'The Service Provider is concerned about safeguarding the confidentiality of your information. The Service Provider provides physical, electronic, and procedural safeguards to'),
              Text(
                  ' protect information the Service Provider processes and maintains.'),
              Text(
                'Changes',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  'This Privacy Policy may be updated from time to time for any reason. The Service Provider will notify you of any changes to the Privacy Policy by updating this page with the new Privacy Policy. You are advised to consult this Privacy Policy regularly for any changes, as continued use is deemed approval of all changes.This privacy policy is effective as of 2035 05 14'),
              SizedBox(
                height: 10,
              ),

              Text(
                'Your Consent',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  'By using the Application, you are consenting to the processing of your information as set forth in this Privacy Policy now and as amended by us.'),
              Text(
                'Contact Us',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  'If you have any questions regarding privacy while using the Application, or have questions about the practices, please contact the Service Provider via email at akhilaakhipkd@gmail.com.This privacy policy page was generated by App Privacy Policy Generator'),

              Text('  '),
            ],
          ),
        ),
      ),
    );
  }
}






// import 'package:diary/db/user_db_functions.dart';
// import 'package:diary/model/user_model.dart';
// import 'package:flutter/material.dart';

// class Photos extends StatefulWidget {
//   const Photos({super.key});

//   @override
//   State<Photos> createState() => _PhotosState();
// }

// class _PhotosState extends State<Photos> {
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<List<UserModel>>(
//         valueListenable: userListnotifier,
//         builder: (context, value, _) {
//           var user = value.first;

//           return Scaffold(
//               backgroundColor: Colors.white,
//               appBar: AppBar(
//                 centerTitle: true,
//                 backgroundColor: Color.fromRGBO(77, 75, 72, 1.0),
//                 title: Text(
//                   "${user.name}'S JOURNEY",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//               body: SingleChildScrollView(
//                   child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                       ))));
//         });
//   }
// }