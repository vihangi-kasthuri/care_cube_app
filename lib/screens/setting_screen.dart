import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool doseReminders = true;
  bool caregiverAlerts = true;
  bool storageAlerts = true;
  bool vibration = true;
  bool darkMode = false;

  String reminderSound = 'Default';
  String language = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FAF8),
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF16796F),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 30),
          children: [
            _buildHeaderCard(),
            const SizedBox(height: 22),

            const _SettingsSectionTitle(title: 'Notifications'),
            const SizedBox(height: 12),
            _buildSettingsCard(
              children: [
                _buildSwitchTile(
                  icon: Icons.alarm_rounded,
                  title: 'Dose Reminders',
                  subtitle: 'Receive alerts when it is time to take a dose',
                  value: doseReminders,
                  onChanged: (value) {
                    setState(() {
                      doseReminders = value;
                    });
                  },
                ),
                const _SettingsDivider(),
                _buildSwitchTile(
                  icon: Icons.people_outline_rounded,
                  title: 'Caregiver Alerts',
                  subtitle: 'Notify the caregiver about missed doses',
                  value: caregiverAlerts,
                  onChanged: (value) {
                    setState(() {
                      caregiverAlerts = value;
                    });
                  },
                ),
                const _SettingsDivider(),
                _buildSwitchTile(
                  icon: Icons.thermostat_rounded,
                  title: 'Storage Alerts',
                  subtitle: 'Warn about unsafe temperature or humidity',
                  value: storageAlerts,
                  onChanged: (value) {
                    setState(() {
                      storageAlerts = value;
                    });
                  },
                ),
                const _SettingsDivider(),
                _buildSwitchTile(
                  icon: Icons.vibration_rounded,
                  title: 'Vibration',
                  subtitle: 'Vibrate the phone with reminder alerts',
                  value: vibration,
                  onChanged: (value) {
                    setState(() {
                      vibration = value;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 22),

            const _SettingsSectionTitle(title: 'Reminder Preferences'),
            const SizedBox(height: 12),
            _buildSettingsCard(
              children: [
                _buildActionTile(
                  icon: Icons.music_note_rounded,
                  title: 'Reminder Sound',
                  subtitle: reminderSound,
                  onTap: () {
                    _showSoundPicker();
                  },
                ),
                const _SettingsDivider(),
                _buildActionTile(
                  icon: Icons.language_rounded,
                  title: 'Language',
                  subtitle: language,
                  onTap: () {
                    _showLanguagePicker();
                  },
                ),
              ],
            ),

            const SizedBox(height: 22),

            const _SettingsSectionTitle(title: 'Appearance'),
            const SizedBox(height: 12),
            _buildSettingsCard(
              children: [
                _buildSwitchTile(
                  icon: Icons.dark_mode_outlined,
                  title: 'Dark Mode',
                  subtitle: 'Use a darker appearance for the app',
                  value: darkMode,
                  onChanged: (value) {
                    setState(() {
                      darkMode = value;
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Dark mode preview only. Full theme support will be added later.',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 22),

            const _SettingsSectionTitle(title: 'Care Cube'),
            const SizedBox(height: 12),
            _buildSettingsCard(
              children: [
                _buildActionTile(
                  icon: Icons.wifi_tethering_rounded,
                  title: 'Box Connection',
                  subtitle: 'Connected to Care Cube 01',
                  onTap: () {
                    _showDemoMessage(
                      'Box connection settings will work after hardware integration.',
                    );
                  },
                ),
                const _SettingsDivider(),
                _buildActionTile(
                  icon: Icons.sync_rounded,
                  title: 'Sync Data',
                  subtitle: 'Last synced just now',
                  onTap: () {
                    _showDemoMessage('Care Cube data synced successfully');
                  },
                ),
                const _SettingsDivider(),
                _buildActionTile(
                  icon: Icons.restart_alt_rounded,
                  title: 'Reset Care Cube',
                  subtitle: 'Restore box settings to default',
                  onTap: () {
                    _showResetDialog();
                  },
                ),
              ],
            ),

            const SizedBox(height: 22),

            const _SettingsSectionTitle(title: 'Support'),
            const SizedBox(height: 12),
            _buildSettingsCard(
              children: [
                _buildActionTile(
                  icon: Icons.help_outline_rounded,
                  title: 'Help & Support',
                  subtitle: 'Get help using Care Cube',
                  onTap: () {
                    _showDemoMessage('Help and support page will be added later.');
                  },
                ),
                const _SettingsDivider(),
                _buildActionTile(
                  icon: Icons.info_outline_rounded,
                  title: 'About',
                  subtitle: 'Care Cube demo version 1.0.0',
                  onTap: () {
                    _showAboutDialog();
                  },
                ),
              ],
            ),

            const SizedBox(height: 18),

            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF8E7),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFFFFE3A3),
                ),
              ),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: Color(0xFF9A6A00),
                  ),
                  SizedBox(width: 11),
                  Expanded(
                    child: Text(
                      'Demo mode: These settings currently work as a UI preview. '
                          'They will be saved permanently after Firebase is connected.',
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.45,
                        color: Color(0xFF6E5200),
                      ),
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

  Widget _buildHeaderCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF16796F),
            Color(0xFF2F9C8F),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF16796F).withOpacity(0.22),
            blurRadius: 16,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: const Row(
        children: [
          Icon(
            Icons.settings_rounded,
            size: 42,
            color: Colors.white,
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Care Cube Settings',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Manage reminders, alerts and box preferences.',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.35,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsCard({
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          color: const Color(0xFFE3ECE9),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.045),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 11,
      ),
      child: Row(
        children: [
          _buildIconBox(icon),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1C2C39),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12.5,
                    height: 1.35,
                    color: Color(0xFF7B898F),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Switch.adaptive(
            value: value,
            activeColor: const Color(0xFF16796F),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildActionTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(19),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        child: Row(
          children: [
            _buildIconBox(icon),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15.5,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1C2C39),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12.5,
                      color: Color(0xFF7B898F),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: Color(0xFF8D999E),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconBox(IconData icon) {
    return Container(
      width: 43,
      height: 43,
      decoration: BoxDecoration(
        color: const Color(0xFFE6F6F1),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Icon(
        icon,
        color: const Color(0xFF16796F),
        size: 23,
      ),
    );
  }

  void _showSoundPicker() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (sheetContext) {
        final sounds = ['Default', 'Gentle Bell', 'Digital Alarm', 'Soft Chime'];

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Reminder Sound',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                ...sounds.map(
                      (sound) => RadioListTile<String>(
                    value: sound,
                    groupValue: reminderSound,
                    activeColor: const Color(0xFF16796F),
                    title: Text(sound),
                    onChanged: (value) {
                      if (value == null) return;

                      setState(() {
                        reminderSound = value;
                      });

                      Navigator.pop(sheetContext);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showLanguagePicker() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (sheetContext) {
        final languages = ['English', 'සිංහල', 'தமிழ்'];

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Language',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                ...languages.map(
                      (item) => RadioListTile<String>(
                    value: item,
                    groupValue: language,
                    activeColor: const Color(0xFF16796F),
                    title: Text(item),
                    onChanged: (value) {
                      if (value == null) return;

                      setState(() {
                        language = value;
                      });

                      Navigator.pop(sheetContext);

                      _showDemoMessage(
                        'Full language translation will be added later.',
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showResetDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('Reset Care Cube?'),
          content: const Text(
            'This will restore the Care Cube settings to their default values.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('CANCEL'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                _showDemoMessage(
                  'Demo mode: Reset will work after hardware integration.',
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB33A3A),
                foregroundColor: Colors.white,
              ),
              child: const Text('RESET'),
            ),
          ],
        );
      },
    );
  }

  void _showAboutDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('About Care Cube'),
          content: const Text(
            'Care Cube is a smart medicine reminder and monitoring system '
                'designed to support patients and caregivers.\n\nVersion 1.0.0',
            style: TextStyle(height: 1.5),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('CLOSE'),
            ),
          ],
        );
      },
    );
  }

  void _showDemoMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

class _SettingsSectionTitle extends StatelessWidget {
  final String title;

  const _SettingsSectionTitle({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1C2C39),
      ),
    );
  }
}

class _SettingsDivider extends StatelessWidget {
  const _SettingsDivider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 70),
      child: Divider(height: 1),
    );
  }
}
