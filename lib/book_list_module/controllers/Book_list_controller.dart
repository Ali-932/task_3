import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Models/Booklist.dart';

class Books_controller extends GetxController{

  RxList<booklist> books = <booklist>[].obs;
  final bookName=TextEditingController();
  final Author_controller=TextEditingController();
  final price_controller=TextEditingController();
  final link_controller=TextEditingController();
  final description_controller=TextEditingController();
  @override
  void onInit() {
    AddBooks();
    super.onInit();
  }
  void AddBooks(){
    books.value.add(booklist(bookName: 'To Kill a Mockingbird', authorName: 'Harper lee', price: 13.9, link: 'https://images-na.ssl-images-amazon.com/images/I/51N5qVjuKAL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg', descriotions: '''One of the most cherished stories of all time, To Kill a Mockingbird has been translated into more than forty languages, sold more than forty million copies worldwide, served as the basis for an enormously popular motion picture, and was voted one of the best novels of the twentieth century by librarians across the country.'''));
    books.value.add(booklist(bookName: 'The Silent Patient', authorName: 'Alex Michaelides', price: 6.55, link: 'https://images-na.ssl-images-amazon.com/images/I/41bsvxNUSdL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg', descriotions: '''Alicia Berenson’s life is seemingly perfect. A famous painter married to an in-demand fashion photographer, she lives in a grand house with big windows overlooking a park in one of London’s most desirable areas. One evening her husband Gabriel returns home late from a fashion shoot, and Alicia shoots him five times in the face, and then never speaks another word..'''));
    books.value.add(booklist(bookName: 'The Outsiders', authorName: 'S. E. Hinton', price: 1.49, link: 'https://images-na.ssl-images-amazon.com/images/I/41yefAxrEnL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg', descriotions: '''No one ever said life was easy. But Ponyboy is pretty sure that he's got things figured out. He knows that he can count on his brothers, Darry and Sodapop. And he knows that he can count on his friends—true friends who would do anything for him, like Johnny and Two-Bit. But not on much else besides trouble with the Socs, a vicious gang of rich kids whose idea of a good time is beating up on “greasers” like Ponyboy. At least he knows what to expect—until the night someone takes things too far.'''));
    books.value.add(booklist(bookName: 'Lord of the Flies', authorName: 'William Golding', price: 1.88, link: 'https://images-na.ssl-images-amazon.com/images/I/51eeAWItwbL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg', descriotions: '''At the dawn of the next world war, a plane crashes on an uncharted island, stranding a group of schoolboys. At first, with no adult supervision, their freedom is something to celebrate. This far from civilization they can do anything they want. Anything. But as order collapses, as strange howls echo in the night, as terror begins its reign, the hope of adventure seems as far removed from reality as the hope of being rescued.'''));
    books.value.add(booklist(bookName: 'Kafka on the Shore', authorName: 'Haruki Murakami ', price: 13.55, link: 'https://images-na.ssl-images-amazon.com/images/I/3190fsfp48L._SY291_BO1,204,203,200_QL40_FMwebp_.jpg', descriotions: '''Kafka on the Shore follows the fortunes of two remarkable characters. Kafka Tamura runs away from home at fifteen, under the shadow of his father's dark prophesy. The aging Nakata, tracker of lost cats, who never recovered from a bizarre childhood affliction, finds his pleasantly simplified life suddenly turned upside down. Their parallel odysseys are enriched throughout by vivid accomplices and mesmerising dramas'''));

  }
  void Add(String name,String Author,String price,String link,String description){
    double dprice=double.parse(price);
    books.value.add(booklist(bookName: name, authorName: Author, price: dprice, link: link, descriotions: description));
    bookName.clear();
    Author_controller.clear();
    price_controller.clear();
    link_controller.clear();
    description_controller.clear();
  }
  // void AddReview(String review,booklist book){
  //   book.review.add(review);
  //
  // }
}
