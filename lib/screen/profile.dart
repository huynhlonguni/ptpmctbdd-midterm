import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../component/svg.dart';
import '../component/custom_app_bar.dart';
import '../model/user.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    return Scaffold(
        appBar: const CustomAppBar(title: "Profile", disableCartButton: true),
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              InfoField(user: user, label: "Full name", value: user.username, icon: "assets/svgs/Profile.svg"),
              const SizedBox(height: 26),
              InfoField(user: user, label: "Phone number", value: user.phone, icon: "assets/svgs/Phone.svg"),
              const SizedBox(height: 26),
              InfoField(user: user, label: "Email", value: user.email, icon: "assets/svgs/Message.svg"),
              const SizedBox(height: 26),
              InfoField(user: user, label: "Address", value: user.address, icon: "assets/svgs/Location.svg"),
            ],
          ),
        ));
  }
}

class InfoField extends StatelessWidget {
  const InfoField({
    super.key,
    required this.user, required this.label, required this.value, required this.icon,
  });

  final UserModel user;
  final String label;
  final String value;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(100),
              ),
              child: SVG(icon,
                  size: 20,
                  color: Theme.of(context).colorScheme.onSurface),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: TextStyle(
                      color:
                          Theme.of(context).colorScheme.onSecondary,
                      fontSize: 10,
                    )),
                Text(value,
                    style: TextStyle(
                        color:
                            Theme.of(context).colorScheme.onSurface,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ),
        IconButton(
          icon: const SVG("assets/svgs/Edit.svg", size: 24),
          onPressed: () {},
        ),
      ],
    );
  }
}
