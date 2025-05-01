// File: lib/widgets/new_item.dart

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/category.dart';
import 'package:shopping_list/models/grocery_item.dart';

/// Form screen to create and submit a new [GroceryItem].
class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables]!;
  var _isSending = false;

  /// Validates and submits the form, then posts the new item to Firebase.
  void _saveItem() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    _formKey.currentState!.save();
    setState(() => _isSending = true);

    final url = Uri.https(
      'shopping-list-app-2ad8c-default-rtdb.firebaseio.com',
      'shopping-list.json',
    );

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'name': _enteredName,
        'quantity': _enteredQuantity,
        'category': _selectedCategory.title,
      }),
    );

    final Map<String, dynamic> resData = json.decode(response.body);

    if (!context.mounted) return;

    Navigator.of(context).pop(
      GroceryItem(
        id: resData['name'],
        name: _enteredName,
        quantity: _enteredQuantity,
        category: _selectedCategory,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add a new item')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Name input
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(label: Text('Name')),
                validator: (value) {
                  if (value == null ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return 'Must be between 1 and 50 characters.';
                  }
                  return null;
                },
                onSaved: (value) => _enteredName = value!,
              ),

              // Quantity + Category
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(label: Text('Quantity')),
                      keyboardType: TextInputType.number,
                      initialValue: _enteredQuantity.toString(),
                      validator: (value) {
                        final number = int.tryParse(value ?? '');
                        if (number == null || number <= 0) {
                          return 'Must be a valid, positive number.';
                        }
                        return null;
                      },
                      onSaved: (value) =>
                      _enteredQuantity = int.parse(value!),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectedCategory,
                      items: [
                        for (final category in categories.entries)
                          DropdownMenuItem(
                            value: category.value,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: category.value.color,
                                ),
                                const SizedBox(width: 6),
                                Text(category.value.title),
                              ],
                            ),
                          ),
                      ],
                      onChanged: (value) =>
                          setState(() => _selectedCategory = value!),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed:
                    _isSending ? null : () => _formKey.currentState?.reset(),
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: _isSending ? null : _saveItem,
                    child: _isSending
                        ? const SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                        : const Text('Add Item'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
