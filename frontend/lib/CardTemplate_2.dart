import 'package:flutter/material.dart';
import 'card_object.dart';
import 'constants.dart';

class CardTemplate_2 extends StatefulWidget {
  final BusinessCardModel data;
  final bool editable;

  const CardTemplate_2({super.key, required this.data, this.editable = false});

  @override
  State<CardTemplate_2> createState() => _CardTemplate_2State();
}

class _CardTemplate_2State extends State<CardTemplate_2> {
  late TextEditingController _nameController;
  late TextEditingController _titleController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.data.name);
    _titleController = TextEditingController(text: widget.data.title ?? '');
    _emailController = TextEditingController(text: widget.data.email ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _titleController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Container(
        height: widget.editable ? 400 : 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              // diagonal gradient background
              Positioned.fill(
                child: Image.network(
                  (widget.data.background?.isNotEmpty ?? false)
                      ? widget.data.background!
                      : kTemplateBackground_1,
                  fit: BoxFit.cover,
                ),
              ),

              // Top-left avatar
              Positioned(
                top: 16,
                left: 16,
                child: GestureDetector(
                  onTap: widget.editable ? () {} : null,
                  child: CircleAvatar(
                    radius: 34,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.network(
                        widget.data.imagePath ?? kTemplateImage_1,
                        width: 64,
                        height: 64,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),

              // Bottom-left: name + title
              Positioned(
                left: 16,
                bottom: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.editable
                        ? SizedBox(
                            width: 180,
                            height: 30,
                            child: TextField(
                              controller: _nameController,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Your Name',
                                hintStyle: TextStyle(color: Colors.white70),
                              ),
                            ),
                          )
                        : Text(
                            widget.data.name.isNotEmpty
                                ? widget.data.name
                                : 'Your Name',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),

                    widget.editable
                        ? SizedBox(
                            width: 180,
                            height: 30,
                            child: TextField(
                              controller: _titleController,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Your Title',
                                hintStyle: TextStyle(color: Colors.white54),
                              ),
                            ),
                          )
                        : Text(
                            (widget.data.title?.isNotEmpty ?? false)
                                ? widget.data.title!
                                : 'Your Title',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                  ],
                ),
              ),

              // Bottom-right: email + phone chips
              Positioned(
                right: 16,
                bottom: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (widget.data.email != null &&
                        widget.data.email!.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        margin: const EdgeInsets.only(bottom: 6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.85),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: widget.editable
                            ? IntrinsicWidth(
                                child: TextField(
                                  controller: _emailController,
                                  style: const TextStyle(fontSize: 13),
                                  decoration: const InputDecoration(
                                    isCollapsed: true,
                                    border: InputBorder.none,
                                    hintText: 'your@email.com',
                                  ),
                                ),
                              )
                            : Text(
                                widget.data.email!,
                                style: const TextStyle(fontSize: 13),
                              ),
                      ),
                    if (widget.data.phone != null &&
                        widget.data.phone!.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.85),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          widget.data.phone!,
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                  ],
                ),
              ),

              // QR top-right (only in edit mode)
              if (widget.editable)
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    width: 250,
                    height: 250,
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/QR_Code_Example.svg/1200px-QR_Code_Example.svg.png',
                      fit: BoxFit.contain,
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
