import 'package:flutter/material.dart';

class MedicineScreen extends StatelessWidget {
  const MedicineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FAF8),
      appBar: AppBar(
        title: const Text(
          'Care Cube',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF16796F),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 30),
          children: [
            const Text(
              'Medicine Box Status',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C2C39),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Monitor storage conditions and today\'s dose compartments.',
              style: TextStyle(
                fontSize: 15,
                height: 1.4,
                color: Color(0xFF66747D),
              ),
            ),
            const SizedBox(height: 22),

            _buildEnvironmentCard(),

            const SizedBox(height: 24),

            const Text(
              'Today\'s Dose Compartments',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C2C39),
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Each compartment contains the complete dose for one medicine time.',
              style: TextStyle(
                fontSize: 14,
                height: 1.4,
                color: Color(0xFF66747D),
              ),
            ),
            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: _buildDoseCard(
                    icon: Icons.wb_sunny_rounded,
                    title: 'Morning',
                    time: '8:00 AM',
                    compartment: 'Cup 1',
                    status: 'Taken',
                    statusType: DoseStatus.taken,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildDoseCard(
                    icon: Icons.light_mode_rounded,
                    title: 'Afternoon',
                    time: '1:00 PM',
                    compartment: 'Cup 2',
                    status: 'Ready',
                    statusType: DoseStatus.ready,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: _buildDoseCard(
                    icon: Icons.nightlight_round,
                    title: 'Night',
                    time: '8:00 PM',
                    compartment: 'Cup 3',
                    status: 'Pending',
                    statusType: DoseStatus.pending,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildDoseCard(
                    icon: Icons.emergency_rounded,
                    title: 'Emergency',
                    time: 'Available',
                    compartment: 'Cup 4',
                    status: 'Ready',
                    statusType: DoseStatus.emergency,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            const Text(
              'Today\'s Progress',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C2C39),
              ),
            ),
            const SizedBox(height: 14),

            _buildProgressCard(),

            const SizedBox(height: 24),

            const Text(
              'Care Cube Status',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C2C39),
              ),
            ),
            const SizedBox(height: 14),

            _buildStatusCard(
              icon: Icons.check_circle_rounded,
              title: 'Storage Conditions',
              description: 'Temperature and humidity are within the safe range.',
              iconColour: const Color(0xFF16796F),
              backgroundColour: const Color(0xFFE6F6F1),
            ),

            const SizedBox(height: 12),

            _buildStatusCard(
              icon: Icons.wifi_rounded,
              title: 'Box Connection',
              description: 'Care Cube is connected.',
              iconColour: const Color(0xFF2563A6),
              backgroundColour: const Color(0xFFEAF3FF),
            ),

            const SizedBox(height: 12),

            _buildStatusCard(
              icon: Icons.battery_full_rounded,
              title: 'Battery Level',
              description: '93% remaining',
              iconColour: const Color(0xFF7B5B15),
              backgroundColour: const Color(0xFFFFF6DD),
            ),

            const SizedBox(height: 14),

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
                      'Demo mode: Temperature, humidity, connection and battery '
                          'values will become real-time after ESP32 and Firebase are connected.',
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

  Widget _buildEnvironmentCard() {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.sensors_rounded,
                color: Colors.white,
              ),
              SizedBox(width: 8),
              Text(
                'Live Storage Conditions',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: _buildSensorItem(
                  icon: Icons.thermostat_rounded,
                  label: 'Temperature',
                  value: '26.5°C',
                ),
              ),
              Container(
                width: 1,
                height: 72,
                color: Colors.white.withOpacity(0.35),
              ),
              Expanded(
                child: _buildSensorItem(
                  icon: Icons.water_drop_rounded,
                  label: 'Humidity',
                  value: '58%',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 9,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.16),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Icon(
                  Icons.update_rounded,
                  size: 19,
                  color: Colors.white,
                ),
                SizedBox(width: 8),
                Text(
                  'Last updated: Just now',
                  style: TextStyle(
                    fontSize: 13,
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

  Widget _buildSensorItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Column(
      children: [
        Icon(
          icon,
          size: 36,
          color: Colors.white,
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13,
            color: Colors.white.withOpacity(0.86),
          ),
        ),
      ],
    );
  }

  Widget _buildDoseCard({
    required IconData icon,
    required String title,
    required String time,
    required String compartment,
    required String status,
    required DoseStatus statusType,
  }) {
    final statusStyle = _getStatusStyle(statusType);

    return Container(
      padding: const EdgeInsets.all(15),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F6F1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icon,
                  color: const Color(0xFF16796F),
                  size: 26,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 9,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: statusStyle.backgroundColour,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: statusStyle.textColour,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 13),
          Text(
            '$title Dose',
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1C2C39),
            ),
          ),
          const SizedBox(height: 9),
          Row(
            children: [
              const Icon(
                Icons.access_time_rounded,
                size: 17,
                color: Color(0xFF16796F),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  time,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF596873),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              const Icon(
                Icons.inventory_2_outlined,
                size: 17,
                color: Color(0xFF16796F),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  compartment,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF596873),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProgressCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 76,
                height: 76,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const SizedBox(
                      width: 76,
                      height: 76,
                      child: CircularProgressIndicator(
                        value: 1 / 3,
                        strokeWidth: 9,
                        backgroundColor: Color(0xFFE4EFEC),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFF16796F),
                        ),
                      ),
                    ),
                    const Text(
                      '1/3',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1C2C39),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 18),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1 dose completed',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1C2C39),
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      '2 scheduled doses remaining today',
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.4,
                        color: Color(0xFF66747D),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 17),
          const Divider(height: 1),
          const SizedBox(height: 15),
          const Row(
            children: [
              Icon(
                Icons.notifications_active_rounded,
                color: Color(0xFF16796F),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Next dose: Afternoon Dose at 1:00 PM',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1C2C39),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusCard({
    required IconData icon,
    required String title,
    required String description,
    required Color iconColour,
    required Color backgroundColour,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: backgroundColour,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.75),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: iconColour,
              size: 27,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1C2C39),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                    height: 1.35,
                    color: Color(0xFF596873),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  StatusStyle _getStatusStyle(DoseStatus status) {
    switch (status) {
      case DoseStatus.taken:
        return const StatusStyle(
          backgroundColour: Color(0xFFE0F5EF),
          textColour: Color(0xFF16796F),
        );
      case DoseStatus.ready:
        return const StatusStyle(
          backgroundColour: Color(0xFFFFF2D8),
          textColour: Color(0xFFA86400),
        );
      case DoseStatus.pending:
        return const StatusStyle(
          backgroundColour: Color(0xFFEAF3FF),
          textColour: Color(0xFF2563A6),
        );
      case DoseStatus.emergency:
        return const StatusStyle(
          backgroundColour: Color(0xFFFFE4E4),
          textColour: Color(0xFFB13A3A),
        );
    }
  }
}

enum DoseStatus {
  taken,
  ready,
  pending,
  emergency,
}

class StatusStyle {
  final Color backgroundColour;
  final Color textColour;

  const StatusStyle({
    required this.backgroundColour,
    required this.textColour,
  });
}