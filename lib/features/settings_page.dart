import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lunchnearby_app/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends HookConsumerWidget {
  SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: ListView.builder(
          itemCount: settingsItems.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return ListTile(
                title: Text(settingsItems[index]),
                subtitle: const Text('食べログの情報を掲載しています'),
                trailing: TextButton.icon(
                  onPressed: () => launchUrl(Uri.parse(tabelogUrl)),
                  label: const Text('食べログ表示'),
                  icon: const Icon(Icons.open_in_new),
                ),
              );
            }
            return null;
          }),
    );
  }
}
