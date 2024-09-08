import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isar/isar.dart';
import 'package:prod_keeper/core/theme/color_pallette.dart';
import 'package:prod_keeper/presentation/widget/text_input.dart';

class ProductForm extends StatefulWidget {
  const ProductForm({super.key});

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final formKey = GlobalKey<FormState>();
  File? _selectedImage;
  final _picker = ImagePicker();

  final _titleController = TextEditingController();
  final _priceController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _saveProduct() {
    // if (formKey.currentState!.validate()) {
    print(
        "title ${_titleController.value.text}\nprice ${_priceController.value.text}\nimage $_selectedImage");
    // Navigator.of(context).pop();
    // }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorPallette.whiteColor,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      width: 145,
                      height: 125,
                      decoration: BoxDecoration(
                        color: ColorPallette.textColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Center(
                        child: _selectedImage == null
                            ? SvgPicture.asset("assets/icons/img.svg")
                            : Image.file(
                                _selectedImage!,
                                fit: BoxFit.cover,
                                width: 145,
                                height: 125,
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: [
                        TextInput(
                          hintText: "Product name",
                          controller: _titleController,
                        ),
                        const SizedBox(height: 10),
                        TextInput(
                          hintText: "Price",
                          keyboardType: const TextInputType.numberWithOptions(),
                          controller: _priceController,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Container(
                width: double.infinity,
                // padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: ColorPallette.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: _saveProduct,
                  child: Text(
                    "Add the Product",
                    style: GoogleFonts.firaSans().copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: ColorPallette.backgroundColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
