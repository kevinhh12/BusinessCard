import 'package:flutter/material.dart';
import 'card_object.dart';
import 'constants.dart';

class CardTemplate_3 extends StatefulWidget {
  final BusinessCardModel data;
  final bool editable;

  const CardTemplate_3({super.key, required this.data, this.editable = false});

  @override
  State<CardTemplate_3> createState() => _CardTemplate_3State();
}

class _CardTemplate_3State extends State<CardTemplate_3> {
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
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: Container(
        height: widget.editable ? 400 : 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(1, -10),
              blurRadius: 20,
              spreadRadius: -10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final leftPanelWidth = constraints.maxWidth * 0.35;

              return Stack(
                children: [
                  // Background image
                  Positioned.fill(
                    child: Image.network(
                      (widget.data.background?.isNotEmpty ?? false)
                          ? widget.data.background!
                          : kTemplateBackground_1,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Subtle dark gradient to improve contrast on the right half
                  Positioned.fill(
                    child: IgnorePointer(
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.transparent, Colors.black38],
                            stops: [0.4, 1.0],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // LEFT FIXED PANEL
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    width: leftPanelWidth,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.55),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Avatar (centered in panel)
                          GestureDetector(
                            onTap: widget.editable
                                ? () {}
                                : null, // TODO: picker
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                radius: widget.editable ? 46 : 34,
                                backgroundImage: NetworkImage(
                                  widget.data.imagePath ?? kTemplateImage_1,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          // Email small pill (view mode) under avatar, or editor in edit mode at right side
                          if (!widget.editable &&
                              (widget.data.email?.isNotEmpty ?? false))
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                widget.data.email!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black87,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),

                  // RIGHT CONTENT (name/title/phone/email editor)
                  Positioned(
                    left: leftPanelWidth + 16,
                    right: 16,
                    top: 16,
                    bottom: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // NAME
                        widget.editable
                            ? TextField(
                                controller: _nameController,
                                style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Your Name',
                                  hintStyle: TextStyle(color: Colors.white70),
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
                        const SizedBox(height: 6),

                        // TITLE
                        widget.editable
                            ? TextField(
                                controller: _titleController,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
                                ),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Your Title',
                                  hintStyle: TextStyle(color: Colors.white54),
                                ),
                              )
                            : Text(
                                (widget.data.title?.isNotEmpty ?? false)
                                    ? widget.data.title!
                                    : 'Your Title',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
                                ),
                              ),

                        const Spacer(),

                        // CONTACT ROW (phone + email editor if editing)
                        Row(
                          children: [
                            if ((widget.data.phone?.isNotEmpty ?? false))
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),

                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.phone,
                                      size: 14,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      widget.data.phone!,
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            if (widget.editable)
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.95),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: TextField(
                                      controller: _emailController,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black87,
                                      ),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'your.email@example.com',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // QR bottom-right (only when editable)
                  if (widget.editable)
                    Positioned(
                      right:
                          MediaQuery.of(context).size.width *
                          0.15, // 5% from right
                      bottom:
                          MediaQuery.of(context).size.height *
                          0.10, // 5% from bottom
                      child: Container(
                        width:
                            MediaQuery.of(context).size.width *
                            0.40, // ~18% of width
                        height: MediaQuery.of(context).size.width * 0.40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(6),
                        child: Image.network(
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/QR_Code_Example.svg/1200px-QR_Code_Example.svg.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
