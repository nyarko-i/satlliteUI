import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // Needed for CupertinoActivityIndicator
import 'package:satellite/analytics_chart.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tabs = [
      "Everything",
      "Ping Success",
      "Latency",
      "Uptime",
      "Bandwidth",
    ];
    final brightness = Theme.of(context).brightness;

    return Scaffold(
      appBar: AppBar(
        title: Text("Stats"),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: BackButtonIcon()),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.power_settings_new_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset("assets/dish.png", height: 350),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Text(
                    "Lyng HX-1",
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Transform.rotate(
                      angle: pi / 2,
                      child: Icon(
                        Icons.battery_charging_full,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(width: 6),
                    Text("87% charged"),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            DefaultTabController(
              length: tabs.length,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface.withValues(alpha: .5),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: theme.colorScheme.outline.withValues(alpha: .5),
                      ),
                    ),
                    child: TabBar(
                      tabAlignment: TabAlignment.start,
                      isScrollable: true,
                      dividerHeight: 0,
                      labelColor: brightness == Brightness.dark
                          ? Color(0xff2c313d)
                          : Colors.white,
                      indicator: BoxDecoration(
                        color: brightness == Brightness.dark
                            ? Colors.white
                            : theme.colorScheme.inverseSurface,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: List.generate(tabs.length, (index) {
                        final tab = tabs[index];
                        return Tab(
                          height: 35,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(tab),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 8),

                  SizedBox(
                    height: 380,
                    child: TabBarView(
                      children: List.generate(tabs.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 30),
                                child: Row(
                                  children: [
                                    CupertinoActivityIndicator(
                                      animating: false,
                                      color: theme.colorScheme.primary,
                                      radius: 12,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      '99.77%',
                                      style: theme.textTheme.titleLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Spacer(),
                                    Icon(Icons.circle, size: 12),
                                    SizedBox(width: 8),
                                    Text(
                                      'Recent',
                                      style: theme.textTheme.titleMedium,
                                    ),
                                    SizedBox(width: 20),
                                    Icon(
                                      Icons.circle_outlined,
                                      size: 12,
                                      color: theme.colorScheme.outline,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      'Previous',
                                      style: theme.textTheme.titleMedium
                                          ?.copyWith(
                                            color: theme.colorScheme.outline,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(child: AnalyticsChart()),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
