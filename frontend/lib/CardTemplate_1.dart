import 'package:flutter/material.dart';
import 'card_object.dart';
import 'constants.dart';

class CardTemplate_1 extends StatefulWidget {
  final BusinessCardModel data;
  final bool editable;

  const CardTemplate_1({super.key, required this.data, this.editable = false});

  @override
  State<CardTemplate_1> createState() => _CardTemplate_1State();
}

class _CardTemplate_1State extends State<CardTemplate_1> {
  late TextEditingController _nameController;
  late TextEditingController _titleController;
  late TextEditingController _emailController;

  @override
  void initState() {
    // initialize the texteditor
    super.initState();
    _nameController = TextEditingController(text: widget.data.name);
    _titleController = TextEditingController(text: widget.data.title ?? '');
    _emailController = TextEditingController(text: widget.data.email ?? '');
  }

  @override
  void dispose() {
    // remove when it is not visible
    _nameController.dispose();
    _titleController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: Container(
        height: widget.editable ? 400 : 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: const Offset(1, -10), // Only show shadow on top
              blurRadius: 20,
              spreadRadius: -10, // Avoid glowing shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // background
              Positioned.fill(
                child: Image.network(
                  (widget.data.background?.isNotEmpty ?? false)
                      ? widget.data.background!
                      : kTemplateBackground_1,
                  fit: BoxFit.cover,
                ),
              ),

              // 🔹 Avatar or image on top
              Positioned(
                left: 16,
                top: 20,
                child: GestureDetector(
                  onTap: widget.editable
                      ? () {
                          // TODO: image picker logic
                        }
                      : null,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      widget.data.imagePath ?? kTemplateImage_1,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // 🔹 Name
              Positioned(
                left: 110,
                top: 25,
                child: widget.editable
                    ? SizedBox(
                        width: 250,
                        child: TextField(
                          controller: _nameController,
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Your Name',
                          ),
                        ),
                      )
                    : Text(
                        widget.data.name.isNotEmpty
                            ? widget.data.name
                            : 'Your Name',
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),

              // 🔹 Title
              Positioned(
                left: 110,
                top: 65,
                child: widget.editable
                    ? SizedBox(
                        width: 250,
                        child: TextField(
                          controller: _titleController,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Your Title',
                          ),
                        ),
                      )
                    : Text(
                        widget.data.title?.isNotEmpty == true
                            ? widget.data.title!
                            : 'Your Title',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
              ),

              // QR Code
              if (widget.editable)
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Center(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double size = constraints.maxWidth * 0.5;
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          width: size,
                          height: size,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/QR_Code_Example.svg/1200px-QR_Code_Example.svg.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

              // 🔹 Email
              Positioned(
                left: 16,
                bottom: 16,
                child: widget.editable
                    ? SizedBox(
                        width: 250,
                        child: TextField(
                          controller: _emailController,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'your.email@example.com',
                          ),
                        ),
                      )
                    : Text(
                        widget.data.email?.isNotEmpty == true
                            ? widget.data.email!
                            : 'your.email@example.com',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
