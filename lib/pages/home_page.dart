import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_moliya/pages/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeController(),
        builder: (HomeController controller) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                iconTheme: const IconThemeData(color: Colors.grey),
                elevation: 1,
                actions: [
                  IconButton(
                    onPressed: (){},
                    color: Colors.grey,
                    icon: const Icon(Icons.search),
                  )
                ],
                title: const Text('Contacts', style: TextStyle(color: Colors.black),),
                centerTitle: true,
              ),
              drawer: const Drawer(),
              floatingActionButton: FloatingActionButton(
                onPressed: (){},
                backgroundColor: Colors.grey.shade100,
                child: const Icon(Icons.edit, color: Colors.grey,),
              ),
              body: PageView(
                children: [
                  !controller.isLoading && controller.users != null ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    key: const PageStorageKey<String>('listView1'),
                    itemCount: controller.users?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        leading: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network('https://randomuser.me/api/portraits/men/${controller.users![index].id}.jpg')
                          ),
                        ),
                        title: Text(controller.users![index].name.toString()),
                        subtitle: Text(controller.users![index].company!.catchPhrase.toString()),
                      );
                    },
                  ) : const Center(
                    child: CircularProgressIndicator(),
                  ),
                  !controller.isLoading && controller.users != null ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    key: const PageStorageKey<String>('listView2'),
                    itemCount: controller.users?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        leading: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network('https://randomuser.me/api/portraits/men/${controller.users![index].id! + 10}.jpg')
                          ),
                        ),
                        title: Text(controller.users![index].name.toString()),
                        subtitle: Text(controller.users![index].phone.toString()),
                      );
                    },
                  ) : const Center(
                    child: CircularProgressIndicator(),
                  )
                ],
              )
          );
        }
    );
  }
}

