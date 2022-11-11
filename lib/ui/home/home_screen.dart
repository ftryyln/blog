import 'package:blog/ui/article/add/add_article_screen.dart';
import 'package:blog/ui/article/update/update_article_screen.dart';
import 'package:blog/ui/auth/login/login_screen.dart';
import 'package:blog/ui/detail/detail_screen.dart';
import 'package:blog/ui/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (c) => Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Text("Blog Orang Gabut",
                    style: GoogleFonts.dancingScript(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold))),
                actions: [
                  IconButton(
                      onPressed: () {
                        c.storage.deleteAuthResponse();
                        Get.offAll(LoginPage());
                        c.logout(
                            c.storage.getCurrentUsername()!, Get.arguments);
                      },
                      icon: const Icon(Icons.logout_rounded,
                          color: Colors.redAccent, size: 32))
                ],
              ),
              body: c.articleModel != null
                  ? RefreshIndicator(
                      onRefresh: () async {
                        c.getArticle(c.token ?? '');
                      },
                      child: ListView.builder(
                          itemCount: c.articleModel?.data?.length,
                          itemBuilder: (context, index) => GestureDetector(
                                onLongPress: () async {
                                  c.deleteArticle(
                                      c.articleModel?.data?[index].id ?? 0,
                                      c.token ?? '');
                                  c.getArticle(c.token ?? '');
                                  c.update();
                                },
                                onTap: () {
                                  Get.to(() => const DetailPage(),
                                      arguments: c.articleModel?.data?[index].id
                                          .toString());
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(top: BorderSide(
                                      color: Colors.grey, width: 1
                                    ))
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height * 0.61,
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        child: AspectRatio(
                                          aspectRatio: 1 / 1,
                                          child: Image.network(
                                              c.articleModel?.data?[index]
                                                      .image ??
                                                  '',
                                              width: 100,
                                              height: 200,
                                              fit: BoxFit.cover, errorBuilder:
                                                  (context, error, stackTrace) {
                                            return const SizedBox(
                                              width: 100,
                                              child: Center(
                                                child: Text(
                                                  'Gak Ada Gambarnya!',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            );
                                          }, loadingBuilder:
                                                  (BuildContext context,
                                                      Widget child,
                                                      ImageChunkEvent?
                                                          loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            }
                                            return Lottie.asset(
                                              'assets/lottie/loading_cat.json', height: 32,
                                              width: 32,
                                            );
                                          }),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              c.articleModel?.data?[index]
                                                      .author ??
                                                  '',
                                              style: GoogleFonts.montserrat(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            SizedBox(
                                              width: 230,
                                              child: Text(
                                                c.articleModel?.data?[index]
                                                        .title ??
                                                    '',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: GoogleFonts.urbanist(
                                                    fontSize: 14,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (context) =>
                                                        AlertDialog(
                                                          title: Text(
                                                              'Aslina mau dihapus?'),
                                                          actions: [
                                                            ElevatedButton(
                                                                onPressed:
                                                                    () async {
                                                                  c.deleteArticle(
                                                                      c.articleModel?.data?[index].id ??
                                                                          0,
                                                                      c.token ??
                                                                          '');
                                                                  c.getArticle(
                                                                      c.token ??
                                                                          '');
                                                                  c.update();
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                style: ElevatedButton.styleFrom(
                                                                    backgroundColor:
                                                                    Colors
                                                                        .red),
                                                                child: const Text(
                                                                    'Iya', style: TextStyle(
                                                                    color: Colors.white
                                                                ))
                                                            ),
                                                            ElevatedButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        context),
                                                                child: const Text(
                                                                  'Gak Jadi', style: TextStyle(
                                                                    color: Colors.blueAccent
                                                                ),)),
                                                          ],
                                                          actionsAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                        ));
                                              },
                                              icon: const Icon(Icons.delete),
                                              color: Colors.red),
                                          IconButton(
                                              onPressed: () {
                                                Get.to(
                                                        () =>
                                                    const UpdateArticlePage(),
                                                    arguments: c.articleModel
                                                        ?.data?[index].id
                                                        .toString());
                                              },
                                              icon: const Icon(
                                                  Icons.edit_rounded,
                                                  color: Colors.green)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.blueAccent,
                child: const Icon(Icons.add, color: Colors.white, size: 32),
                onPressed: () {
                  Get.to(() => const AddArticlePage());
                },
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,
            ));
  }
}
