import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hivemind"),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text("Master Configuration"),
            tiles: [
              SettingsTile.switchTile(
                title: const Text("Is Master Tablet"),
                onToggle: (bool value) {},
                initialValue: false,
              ),
              SettingsTile(
                title: const Text("Team Number"),
              ),
              SettingsTile(
                title: const Text("Year"),
              ),
            ],
          ),
          SettingsSection(
            title: const Text("Local Configuration"),
            tiles: [],
          ),
        ],
      ),
    );
  }
}
