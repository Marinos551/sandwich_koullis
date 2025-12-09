// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:sandwich_koullis/views/app_styles.dart';
import 'package:provider/provider.dart';
import 'package:sandwich_koullis/models/cart.dart';
import 'package:sandwich_koullis/views/styled_button.dart';
import 'package:sandwich_koullis/views/main_scaffold.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _phoneCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    super.dispose();
  }

  void _onSave() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile saved')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 100,
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
          title: Text('Profile', style: heading1),
          actions: [
            Consumer<Cart>(
              builder: (context, cart, child) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.shopping_cart),
                      const SizedBox(width: 4),
                      Text('${cart.countOfItems}'),
                    ],
                  ),
                );
              },
            ),
          ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                key: const Key('profile_name'),
                controller: _nameCtrl,
                decoration: const InputDecoration(labelText: 'Name'),
                style: normalText,
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Enter a name' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                key: const Key('profile_email'),
                controller: _emailCtrl,
                decoration: const InputDecoration(labelText: 'Email'),
                style: normalText,
                keyboardType: TextInputType.emailAddress,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return 'Enter an email';
                  if (!v.contains('@')) return 'Enter a valid email';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                key: const Key('profile_phone'),
                controller: _phoneCtrl,
                decoration: const InputDecoration(labelText: 'Phone'),
                style: normalText,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: StyledButton(
                      key: const Key('profile_save'),
                      onPressed: _onSave,
                      icon: Icons.save,
                      label: 'Save',
                      backgroundColor: Colors.green,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: StyledButton(
                      key: const Key('profile_cancel'),
                      onPressed: () => Navigator.pop(context),
                      icon: Icons.cancel,
                      label: 'Cancel',
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
