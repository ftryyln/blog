import 'package:blog/ui/article/update/update_article_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateArticlePage extends StatelessWidget {
  const UpdateArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateArticleController>(
        init: UpdateArticleController(),
        builder: (c) => Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                  leading: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back_ios_new_rounded,
                          color: Colors.white, size: 32)),
                  iconTheme: IconThemeData(color: Colors.white),
                  backgroundColor: Colors.black,
                  title: Text('Edit',
                      style: GoogleFonts.urbanist(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)))),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          c.getSinglePhoto();
                        },
                        child: Container(
                          width: Get.size.width * 0.9,
                          height: Get.size.width * 0.9,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          child: c.gettedPhoto != null
                              ? Image.file(
                                  c.gettedPhoto!,
                                  fit: BoxFit.fill,
                                )
                              : Image.network(
                                  c.articleDetailModel?.data?.image ?? '',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Center(
                                          child: Text(
                                    'wait',
                                    style: GoogleFonts.urbanist(fontSize: 20, color: Colors.white),
                                  )),
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Title',
                              style: GoogleFonts.urbanist(fontSize: 16, color: Colors.white),
                            ),
                            TextFormField(
                              controller: c.titleController
                                ..text =
                                    c.articleDetailModel?.data?.title ?? '',
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusColor: Colors.green,
                                  hoverColor: Colors.amber,
                                  hintText: 'Title',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Description',
                                  style: GoogleFonts.urbanist(fontSize: 16, color: Colors.white),
                                ),
                                TextFormField(
                                  controller: c.contentController
                                    ..text =
                                        c.articleDetailModel?.data?.content ??
                                            '',
                                  maxLines: 4,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      focusColor: Colors.green,
                                      hintText: 'Description',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          c.updateBlog();
                        },
                        child: Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                              child: Text(
                                'Post',
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
