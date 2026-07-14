import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';

class FormsPage extends StatelessWidget {
  const FormsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AppText('Forms', variant: AppTextVariant.titleLarge)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _ShowcaseSection(
            title: 'Registration Form Example',
            child: _RegistrationForm(),
          ),
        ],
      ),
    );
  }
}

class _RegistrationForm extends StatefulWidget {
  const _RegistrationForm();

  @override
  State<_RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<_RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          UsernameField(
            label: 'Username',
            hint: 'Enter your username',
            validator: (value) {
              if (value == null || value.isEmpty) return 'Username is required';
              return null;
            },
          ),
          AppSpacing.md.vGap,
          EmailField(
            label: 'Email',
            hint: 'Enter your email',
            validator: (value) {
              if (value == null || value.isEmpty) return 'Email is required';
              if (!value.contains('@')) return 'Invalid email';
              return null;
            },
          ),
          AppSpacing.md.vGap,
          PasswordField(
            label: 'Password',
            hint: 'Enter your password',
            validator: (value) {
              if (value == null || value.isEmpty) return 'Password is required';
              return null;
            },
          ),
          AppSpacing.xl.vGap,
          AppButton.primary(
            label: 'Submit',
            expanded: true,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: AppText('Processing Data', variant: AppTextVariant.bodyMedium, color: Colors.white)),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class _ShowcaseSection extends StatelessWidget {
  final String title;
  final Widget child;

  const _ShowcaseSection({
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title,
          variant: AppTextVariant.titleMedium,
        ),
        AppSpacing.sm.vGap,
        child,
        AppSpacing.xxl.vGap,
      ],
    );
  }
}
