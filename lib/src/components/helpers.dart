import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tugas_putra/src/components/global_variable.dart';
import 'package:url_launcher/url_launcher.dart';

class AnyTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  const AnyTextField({super.key, this.controller, this.hintText});

  @override
  State<AnyTextField> createState() => _AnyTextFieldState();
}

class _AnyTextFieldState extends State<AnyTextField> {
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: size.width / 1.1,
        child: TextFormField(
          key: widget.key,
          controller: widget.controller,
          keyboardType: TextInputType.name,
          style: const TextStyle(color: Colors.indigoAccent, fontSize: 14),
          cursorColor: GlobalVariable.primaryColor,
          decoration: InputDecoration(
            hintText: widget.hintText ?? "Nama",
            hintStyle: const TextStyle(color: GlobalVariable.primaryColor),
            contentPadding: const EdgeInsets.only(left: 20),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: const BorderSide(color: GlobalVariable.primaryColor)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: const BorderSide(color: GlobalVariable.primaryColor)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: const BorderSide(color: GlobalVariable.primaryColor)),
            errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: const BorderSide(color: Colors.red)),
          ),
        ),
      ),
    );
  }
}


class EmailTextField extends StatefulWidget {
  final TextEditingController? controller;
  const EmailTextField({super.key, this.controller});

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: size.width / 1.1,
        child: TextFormField(
          key: widget.key,
          controller: widget.controller,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(color: Colors.indigoAccent, fontSize: 14),
          cursorColor: GlobalVariable.primaryColor,
          decoration: InputDecoration(
            hintText: "Email",
            hintStyle: const TextStyle(color: GlobalVariable.primaryColor),
            contentPadding: const EdgeInsets.only(left: 20),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: const BorderSide(color: GlobalVariable.primaryColor)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: const BorderSide(color: GlobalVariable.primaryColor)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: const BorderSide(color: GlobalVariable.primaryColor)),
            errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: const BorderSide(color: Colors.red)),
          ),
        ),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  const PasswordTextField({super.key, this.controller});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool showPassword = false;
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: size.width / 1.1,
        child: TextFormField(
          key: widget.key,
          controller: widget.controller,
          obscureText: showPassword,
          keyboardType: TextInputType.visiblePassword,
          style: const TextStyle(color: Colors.indigoAccent, fontSize: 14),
          cursorColor: GlobalVariable.primaryColor,
          decoration: InputDecoration(
            hintStyle: const TextStyle(color: GlobalVariable.primaryColor),
            contentPadding: const EdgeInsets.only(left: 20),
            suffixIcon: CupertinoButton(
              padding: EdgeInsets.zero,
              child: Icon(showPassword ? Clarity.eye_show_solid : Clarity.eye_hide_line, color: GlobalVariable.primaryColor), 
              onPressed: (){
                setState(() {
                  showPassword = !showPassword;
                });
              }),
            hintText: "Password",
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: const BorderSide(color: GlobalVariable.primaryColor)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: const BorderSide(color: GlobalVariable.primaryColor)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: const BorderSide(color: GlobalVariable.primaryColor)),
            errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: const BorderSide(color: Colors.red)),
          ),
        ),
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {super.key, 
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}

showBottomModalDialog({
  required Size size,
  required BuildContext context,
  required List<Widget> children,
}) {
  showCupertinoModalPopup(
    barrierDismissible: true,
    barrierColor: Colors.black38,
    context: context,
    builder: (BuildContext modalContext) => Container(
      height: size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      child: Material(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25.0)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max, children: children
          ),
        )
      )
    )
  );
}

