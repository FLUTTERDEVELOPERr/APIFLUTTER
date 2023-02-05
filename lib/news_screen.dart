import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_web/provider/news_provider.dart';

class NewsScreen extends ConsumerWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsdata = ref.watch(newsProvider);
    return Scaffold(
      body: newsdata.when(
          data: (news) {
            return ListView.builder(
              itemCount: news.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading:
                        Image(image: NetworkImage(news[index].images.main)),
                    title: Text(news[index].name.first),
                    subtitle: Text(news[index].sayings.first),
                    isThreeLine: true,
                  ),
                );
              },
            );
          },
          error: (err, stack) => Text('Error: $err'),
          loading: () => Center(child: const CircularProgressIndicator())),
    );
  }
}
