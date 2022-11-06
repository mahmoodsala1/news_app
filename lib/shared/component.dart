import 'package:flutter/material.dart';
import 'package:news_app/modules/webview_screen.dart';

Widget articleBuildItem(article, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WebviewScreen(url: article['url'])));
    },
    child: Container(
      height: 120,
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('${article['urlToImage']}'))),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsetsDirectional.only(bottom: 5, top: 5),
                  child: Text(
                    article['title'].toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, height: 1, fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(article['description'].toString(),
                    style: TextStyle(fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
                Text(article['publishedAt'].toString())
              ],
            ),
          )
        ],
      ),
    ),
  );
}
