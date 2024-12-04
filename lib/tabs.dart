import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'component/tab_button.dart';
import 'package:provider/provider.dart';
import 'state/tab_manager.dart';

class Tabs extends StatelessWidget {
  final List<Widget> screens;

  const Tabs({
    required this.screens,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(
      builder: (context, tabManager, child) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: screens[tabManager.currentTabIndex], // Show the current screen
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor,
                    spreadRadius: 0,
                    blurRadius: 50,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TabButton(
                    activeColor: Theme.of(context).colorScheme.primary,
                    inactiveColor:
                        Theme.of(context).colorScheme.onSecondary,
                    isActive: tabManager.currentTabIndex == 0,
                    onPressed: () => tabManager.setTabIndex(0),
                    child: SvgPicture.asset(
                      "assets/svgs/House.svg",
                      width: 24,
                      height: 24,
                    ),
                  ),
                  TabButton(
                    activeColor: Theme.of(context).colorScheme.primary,
                    inactiveColor:
                        Theme.of(context).colorScheme.onSecondary,
                    isActive: tabManager.currentTabIndex == 1,
                    onPressed: () => tabManager.setTabIndex(1),
                    child: SvgPicture.asset(
                      "assets/svgs/Gift.svg",
                      width: 24,
                      height: 24,
                    ),
                  ),
                  TabButton(
                    activeColor: Theme.of(context).colorScheme.primary,
                    inactiveColor:
                        Theme.of(context).colorScheme.onSecondary,
                    isActive: tabManager.currentTabIndex == 2,
                    onPressed: () => tabManager.setTabIndex(2),
                    child: SvgPicture.asset(
                      "assets/svgs/Receipt.svg",
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
