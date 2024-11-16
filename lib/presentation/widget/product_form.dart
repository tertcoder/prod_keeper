import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prod_keeper/core/theme/color_pallette.dart';
import 'package:prod_keeper/data/model/product_model.dart';
import 'package:prod_keeper/domain/entity/product.dart';
import 'package:prod_keeper/presentation/blocs/bloc/product_bloc.dart';

class ProductForm extends StatefulWidget {
  final Product? product;
  const ProductForm({super.key, this.product});

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final formKey = GlobalKey<FormState>();
  File? _selectedImage;
  final _picker = ImagePicker();

  late TextEditingController _titleController = TextEditingController();
  late TextEditingController _priceController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController(text: widget.product?.title ?? "");
    _priceController =
        TextEditingController(text: widget.product?.price.toString() ?? "");
    _selectedImage = widget.product != null && widget.product!.image.isNotEmpty
        ? File(widget.product!.image)
        : null;
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _saveProduct(BuildContext ctx) {
    if (formKey.currentState!.validate()) {
      final title = _titleController.text.trim();
      final price = double.tryParse((_priceController.text).trim()) ?? 0.0;
      final imagePath = _selectedImage?.path ?? "assets/images/logo.png";

      if (widget.product != null) {
        final updatedProduct = widget.product!.copyWith(
          title: title,
          price: price,
          image: imagePath,
        );
        context.read<ProductBloc>().add(UpdateExistingProduct(updatedProduct));
        Navigator.of(context).pop();
      } else {
        final newProduct = ProductModel(
          title: title,
          price: price,
          image: _selectedImage?.path ?? "assets/images/logo.png",
        );
        context.read<ProductBloc>().add(AddNewProduct(newProduct));
        Navigator.of(context).pop();
      }
    }
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
                            : _selectedImage!.path.startsWith(
                                    "/data/user/0/com.prodkeeper.prod_keeper/cache/")
                                ? Image.file(
                                    _selectedImage!,
                                    fit: BoxFit.cover,
                                    width: 145,
                                    height: 125,
                                  )
                                : Image.asset(
                                    _selectedImage!.path,
                                    fit: BoxFit.cover,
                                    width: 145,
                                    height: 125,
                                  ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Form(
                    key: formKey,
                    child: Expanded(
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'required!';
                              }
                              return null;
                            },
                            cursorColor: ColorPallette.textColor,
                            decoration: InputDecoration(
                              fillColor:
                                  ColorPallette.textColor.withOpacity(0.1),
                              filled: true,
                              hintText: "Product name",
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            controller: _titleController,
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'required!';
                              }
                              return null;
                            },
                            cursorColor: ColorPallette.textColor,
                            decoration: InputDecoration(
                              fillColor:
                                  ColorPallette.textColor.withOpacity(0.1),
                              filled: true,
                              hintText: "Price",
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            controller: _priceController,
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () => _saveProduct(context),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: ColorPallette.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      widget.product != null ? "Update Product" : "Add Product",
                      style: GoogleFonts.firaSans().copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ColorPallette.backgroundColor,
                      ),
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
