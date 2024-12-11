import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_quill/flutter_quill.dart';

class ComposeMailPage extends StatelessWidget {
  ComposeMailPage({super.key});
  final QuillController _controller = QuillController.basic();
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (p0, isKeyboardVisible) => Scaffold(
        appBar: AppBar(
          title: const Text('Compose Mail'),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                // Handle send mail logic
                print('Mail sent!');
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Recipient Field
              const TextField(
                decoration: InputDecoration(
                  labelText: 'From',
                  hintText: 'abc@gmail.com',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'To',
                  hintText: 'Recipient email address',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              const TextField(
                decoration: InputDecoration(
                  labelText: 'Subject',
                  hintText: 'Subject',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              // Subject Field
              // HTML Editor for Email Body

              const SizedBox(height: 16),

              // Body Field
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: QuillEditor.basic(
                    controller: _controller,
                    focusNode: _focusNode,
                    configurations: const QuillEditorConfigurations(),
                  ),
                ),
              ),
              // Formatting Toolbar
              // Container(
              //   padding: const EdgeInsets.symmetric(vertical: 8.0),
              //   color: Colors.grey[200],
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     children: [
              //       DropdownButton<String>(
              //         value: 'Arial',
              //         items: const [
              //           DropdownMenuItem(value: 'Arial', child: Text('Arial')),
              //           DropdownMenuItem(
              //               value: 'Times New Roman',
              //               child: Text('Times New Roman')),
              //         ],
              //         onChanged: (value) {
              //           // Handle font change
              //         },
              //       ),
              //       DropdownButton<int>(
              //         value: 14,
              //         items: List.generate(20, (index) => index + 8).map((size) {
              //           return DropdownMenuItem(
              //             value: size,
              //             child: Text(size.toString()),
              //           );
              //         }).toList(),
              //         onChanged: (value) {
              //           // Handle font size change
              //         },
              //       ),
              //       IconButton(
              //         icon: const Icon(Icons.format_bold),
              //         onPressed: () {
              //           // Handle bold formatting
              //         },
              //       ),
              //       IconButton(
              //         icon: const Icon(Icons.format_italic),
              //         onPressed: () {
              //           // Handle italic formatting
              //         },
              //       ),
              //       IconButton(
              //         icon: const Icon(Icons.format_underline),
              //         onPressed: () {
              //           // Handle underline formatting
              //         },
              //       ),
              //       IconButton(
              //         icon: const Icon(Icons.format_align_left),
              //         onPressed: () {
              //           // Handle left align
              //         },
              //       ),
              //       IconButton(
              //         icon: const Icon(Icons.format_align_center),
              //         onPressed: () {
              //           // Handle center align
              //         },
              //       ),
              //       IconButton(
              //         icon: const Icon(Icons.format_align_right),
              //         onPressed: () {
              //           // Handle right align
              //         },
              //       ),
              //       IconButton(
              //         icon: const Icon(Icons.emoji_emotions),
              //         onPressed: () {
              //           // Handle emoji insert
              //         },
              //       ),
              //       IconButton(
              //         icon: const Icon(Icons.attach_file),
              //         onPressed: () {
              //           // Handle file attachment
              //         },
              //       ),
              //       IconButton(
              //         icon: const Icon(Icons.link),
              //         onPressed: () {
              //           // Handle link insert
              //         },
              //       ),
              //     ],
              //   ),
              // ),
              isKeyboardVisible
                  ? Container()
                  : QuillSimpleToolbar(
                      controller: _controller,
                      configurations: const QuillSimpleToolbarConfigurations(
                          buttonOptions: QuillSimpleToolbarButtonOptions(),
                          showBoldButton: true,
                          showHeaderStyle: false,
                          showCodeBlock: false,
                          showClipboardCopy: false,
                          showClipboardPaste: false,
                          showClipboardCut: false,
                          showListCheck: false,
                          showBackgroundColorButton: false,
                          showClearFormat: false,
                          showColorButton: false,
                          showDividers: false,
                          showAlignmentButtons: true,
                          showCenterAlignment: true,
                          showDirection: false,
                          showFontFamily: true,
                          showFontSize: true,
                          showIndent: false,
                          showInlineCode: false,
                          showItalicButton: true,
                          showJustifyAlignment: true,
                          showLeftAlignment: true,
                          showLineHeightButton: false,
                          showLink: true,
                          showListBullets: false,
                          showRightAlignment: true,
                          showListNumbers: false,
                          showQuote: false,
                          showRedo: false,
                          showSearchButton: false,
                          showSmallButton: false,
                          showStrikeThrough: false,
                          showSubscript: false,
                          showSuperscript: false,
                          showUnderLineButton: false,
                          showUndo: false,
                          toolbarSectionSpacing: BorderSide.strokeAlignCenter,
                          toolbarSize: 20),
                    ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.attach_file),
          onPressed: () {
            // Handle file attachment logic
            print('Attachment added!');
          },
        ),
      ),
    );
  }
}