Future<void> urlLauncher({String? url}) async {
  if (!await launchUrl(
    Uri.parse(url ?? "https://github.com"), mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}

String? urlMeta = """
"https://graph.facebook.com/v21.0/zashasa_
  ?fields=name,username,profile_pic,follower_count,is_user_follow_business,is_business_follow_user
  &access_token=page-access-token"
""";

List<Map<String, dynamic>> dataDeveloper = [
  {
    "details" : {
      "name" : "Zasha",
      "url" : "https://www.instagram.com/zashasa_",
      "photo" : "https://cdn-s2.toolzu.com/media/449082812_7886744868077254_6301018146224781518_n.jpg?url=https%3A%2F%2Fscontent.cdninstagram.com%2Fv%2Ft51.2885-19%2F449082812_7886744868077254_6301018146224781518_n.jpg%3Fstp%3Ddst-jpg_s320x320%26_nc_ht%3Dinstagram.fsub6-1.fna.fbcdn.net%26_nc_cat%3D110%26_nc_ohc%3DQ9Icp9SzddYQ7kNvgEGrR77%26_nc_gid%3D2cd7ef94cd57433d8b67998f36246b78%26edm%3DAOQ1c0wBAAAA%26ccb%3D7-5%26oh%3D00_AYANhftZkaXSkP7tI4DS8waAS8cC6_KSXIco3iqSX8ddbw%26oe%3D672E2C0F%26_nc_sid%3D8b3546&time=1730689200&key=c9c6b6e98f314d7399fa94cd46b55b7b"
    }
  },
  {
    "details" : {
      "name" : "Rama",
      "url" : "https://www.instagram.com/re55erse",
      "photo" : "https://cdn-s2.toolzu.com/media/407745636_2562529447255174_5587881338624901530_n.jpg?url=https%3A%2F%2Fscontent.cdninstagram.com%2Fv%2Ft51.2885-19%2F407745636_2562529447255174_5587881338624901530_n.jpg%3Fstp%3Ddst-jpg_s320x320%26_nc_ht%3Dscontent-cgk1-2.cdninstagram.com%26_nc_cat%3D110%26_nc_ohc%3DkECFuuOkQMsQ7kNvgEkk1DI%26_nc_gid%3Dc185fbae59814669bf1f084523e87bea%26edm%3DAOQ1c0wBAAAA%26ccb%3D7-5%26oh%3D00_AYD0s2X3jDIKGrlopr-eOQOYcVHw1p2Y9m7saxxLAMSQww%26oe%3D672E2007%26_nc_sid%3D8b3546&time=1730689200&key=933628149f86f7cd4867c3fb56782934"
    }
  },
  {
    "details" : {
      "name" : "Andika",
      "url" : "https://www.instagram.com/andika_12sh",
      "photo" : "https://cdn-s2.toolzu.com/media/364959994_1444177936423361_2524017164334934401_n.jpg?url=https%3A%2F%2Fscontent.cdninstagram.com%2Fv%2Ft51.2885-19%2F364959994_1444177936423361_2524017164334934401_n.jpg%3Fstp%3Ddst-jpg_s320x320%26_nc_ht%3Dscontent-del2-2.cdninstagram.com%26_nc_cat%3D105%26_nc_ohc%3DE8VGRxNPSEgQ7kNvgFDWMhC%26_nc_gid%3D17013dfa56ae46b3af9ae54c69519993%26edm%3DAOQ1c0wBAAAA%26ccb%3D7-5%26oh%3D00_AYCrw6epPnUE-uRaMA3JfzO8UXDEKTDH5HmUGsFEVKEydA%26oe%3D672E1AAC%26_nc_sid%3D8b3546&time=1730689200&key=b646cc7127cb7209a42788d9fa075139"
    }
  },
  {
    "details" : {
      "name" : "Krisna",
      "url" : "https://www.instagram.com/kriznaaaaaa._",
      "photo" : "https://cdn-s2.toolzu.com/media/447157234_1520209078894981_2038110545929662634_n.jpg?url=https%3A%2F%2Fscontent.cdninstagram.com%2Fv%2Ft51.2885-19%2F447157234_1520209078894981_2038110545929662634_n.jpg%3Fstp%3Ddst-jpg_s320x320%26_nc_ht%3Dinstagram.fsub8-2.fna.fbcdn.net%26_nc_cat%3D101%26_nc_ohc%3DTTPA99ucp7kQ7kNvgFAyy2w%26_nc_gid%3Dfe07d06ee9dc474ca208b12d3e4a54fb%26edm%3DAOQ1c0wBAAAA%26ccb%3D7-5%26oh%3D00_AYDvdIwP7tP4YlWeicKg-tnBuy6bPa3rDZcYgsLHVNk7pQ%26oe%3D672E086F%26_nc_sid%3D8b3546&time=1730689200&key=6f5e135a01400b0c52de4d300945fabe"
    }
  },
  {
    "details" : {
      "name" : "Putra",
      "url" : "https://www.instagram.com/putrabudianto23",
      "photo" : "https://cdn-s2.toolzu.com/media/461287119_970212828205114_7420841213897837386_n.jpg?url=https%3A%2F%2Fscontent.cdninstagram.com%2Fv%2Ft51.2885-19%2F461287119_970212828205114_7420841213897837386_n.jpg%3Fstp%3Ddst-jpg_s320x320%26_nc_ht%3Dscontent-cgk1-2.cdninstagram.com%26_nc_cat%3D110%26_nc_ohc%3DcjJ133aZwWMQ7kNvgHXTT5s%26_nc_gid%3Dbe9cd409a47b4e2bbca563c8e8101e27%26edm%3DAOQ1c0wBAAAA%26ccb%3D7-5%26oh%3D00_AYA9t0jjRXrWezwgh3nzSCGQloVzpf8VgsGXW3jj9JgoXw%26oe%3D672E058A%26_nc_sid%3D8b3546&time=1730689200&key=8fb4f030181db0b01274944f3e9740e7"
    }
  }
];