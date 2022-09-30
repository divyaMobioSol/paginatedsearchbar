import 'package:endless/pagination/endless_pagination_delegate.dart';
import 'package:flutter/material.dart';
import 'package:paginated_search_bar/paginated_search_bar.dart';

class PaginatedScreen extends StatefulWidget {
  const PaginatedScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<PaginatedScreen> createState() => _PaginatedScreenState();
}

class _PaginatedScreenState extends State<PaginatedScreen> {
  @override
  Widget build(BuildContext context) {
    ExampleItemPager pager = ExampleItemPager();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 200),
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 600,
                child: PaginatedSearchBar<ExampleItem>(
                  maxHeight: 300,
                  hintText: 'Search',
                  emptyBuilder: (context) {
                    return const Text("No data found");
                  },
                  placeholderBuilder: (context) {
                    return const Text("Enter data");
                  },
                  paginationDelegate: EndlessPaginationDelegate(
                    pageSize: 20,
                    maxPages: 4,
                  ),
                  onSearch: ({
                    required pageIndex,
                    required pageSize,
                    required searchQuery,
                  }) async {
                    return Future.delayed(const Duration(milliseconds: 1300),
                        () {
                      if (searchQuery == "empty") {
                        return [];
                      }

                      if (pageIndex == 0) {
                        pager = ExampleItemPager();
                      }

                      return pager.nextBatch(searchQuery, pageIndex, pageSize);
                    });
                  },
                  itemBuilder: (
                    context, {
                    required item,
                    required index,
                  }) {
                    return Text(item.title);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExampleItem {
  final String title;

  ExampleItem({
    required this.title,
  });
}

final exData = [
  ExampleItem(
    title: 'Rafaela Pinho',
  ),
  ExampleItem(
    title: 'Paulo Emilio Silva ',
  ),
  ExampleItem(
    title: 'Pedro Gomes ',
  ),
  ExampleItem(
    title: 'Orlando Guerra ',
  ),
  ExampleItem(
    title: 'Zacarias Triste',
  ),
  ExampleItem(
    title: 'Antonio Rabelo',
  ),
  ExampleItem(
    title: 'Leticia Maciel',
  ),
  ExampleItem(
    title: 'Patricia Oliveira',
  ),
  ExampleItem(
    title: 'Pedro Lima',
  ),
  ExampleItem(
    title: 'Junior Rabelo',
  ),
  ExampleItem(
    title: 'Lucia Maciel',
  ),
  ExampleItem(
    title: 'Ana Oliveira',
  ),
  ExampleItem(
    title: 'Thiago Silva',
  ),
  ExampleItem(
    title: 'Charles Ristow',
  ),
  ExampleItem(
    title: 'Raquel Montenegro',
  ),
  ExampleItem(
    title: 'Rafael Peireira',
  ),
  ExampleItem(
    title: 'Nome Comum',
  ),
];

class ExampleItemPager {
  int pageIndex = 0;
  final int pageSize;

  ExampleItemPager({
    this.pageSize = 20,
  });

  List<ExampleItem> nextBatch(String query, int pageIndex, int pageSize) {
    List<ExampleItem> batch = [];

    for (int i = 0; i < pageSize; i++) {
      batch.addAll(exData
          .where((element) => element.title
              .toLowerCase()
              .trim()
              .contains(query.toLowerCase().trim()))
          .toList());
    }
    //batch.addAll(exData.where((element) => element.title.toLowerCase().trim().contains(query.toLowerCase().trim())).toList());
    pageIndex += 1;

    return batch;
  }
}
