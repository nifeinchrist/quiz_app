import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app_theme.dart';
import 'beginner_screen.dart';
import 'intermediate_screen.dart';
import 'advanced_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  String? _selectedKeyStage;

  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    if (_selectedKeyStage == null) {
      setState(() {});
      return;
    }

    setState(() => _isLoading = true);

    final prefs = await SharedPreferences.getInstance();

    final name = _nameController.text.trim();

    // Save username and selected key stage.
    await prefs.setString('username', name);
    await prefs.setString('key_stage', _selectedKeyStage!);

    if (!mounted) return;

    setState(() => _isLoading = false);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => _selectedKeyStage == 'KS1'
            ? KeyStage1Screen(username: name)
            : _selectedKeyStage == 'KS2'
            ? KeyStage2Screen(username: name)
            : AdvancedScreen(username: name),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppTheme.veryLightOrange, AppTheme.lightOrange],
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
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.darkOrange.withValues(alpha: 0.2),
                          blurRadius: 16,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.auto_awesome,
                      size: 70,
                      color: AppTheme.lemonGreen,
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
                      color: AppTheme.darkOrange,
                      letterSpacing: 0.5,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Enter your name and choose a level to get started',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: AppTheme.darkOrange,
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
                                color: AppTheme.darkOrange,
                              ),
                              filled: true,
                              fillColor: AppTheme.veryLightOrange,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color: AppTheme.darkOrange,
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

                          const Text(
                            'Choose your level',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2D3142),
                            ),
                          ),

                          const SizedBox(height: 16),

                          Row(
                            children: [
                              Expanded(
                                child: _buildKeyStageButton(
                                  keyStage: 'KS1',
                                  label: 'Beginner',
                                  grades: 'Grades 1 and 2',
                                  icon: Icons.looks_one_rounded,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _buildKeyStageButton(
                                  keyStage: 'KS2',
                                  label: 'Intermediate',
                                  grades: 'Grades 3 and 4',
                                  icon: Icons.looks_two_rounded,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          _buildKeyStageButton(
                            keyStage: 'ADVANCED',
                            label: 'Advanced',
                            grades: 'Grades 5 and 6',
                            icon: Icons.looks_3_rounded,
                          ),

                          if (_selectedKeyStage == null) ...[
                            const SizedBox(height: 8),
                            const Text(
                              'Please choose a level.',
                              style: TextStyle(color: Colors.red, fontSize: 12),
                            ),
                          ],

                          const SizedBox(height: 28),

                          // Let's Go Button
                          SizedBox(
                            height: 52,
                            child: ElevatedButton(
                              onPressed: _isLoading ? null : _login,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.primaryOrange,
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

  Widget _buildKeyStageButton({
    required String keyStage,
    required String label,
    required String grades,
    required IconData icon,
  }) {
    final isSelected = _selectedKeyStage == keyStage;

    return SizedBox(
      height: 104,
      child: ElevatedButton(
        onPressed: _isLoading
            ? null
            : () => setState(() => _selectedKeyStage = keyStage),
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected
              ? AppTheme.primaryOrange
              : AppTheme.veryLightOrange,
          foregroundColor: isSelected ? Colors.white : AppTheme.darkOrange,
          elevation: isSelected ? 4 : 0,
          side: BorderSide(
            color: isSelected ? AppTheme.darkOrange : AppTheme.lightOrange,
            width: 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 28),
            const SizedBox(height: 4),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              grades,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
