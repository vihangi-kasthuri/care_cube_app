import 'package:flutter/material.dart';

import 'package:care_cube/screens/home_screen.dart';

class VerifyEmailScreen extends StatefulWidget {
  final String userName;
  final String email;

  const VerifyEmailScreen({
    super.key,
    required this.userName,
    required this.email,
  });

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  bool isResending = false;

  Future<void> resendVerificationEmail() async {
    setState(() {
      isResending = true;
    });

    // Demo delay.
    // Firebase connect කළ පසු මෙතන verification email යවන code එක දාමු.
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() {
      isResending = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Verification email sent again to ${widget.email}',
        ),
      ),
    );
  }

  void continueAfterVerification() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FAF8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5FAF8),
        elevation: 0,
        foregroundColor: const Color(0xFF1C2C39),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 25),

              Container(
                width: 130,
                height: 130,
                decoration: const BoxDecoration(
                  color: Color(0xFFE0F5EF),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.mark_email_read_outlined,
                  size: 72,
                  color: Color(0xFF16796F),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'Check Your Email',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1C2C39),
                ),
              ),

              const SizedBox(height: 14),

              const Text(
                'We have sent a verification link to',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Color(0xFF596873),
                ),
              ),

              const SizedBox(height: 8),

              Text(
                widget.email,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF16796F),
                ),
              ),

              const SizedBox(height: 18),

              const Text(
                'Open your email and click the verification link. '
                    'Then return to the app and press the button below.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Color(0xFF596873),
                ),
              ),

              const SizedBox(height: 35),

              SizedBox(
                height: 60,
                child: ElevatedButton.icon(
                  onPressed: continueAfterVerification,
                  icon: const Icon(Icons.verified_rounded),
                  label: const Text(
                    'I HAVE VERIFIED MY EMAIL',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF16796F),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                height: 55,
                child: OutlinedButton.icon(
                  onPressed:
                  isResending ? null : resendVerificationEmail,
                  icon: isResending
                      ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  )
                      : const Icon(Icons.refresh_rounded),
                  label: Text(
                    isResending
                        ? 'SENDING...'
                        : 'RESEND VERIFICATION EMAIL',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF16796F),
                    side: const BorderSide(
                      color: Color(0xFF16796F),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 22),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF8E7),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Color(0xFF9A6A00),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Demo mode: Firebase is not connected yet. '
                            'The buttons will work as a preview only.',
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.4,
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
      ),
    );
  }
}