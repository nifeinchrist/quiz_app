import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'welcome_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final prefs = await SharedPreferences.getInstance();

    final name = _nameController.text.trim();
    final age = int.parse(_ageController.text.trim());

    // Save username and age
    await prefs.setString('username', name);
    await prefs.setInt('age', age);

    if (!mounted) return;

    setState(() => _isLoading = false);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => WelcomeScreen(username: name, age: age),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF673AB7), Color(0xFF9C27B0), Color(0xFFE91E63)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 28.0,
                vertical: 24.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 16,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.auto_awesome,
                      size: 70,
                      color: Colors.amberAccent,
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Title
                  const Text(
                    'English Fun Quiz!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'Enter your name and age to get started ⭐',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white.withValues(alpha: 0.9),
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Login Card
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.12),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Name
                          const Text(
                            'What\'s your name?',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2D3142),
                            ),
                          ),

                          const SizedBox(height: 16),

                          TextFormField(
                            controller: _nameController,
                            textCapitalization: TextCapitalization.words,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'e.g. Alex',
                              prefixIcon: const Icon(
                                Icons.person_rounded,
                                color: Colors.deepPurple,
                              ),
                              filled: true,
                              fillColor: Colors.deepPurple.shade50,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color: Colors.deepPurple,
                                  width: 2,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter your name!';
                              }

                              if (value.trim().length < 2) {
                                return 'Name must be at least 2 characters.';
                              }

                              return null;
                            },
                          ),

                          const SizedBox(height: 24),

                          // Age
                          const Text(
                            'How old are you?',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2D3142),
                            ),
                          ),

                          const SizedBox(height: 16),

                          TextFormField(
                            controller: _ageController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'e.g. 8',
                              prefixIcon: const Icon(
                                Icons.cake_rounded,
                                color: Colors.deepPurple,
                              ),
                              filled: true,
                              fillColor: Colors.deepPurple.shade50,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color: Colors.deepPurple,
                                  width: 2,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Please enter your age!';
                              }

                              final age = int.tryParse(value.trim());

                              if (age == null) {
                                return 'Please enter a valid age.';
                              }

                              if (age < 5 || age > 18) {
                                return 'Please enter an age between 5 and 18.';
                              }

                              return null;
                            },
                          ),

                          const SizedBox(height: 28),

                          // Let's Go Button
                          SizedBox(
                            height: 52,
                            child: ElevatedButton(
                              onPressed: _isLoading ? null : _login,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple,
                                foregroundColor: Colors.white,
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              child: _isLoading
                                  ? const SizedBox(
                                      height: 22,
                                      width: 22,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2.5,
                                      ),
                                    )
                                  : const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'LET\'S GO!',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Icon(
                                          Icons.arrow_forward_rounded,
                                          size: 24,
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
