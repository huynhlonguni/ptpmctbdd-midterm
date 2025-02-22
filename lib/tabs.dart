import 'package:flutter/material.dart';
import 'component/svg.dart';
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
          body: Stack(children: [
            screens[tabManager.currentTabIndex],
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Container(
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
                      Expanded(
                        child: TabButton(
                          activeColor: Theme.of(context).colorScheme.onSurface,
                          inactiveColor:
                              Theme.of(context).colorScheme.onSecondary,
                          isActive: tabManager.currentTabIndex == 0,
                          onPressed: () => tabManager.setTabIndex(0),
                          child: const SVG("assets/svgs/House.svg", size: 24),
                        ),
                      ),
                      Expanded(
                        child: TabButton(
                          activeColor: Theme.of(context).colorScheme.onSurface,
                          inactiveColor:
                              Theme.of(context).colorScheme.onSecondary,
                          isActive: tabManager.currentTabIndex == 1,
                          onPressed: () => tabManager.setTabIndex(1),
                          child: const SVG("assets/svgs/Gift.svg", size: 24),
                        ),
                      ),
                      Expanded(
                        child: TabButton(
                          activeColor: Theme.of(context).colorScheme.onSurface,
                          inactiveColor:
                              Theme.of(context).colorScheme.onSecondary,
                          isActive: tabManager.currentTabIndex == 2,
                          onPressed: () => tabManager.setTabIndex(2),
                          child: const SVG("assets/svgs/Receipt.svg", size: 24),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]), // Show the current screen
        );
      },
    );
  }
}
