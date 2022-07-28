import 'package:demo_book_reader/extensions/build_context_extensions.dart';
import 'package:epub_view/epub_view.dart';
import 'package:flutter/material.dart';

class EpubViewPage extends StatefulWidget {
  const EpubViewPage({Key? key, required this.linkEpub}) : super(key: key);
  final String linkEpub;

  @override
  State<EpubViewPage> createState() => _EpubViewPageState();
}

class _EpubViewPageState extends State<EpubViewPage> {
  late EpubController _epubReaderController;

  @override
  void initState() {
    super.initState();
    _epubReaderController = EpubController(
      document: EpubDocument.openAsset('assets/epub/${widget.linkEpub}.epub'),
    );
  }

  @override
  void dispose() {
    _epubReaderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: EpubViewActualChapter(
          controller: _epubReaderController,
          builder: (chapterValue) {
            return Text(
              chapterValue?.chapter?.Title?.replaceAll('\n', '').trim() ?? '',
              textAlign: TextAlign.start,
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save_alt),
            color: Colors.white,
            onPressed: () => _showCurrentEpubCfi(context),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            color: Colors.white,
            onPressed: () => context.off(),
          ),
        ],
      ),
      drawer: Drawer(
        child: EpubViewTableOfContents(
          controller: _epubReaderController,
        ),
      ),
      body: EpubView(
        builders: EpubViewBuilders<DefaultBuilderOptions>(
          options: const DefaultBuilderOptions(),
          chapterDividerBuilder: (_) => const Divider(),
        ),
        controller: _epubReaderController,
      ),
    );
  }

  void _showCurrentEpubCfi(context) {
    final cfi = _epubReaderController.generateEpubCfi();

    if (cfi != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(cfi),
          action: SnackBarAction(
            label: 'GO',
            onPressed: () {
              _epubReaderController.gotoEpubCfi(cfi);
            },
          ),
        ),
      );
    }
  }
}
