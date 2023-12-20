import 'package:flutter/material.dart';
import 'package:markt/domain/productDTO.dart';
import 'package:markt/data/product_draft_repository.dart';

class DraftOption extends StatefulWidget {

  final ProductDTO product;

  const DraftOption({super.key, required this.product});

  @override
  State<DraftOption> createState() => _DraftOptionState();
}

class _DraftOptionState extends State<DraftOption> {

  final productDraftRepository = ProductDraftRepository();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
            onPressed: () {
              productDraftRepository.deleteProductDraft(widget.product.id);
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () {

            },
          ),
        ],
      ),
    );
  }

}
