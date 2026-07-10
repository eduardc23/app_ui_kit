import 'package:app_ui_kit/app_ui_kit.dart';
import 'package:flutter/material.dart';
import 'section_header.dart';

class TextFieldsSection extends StatelessWidget {
  const TextFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Campos de Texto'),
        const AppTextField(
          label: 'Con Icono',
          hint: 'usuario@ejemplo.com',
          prefixIcon: AppIcon(Icons.email_outlined),
        ),
        AppSpacing.md.vGap,
        const AppTextField(
          label: 'Oculto (Contraseña)',
          obscureText: true,
          prefixIcon: AppIcon(Icons.lock_outline),
        ),
        AppSpacing.md.vGap,
        const AppTextField(
          label: 'Estado de Error',
          errorText: 'Dirección de correo no válida',
          prefixIcon: AppIcon(Icons.error_outline),
        ),
        AppSpacing.md.vGap,
        const AppTextField(
          label: 'Estado Deshabilitado',
          enabled: false,
          initialValue: 'Texto de solo lectura',
          prefixIcon: AppIcon(Icons.block),
        ),
        AppSpacing.xl.vGap,
        const SectionHeader(title: 'Campos Especializados (Moléculas)'),
        const EmailField(),
        AppSpacing.md.vGap,
        const PasswordField(),
        AppSpacing.md.vGap,
        const UsernameField(),
      ],
    );
  }
}
