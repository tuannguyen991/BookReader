import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/models/author/author_model.dart';
import 'package:demo_book_reader/models/book/book_model.dart';
import 'package:demo_book_reader/models/category/category_model.dart';

class BookRepositoryFake implements BookRepository {
  final List<BookModel> bookList = [
    const BookModel(
      id: "0Yo7PgAACAAJ",
      title: "Harry Potter and the Philosopher's Stone",
      description:
          "Harry Potter thinks he is an ordinary boy - until he is rescued by a beetle eyed giant of a man, enrols at Hogwarts School of Witchcraft and Wizardry, learns to play Quidditch and does battle in a deadly duel. All because Harry Potter is a wizard! Follow the adventures of Harry Potter as he discovers the magical, the dangerous, the unpredictable world of Hogwarts School of Witchcraft and Wizardry.",
      pageCount: 332,
      averageRating: 4,
      ratingsCount: 10,
      imageLink:
          "http://books.google.com/books/content?id=0Yo7PgAACAAJ&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE73RXP6Obic8fu3_t4uV49W9RvQMhkhVxrsvcZ6YB8mGuRaixu3nCG-Nem2PSTlLBRxH5rXUnsTlm824KV32DZjGE6kmYacVNrKJFmaT2_f6CDIvaB8gJybnJOeyT9yFfLTJJ1yd&source=gbs_api",
      view: 12141,

      //demo
      authorList: [
        AuthorModel(
          id: "1",
          name: "J. K. Rowling",
          imageLink:
              "https://instagram.fsgn5-2.fna.fbcdn.net/v/t51.2885-19/139602632_1002634246809605_239709236590657798_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fsgn5-2.fna.fbcdn.net&_nc_cat=105&_nc_ohc=2U-zW6Wgzb8AX_-lAbV&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AT845LuW8AxTul5yZHCRQPtzaOUPZXi7v7ojiIrzMRYenQ&oe=62E0CA64&_nc_sid=8fd12b",
        ),
      ],
      categoryList: [
        CategoryModel(
          id: "1",
          name: "Children's stories",
          imageLink:
              "https://img.freepik.com/premium-vector/little-cute-group-three-children-reading-books-sitting-sofa-flat-vector_627350-473.jpg?w=360",
        ),
        CategoryModel(
          id: "2",
          name: "Juvenile Fiction",
          imageLink:
              "https://scontent.fsgn5-15.fna.fbcdn.net/v/t1.18169-9/548913_593033844041426_625302973_n.png?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=lP9Tg-AGCyUAX-CXenw&_nc_ht=scontent.fsgn5-15.fna&oh=00_AT_5NPs_HS7gQGp80zkAgMPA4gkONK8LTv7wJdDrrJt4yA&oe=63009351",
        ),
      ],
    ),
    const BookModel(
      id: "Pac4vgAACAAJ",
      title: "Harry Potter and the Half-blood Prince",
      description:
          "'In a brief statement on Friday night, Minister for Magic Cornelius Fudge confirmed that He Who Must Not Be Named has returned to this country and is once more active. \"It is with great regret that I must confirm that the wizard styling himself Lord - well, you know who I mean - is alive and among us again,\" said Fudge.' These dramatic words appeared in the final pages ofHarry Potter and the Order of the Phoenix. In the midst of this battle of good and evil,Harry Potter and the Half-Blood Prince takes up the story of Harry Potter's sixth year at Hogwarts School of Witchcraft and Wizardry, with Voldemort's power and followers increasing day by day ...",
      pageCount: 1008,
      averageRating: 4.5,
      ratingsCount: 85,
      imageLink:
          "http://books.google.com/books/content?id=Pac4vgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
      view: 1029193,

      //demo
      authorList: [
        AuthorModel(
          id: "1",
          name: "J. K. Rowling",
          imageLink:
              "https://instagram.fsgn5-2.fna.fbcdn.net/v/t51.2885-19/139602632_1002634246809605_239709236590657798_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fsgn5-2.fna.fbcdn.net&_nc_cat=105&_nc_ohc=2U-zW6Wgzb8AX_-lAbV&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AT845LuW8AxTul5yZHCRQPtzaOUPZXi7v7ojiIrzMRYenQ&oe=62E0CA64&_nc_sid=8fd12b",
        ),
      ],
      categoryList: [
        CategoryModel(
          id: "1",
          name: "Children's stories",
          imageLink:
              "https://img.freepik.com/premium-vector/little-cute-group-three-children-reading-books-sitting-sofa-flat-vector_627350-473.jpg?w=360",
        ),
        CategoryModel(
          id: "2",
          name: "Juvenile Fiction",
          imageLink:
              "https://scontent.fsgn5-15.fna.fbcdn.net/v/t1.18169-9/548913_593033844041426_625302973_n.png?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=lP9Tg-AGCyUAX-CXenw&_nc_ht=scontent.fsgn5-15.fna&oh=00_AT_5NPs_HS7gQGp80zkAgMPA4gkONK8LTv7wJdDrrJt4yA&oe=63009351",
        ),
      ],
    ),
    const BookModel(
      id: "HEmJngEACAAJ",
      title: "Behind the Gates",
      description:
          "In a Chicago troubled by the war against the Alliance, Louisa and her best friend, Maddie, disguised as her twin sister, are sent to the exclusive Country Manor School, where they are cut off from the outside world and learn survival skills.",
      pageCount: 211,
      averageRating: 4,
      ratingsCount: 2,
      imageLink:
          "http://books.google.com/books/content?id=HEmJngEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
      view: 1241,

      //demo
      authorList: [
        AuthorModel(
          id: "2",
          name: "Eva Gray",
          imageLink:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6RiJfqmVgObeVExih1kwcYB436elPIgmbKw&usqp=CAU",
        ),
      ],
      categoryList: [
        CategoryModel(
          id: "2",
          name: "Juvenile Fiction",
          imageLink:
              "https://scontent.fsgn5-15.fna.fbcdn.net/v/t1.18169-9/548913_593033844041426_625302973_n.png?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=lP9Tg-AGCyUAX-CXenw&_nc_ht=scontent.fsgn5-15.fna&oh=00_AT_5NPs_HS7gQGp80zkAgMPA4gkONK8LTv7wJdDrrJt4yA&oe=63009351",
        ),
      ],
    ),
    const BookModel(
      id: "0X1PxwEACAAJ",
      title: "One Fair Wage",
      description:
          "\u003cp\u003eFrom the author of the acclaimed Behind the Kitchen Door, a powerful examination of how the subminimum wage and the tipping system exploit society's most vulnerable \u003c/p\u003e \u003cp\u003e\"No one has done more to move forward the rights of food and restaurant workers than Saru Jayaraman.\" --Mark Bittman, author of The Kitchen Matrix and A Bone to Pick\u003c/p\u003e \u003cp\u003eBefore the COVID-19 pandemic devastated the country, more than six million people earned their living as tipped workers in the service industry. They served us in cafes and restaurants, they delivered food to our homes, they drove us wherever we wanted to go, and they worked in nail salons for as little as \$2.13 an hour--the federal tipped minimum wage since 1991--leaving them with next to nothing to get by.\u003c/p\u003e \u003cp\u003eThese workers, unsurprisingly, were among the most vulnerable workers during the pandemic. As businesses across the country closed down or drastically scaled back their services, hundreds of thousands lost their jobs. As in many other areas, the pandemic exposed the inadequacies of the nation's social safety net and minimum-wage standards.\u003c/p\u003e \u003cp\u003eOne of New York magazine's \"Influentials\" of New York City, one of CNN's Visionary Women in 2014, and a White House Champion of Change in 2014, Saru Jayaraman is a nationally acclaimed restaurant activist and the author of the bestselling Behind the Kitchen Door. In her new book, One Fair Wage, Jayaraman shines a light on these workers, illustrating how the people left out of the fight for a fair minimum wage are society's most marginalized: people of color, many of them immigrants; women, who form the majority of tipped workers; disabled workers; incarcerated workers; and youth workers. They epitomize the direction of our whole economy, reflecting the precariousness and instability that is increasingly the lot of American labor.\u003c/p\u003e",
      pageCount: 256,
      averageRating: 4,
      ratingsCount: 28,
      imageLink:
          "http://books.google.com/books/content?id=0X1PxwEACAAJ&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE73achb_AZLcuiw97WXajaSsHFP6mGPA2JEbtoeTrcRBFzWknipozTfP5mit9A3Fgi623G_obI0OQUp4fH7t8GF7MGpvYeykKjCYaDcJ84aUEE6p9arFqDPVPnkXCaw6nZ0MObnu&source=gbs_api",
      view: 112,

      //demo
      authorList: [
        AuthorModel(
          id: "3",
          name: "Teofilo Reyes",
          imageLink:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQazBCc0hPE6m3U_IqcBDU-oL8-U6n8E02IzQ&usqp=CAU",
        ),
        AuthorModel(
          id: "4",
          name: "Saru Jayaraman",
          imageLink:
              "https://scontent.fsgn5-14.fna.fbcdn.net/v/t1.6435-9/158900679_361613908619003_3323147903344266764_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=aFTEo5CYhLkAX-hveTX&_nc_ht=scontent.fsgn5-14.fna&oh=00_AT-V1aEyMpA2OI3RL6bM_phEoQPHNd23vNxR5t6kVc5Dyw&oe=63017A4F",
        ),
      ],
      categoryList: [
        CategoryModel(
          id: "3",
          name: "Business",
          imageLink:
              "https://www.kindpng.com/picc/m/240-2409266_family-business-icon-png-transparent-png.png",
        ),
        CategoryModel(
          id: "4",
          name: "Economy",
          imageLink: "https://cdn-icons-png.flaticon.com/512/4634/4634988.png",
        ),
      ],
    ),
    const BookModel(
      id: "620pAgAAQBAJ",
      title: "The Hard Thing About Hard Things",
      subTitle: "Building a Business When There Are No Easy Answers",
      description:
          "\u003cp\u003eBen Horowitz, cofounder of Andreessen Horowitz and one of Silicon Valley's most respected and experienced entrepreneurs, offers essential advice on building and running a startup—practical wisdom for managing the toughest problems business school doesn't cover, based on his popular ben's blog.\u003c/p\u003e\u003cp\u003eWhile many people talk about how great it is to start a business, very few are honest about how difficult it is to run one. Ben Horowitz analyzes the problems that confront leaders every day, sharing the insights he's gained developing, managing, selling, buying, investing in, and supervising technology companies. A lifelong rap fanatic, he amplifies business lessons with lyrics from his favorite songs, telling it straight about everything from firing friends to poaching competitors, cultivating and sustaining a CEO mentality to knowing the right time to cash in.\u003c/p\u003e\u003cp\u003eFilled with his trademark humor and straight talk, The Hard Thing About Hard Things is invaluable for veteran entrepreneurs as well as those aspiring to their own new ventures, drawing from Horowitz's personal and often humbling experiences.\u003c/p\u003e",
      pageCount: 304,
      averageRating: 3.5,
      ratingsCount: 10,
      imageLink:
          "http://books.google.com/books/publisher/content?id=620pAgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE72mGhbZs47kwir-QwnGkkrgizIvHsm4LcmQTI3kNhDN2mTaVaz0yOLPz4SRgzdH4lVZ1pPlJeUMLiG-Uucj3cIrJtOeFlYxmaY3z1QGHaa5CIt2x8jftLl4uteBtyE0TAp1x-_r&source=gbs_api",
      view: 15201,

      //demo
      authorList: [
        AuthorModel(
          id: "5",
          name: "Ben Horowitz",
          imageLink:
              "https://i.insider.com/54985d2969bedd9d42f51629?width=1136&format=jpeg",
        ),
      ],
      categoryList: [
        CategoryModel(
          id: "3",
          name: "Business",
          imageLink:
              "https://www.kindpng.com/picc/m/240-2409266_family-business-icon-png-transparent-png.png",
        ),
      ],
    ),
    const BookModel(
      id: "NNGXDwAAQBAJ",
      title: "Good Economics for Hard Times",
      subTitle: "Better Answers to Our Biggest Problems",
      description:
          "\u003cp\u003e\u003cb\u003eFROM THE WINNERS OF THE 2019 NOBEL PRIZE IN ECONOMICS\u003cbr\u003e\u003c/b\u003e\u003cbr\u003e\u003cb\u003e'Wonderfully refreshing . . . A must read' Thomas Piketty \u003c/b\u003e \u003cbr\u003e\u003cbr\u003eIn this revolutionary book, prize-winning economists Abhijit V. Banerjee and Esther Duflo show how economics, when done right, can help us solve the thorniest social and political problems of our day. From immigration to inequality, slowing growth to accelerating climate change, we have the resources to address the challenges we face but we are so often blinded by ideology.\u003cbr\u003e\u003cbr\u003eOriginal, provocative and urgent,\u003ci\u003e Good Economics for Hard Times\u003c/i\u003e offers the new thinking that we need. It builds on cutting-edge research in economics - and years of exploring the most effective solutions to alleviate extreme poverty - to make a persuasive case for an intelligent interventionism and a society built on compassion and respect. A much-needed antidote to polarized discourse, this book shines a light to help us appreciate and understand our precariously balanced world.\u003c/p\u003e",
      pageCount: 416,
      averageRating: 4,
      ratingsCount: 6,
      imageLink:
          "http://books.google.com/books/publisher/content?id=NNGXDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE73N5OMTvN2lsDO0XRn3HkAP46c0HqsZgx_IsDvOH3QNeMZRGmHKbipvE3h-QJGh-yavWXNXaRoWz_J1n8egkX2w0D18biGVO0AHEM0YP50zn-Dmlz5kQoxeYeuRGxVhHORxcr7v&source=gbs_api",
      view: 4592,

      //demo
      authorList: [
        AuthorModel(
          id: "6",
          name: "Abhijit V. Banerjee",
          imageLink:
              "https://images.firstpost.com/wp-content/uploads/2022/03/Abhijit-Banerjee-640.jpg?impolicy=website&width=1200&height=800",
        ),
        AuthorModel(
          id: "7",
          name: "Esther Duflo",
          imageLink:
              "https://unctad.org/sites/default/files/2021-06/Esther%20Duflo_2_credit%20Bryce%20Vickmark_1200x675_0.jpg",
        ),
      ],
      categoryList: [
        CategoryModel(
          id: "4",
          name: "Economy",
          imageLink: "https://cdn-icons-png.flaticon.com/512/4634/4634988.png",
        ),
      ],
    ),
  ];

  final Map<String, List<BookModel>> recommendedBooksMap = {
    "tuan_nka": [
      const BookModel(
        id: "Pac4vgAACAAJ",
        title: "Harry Potter and the Half-blood Prince",
        description:
            "'In a brief statement on Friday night, Minister for Magic Cornelius Fudge confirmed that He Who Must Not Be Named has returned to this country and is once more active. \"It is with great regret that I must confirm that the wizard styling himself Lord - well, you know who I mean - is alive and among us again,\" said Fudge.' These dramatic words appeared in the final pages ofHarry Potter and the Order of the Phoenix. In the midst of this battle of good and evil,Harry Potter and the Half-Blood Prince takes up the story of Harry Potter's sixth year at Hogwarts School of Witchcraft and Wizardry, with Voldemort's power and followers increasing day by day ...",
        pageCount: 1008,
        averageRating: 4.5,
        ratingsCount: 85,
        imageLink:
            "http://books.google.com/books/content?id=Pac4vgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
        view: 1029193,

        //demo
        authorList: [
          AuthorModel(
            id: "1",
            name: "J. K. Rowling",
            imageLink:
                "https://instagram.fsgn5-2.fna.fbcdn.net/v/t51.2885-19/139602632_1002634246809605_239709236590657798_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fsgn5-2.fna.fbcdn.net&_nc_cat=105&_nc_ohc=2U-zW6Wgzb8AX_-lAbV&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AT845LuW8AxTul5yZHCRQPtzaOUPZXi7v7ojiIrzMRYenQ&oe=62E0CA64&_nc_sid=8fd12b",
          ),
        ],
        categoryList: [
          CategoryModel(
            id: "1",
            name: "Children's stories",
            imageLink:
                "https://img.freepik.com/premium-vector/little-cute-group-three-children-reading-books-sitting-sofa-flat-vector_627350-473.jpg?w=360",
          ),
          CategoryModel(
            id: "2",
            name: "Juvenile Fiction",
            imageLink:
                "https://scontent.fsgn5-15.fna.fbcdn.net/v/t1.18169-9/548913_593033844041426_625302973_n.png?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=lP9Tg-AGCyUAX-CXenw&_nc_ht=scontent.fsgn5-15.fna&oh=00_AT_5NPs_HS7gQGp80zkAgMPA4gkONK8LTv7wJdDrrJt4yA&oe=63009351",
          ),
        ],
      ),
      const BookModel(
        id: "HEmJngEACAAJ",
        title: "Behind the Gates",
        description:
            "In a Chicago troubled by the war against the Alliance, Louisa and her best friend, Maddie, disguised as her twin sister, are sent to the exclusive Country Manor School, where they are cut off from the outside world and learn survival skills.",
        pageCount: 211,
        averageRating: 4,
        ratingsCount: 2,
        imageLink:
            "http://books.google.com/books/content?id=HEmJngEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
        view: 1241,

        //demo
        authorList: [
          AuthorModel(
            id: "2",
            name: "Eva Gray",
            imageLink:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6RiJfqmVgObeVExih1kwcYB436elPIgmbKw&usqp=CAU",
          ),
        ],
        categoryList: [
          CategoryModel(
            id: "2",
            name: "Juvenile Fiction",
            imageLink:
                "https://scontent.fsgn5-15.fna.fbcdn.net/v/t1.18169-9/548913_593033844041426_625302973_n.png?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=lP9Tg-AGCyUAX-CXenw&_nc_ht=scontent.fsgn5-15.fna&oh=00_AT_5NPs_HS7gQGp80zkAgMPA4gkONK8LTv7wJdDrrJt4yA&oe=63009351",
          ),
        ],
      ),
    ],
    "tu_ha": [
      const BookModel(
        id: "620pAgAAQBAJ",
        title: "The Hard Thing About Hard Things",
        subTitle: "Building a Business When There Are No Easy Answers",
        description:
            "\u003cp\u003eBen Horowitz, cofounder of Andreessen Horowitz and one of Silicon Valley's most respected and experienced entrepreneurs, offers essential advice on building and running a startup—practical wisdom for managing the toughest problems business school doesn't cover, based on his popular ben's blog.\u003c/p\u003e\u003cp\u003eWhile many people talk about how great it is to start a business, very few are honest about how difficult it is to run one. Ben Horowitz analyzes the problems that confront leaders every day, sharing the insights he's gained developing, managing, selling, buying, investing in, and supervising technology companies. A lifelong rap fanatic, he amplifies business lessons with lyrics from his favorite songs, telling it straight about everything from firing friends to poaching competitors, cultivating and sustaining a CEO mentality to knowing the right time to cash in.\u003c/p\u003e\u003cp\u003eFilled with his trademark humor and straight talk, The Hard Thing About Hard Things is invaluable for veteran entrepreneurs as well as those aspiring to their own new ventures, drawing from Horowitz's personal and often humbling experiences.\u003c/p\u003e",
        pageCount: 304,
        averageRating: 3.5,
        ratingsCount: 10,
        imageLink:
            "http://books.google.com/books/publisher/content?id=620pAgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE72mGhbZs47kwir-QwnGkkrgizIvHsm4LcmQTI3kNhDN2mTaVaz0yOLPz4SRgzdH4lVZ1pPlJeUMLiG-Uucj3cIrJtOeFlYxmaY3z1QGHaa5CIt2x8jftLl4uteBtyE0TAp1x-_r&source=gbs_api",
        view: 15201,

        //demo
        authorList: [
          AuthorModel(
            id: "5",
            name: "Ben Horowitz",
            imageLink:
                "https://i.insider.com/54985d2969bedd9d42f51629?width=1136&format=jpeg",
          ),
        ],
        categoryList: [
          CategoryModel(
            id: "3",
            name: "Business",
            imageLink:
                "https://www.kindpng.com/picc/m/240-2409266_family-business-icon-png-transparent-png.png",
          ),
        ],
      ),
      const BookModel(
        id: "NNGXDwAAQBAJ",
        title: "Good Economics for Hard Times",
        subTitle: "Better Answers to Our Biggest Problems",
        description:
            "\u003cp\u003e\u003cb\u003eFROM THE WINNERS OF THE 2019 NOBEL PRIZE IN ECONOMICS\u003cbr\u003e\u003c/b\u003e\u003cbr\u003e\u003cb\u003e'Wonderfully refreshing . . . A must read' Thomas Piketty \u003c/b\u003e \u003cbr\u003e\u003cbr\u003eIn this revolutionary book, prize-winning economists Abhijit V. Banerjee and Esther Duflo show how economics, when done right, can help us solve the thorniest social and political problems of our day. From immigration to inequality, slowing growth to accelerating climate change, we have the resources to address the challenges we face but we are so often blinded by ideology.\u003cbr\u003e\u003cbr\u003eOriginal, provocative and urgent,\u003ci\u003e Good Economics for Hard Times\u003c/i\u003e offers the new thinking that we need. It builds on cutting-edge research in economics - and years of exploring the most effective solutions to alleviate extreme poverty - to make a persuasive case for an intelligent interventionism and a society built on compassion and respect. A much-needed antidote to polarized discourse, this book shines a light to help us appreciate and understand our precariously balanced world.\u003c/p\u003e",
        pageCount: 416,
        averageRating: 4,
        ratingsCount: 6,
        imageLink:
            "http://books.google.com/books/publisher/content?id=NNGXDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE73N5OMTvN2lsDO0XRn3HkAP46c0HqsZgx_IsDvOH3QNeMZRGmHKbipvE3h-QJGh-yavWXNXaRoWz_J1n8egkX2w0D18biGVO0AHEM0YP50zn-Dmlz5kQoxeYeuRGxVhHORxcr7v&source=gbs_api",
        view: 4592,

        //demo
        authorList: [
          AuthorModel(
            id: "6",
            name: "Abhijit V. Banerjee",
            imageLink:
                "https://images.firstpost.com/wp-content/uploads/2022/03/Abhijit-Banerjee-640.jpg?impolicy=website&width=1200&height=800",
          ),
          AuthorModel(
            id: "7",
            name: "Esther Duflo",
            imageLink:
                "https://unctad.org/sites/default/files/2021-06/Esther%20Duflo_2_credit%20Bryce%20Vickmark_1200x675_0.jpg",
          ),
        ],
        categoryList: [
          CategoryModel(
            id: "4",
            name: "Economy",
            imageLink:
                "https://cdn-icons-png.flaticon.com/512/4634/4634988.png",
          ),
        ],
      ),
    ],
    "minwoo_k": [
      const BookModel(
        id: "620pAgAAQBAJ",
        title: "The Hard Thing About Hard Things",
        subTitle: "Building a Business When There Are No Easy Answers",
        description:
            "\u003cp\u003eBen Horowitz, cofounder of Andreessen Horowitz and one of Silicon Valley's most respected and experienced entrepreneurs, offers essential advice on building and running a startup—practical wisdom for managing the toughest problems business school doesn't cover, based on his popular ben's blog.\u003c/p\u003e\u003cp\u003eWhile many people talk about how great it is to start a business, very few are honest about how difficult it is to run one. Ben Horowitz analyzes the problems that confront leaders every day, sharing the insights he's gained developing, managing, selling, buying, investing in, and supervising technology companies. A lifelong rap fanatic, he amplifies business lessons with lyrics from his favorite songs, telling it straight about everything from firing friends to poaching competitors, cultivating and sustaining a CEO mentality to knowing the right time to cash in.\u003c/p\u003e\u003cp\u003eFilled with his trademark humor and straight talk, The Hard Thing About Hard Things is invaluable for veteran entrepreneurs as well as those aspiring to their own new ventures, drawing from Horowitz's personal and often humbling experiences.\u003c/p\u003e",
        pageCount: 304,
        averageRating: 3.5,
        ratingsCount: 10,
        imageLink:
            "http://books.google.com/books/publisher/content?id=620pAgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE72mGhbZs47kwir-QwnGkkrgizIvHsm4LcmQTI3kNhDN2mTaVaz0yOLPz4SRgzdH4lVZ1pPlJeUMLiG-Uucj3cIrJtOeFlYxmaY3z1QGHaa5CIt2x8jftLl4uteBtyE0TAp1x-_r&source=gbs_api",
        view: 15201,

        //demo
        authorList: [
          AuthorModel(
            id: "5",
            name: "Ben Horowitz",
            imageLink:
                "https://i.insider.com/54985d2969bedd9d42f51629?width=1136&format=jpeg",
          ),
        ],
        categoryList: [
          CategoryModel(
            id: "3",
            name: "Business",
            imageLink:
                "https://www.kindpng.com/picc/m/240-2409266_family-business-icon-png-transparent-png.png",
          ),
        ],
      ),
      const BookModel(
        id: "0X1PxwEACAAJ",
        title: "One Fair Wage",
        description:
            "\u003cp\u003eFrom the author of the acclaimed Behind the Kitchen Door, a powerful examination of how the subminimum wage and the tipping system exploit society's most vulnerable \u003c/p\u003e \u003cp\u003e\"No one has done more to move forward the rights of food and restaurant workers than Saru Jayaraman.\" --Mark Bittman, author of The Kitchen Matrix and A Bone to Pick\u003c/p\u003e \u003cp\u003eBefore the COVID-19 pandemic devastated the country, more than six million people earned their living as tipped workers in the service industry. They served us in cafes and restaurants, they delivered food to our homes, they drove us wherever we wanted to go, and they worked in nail salons for as little as \$2.13 an hour--the federal tipped minimum wage since 1991--leaving them with next to nothing to get by.\u003c/p\u003e \u003cp\u003eThese workers, unsurprisingly, were among the most vulnerable workers during the pandemic. As businesses across the country closed down or drastically scaled back their services, hundreds of thousands lost their jobs. As in many other areas, the pandemic exposed the inadequacies of the nation's social safety net and minimum-wage standards.\u003c/p\u003e \u003cp\u003eOne of New York magazine's \"Influentials\" of New York City, one of CNN's Visionary Women in 2014, and a White House Champion of Change in 2014, Saru Jayaraman is a nationally acclaimed restaurant activist and the author of the bestselling Behind the Kitchen Door. In her new book, One Fair Wage, Jayaraman shines a light on these workers, illustrating how the people left out of the fight for a fair minimum wage are society's most marginalized: people of color, many of them immigrants; women, who form the majority of tipped workers; disabled workers; incarcerated workers; and youth workers. They epitomize the direction of our whole economy, reflecting the precariousness and instability that is increasingly the lot of American labor.\u003c/p\u003e",
        pageCount: 256,
        averageRating: 4,
        ratingsCount: 28,
        imageLink:
            "http://books.google.com/books/content?id=0X1PxwEACAAJ&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE73achb_AZLcuiw97WXajaSsHFP6mGPA2JEbtoeTrcRBFzWknipozTfP5mit9A3Fgi623G_obI0OQUp4fH7t8GF7MGpvYeykKjCYaDcJ84aUEE6p9arFqDPVPnkXCaw6nZ0MObnu&source=gbs_api",
        view: 112,

        //demo
        authorList: [
          AuthorModel(
            id: "3",
            name: "Teofilo Reyes",
            imageLink:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQazBCc0hPE6m3U_IqcBDU-oL8-U6n8E02IzQ&usqp=CAU",
          ),
          AuthorModel(
            id: "4",
            name: "Saru Jayaraman",
            imageLink:
                "https://scontent.fsgn5-14.fna.fbcdn.net/v/t1.6435-9/158900679_361613908619003_3323147903344266764_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=aFTEo5CYhLkAX-hveTX&_nc_ht=scontent.fsgn5-14.fna&oh=00_AT-V1aEyMpA2OI3RL6bM_phEoQPHNd23vNxR5t6kVc5Dyw&oe=63017A4F",
          ),
        ],
        categoryList: [
          CategoryModel(
            id: "3",
            name: "Business",
            imageLink:
                "https://www.kindpng.com/picc/m/240-2409266_family-business-icon-png-transparent-png.png",
          ),
          CategoryModel(
            id: "4",
            name: "Economy",
            imageLink:
                "https://cdn-icons-png.flaticon.com/512/4634/4634988.png",
          ),
        ],
      ),
    ]
  };

  final Map<String, BookModel> lastBookMap = {
    "tuan_nka": const BookModel(
      id: "0Yo7PgAACAAJ",
      title: "Harry Potter and the Philosopher's Stone",
      description:
          "Harry Potter thinks he is an ordinary boy - until he is rescued by a beetle eyed giant of a man, enrols at Hogwarts School of Witchcraft and Wizardry, learns to play Quidditch and does battle in a deadly duel. All because Harry Potter is a wizard! Follow the adventures of Harry Potter as he discovers the magical, the dangerous, the unpredictable world of Hogwarts School of Witchcraft and Wizardry.",
      pageCount: 332,
      averageRating: 4,
      ratingsCount: 10,
      imageLink:
          "http://books.google.com/books/content?id=0Yo7PgAACAAJ&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE73RXP6Obic8fu3_t4uV49W9RvQMhkhVxrsvcZ6YB8mGuRaixu3nCG-Nem2PSTlLBRxH5rXUnsTlm824KV32DZjGE6kmYacVNrKJFmaT2_f6CDIvaB8gJybnJOeyT9yFfLTJJ1yd&source=gbs_api",
      view: 12141,

      //demo
      authorList: [
        AuthorModel(
          id: "1",
          name: "J. K. Rowling",
          imageLink:
              "https://instagram.fsgn5-2.fna.fbcdn.net/v/t51.2885-19/139602632_1002634246809605_239709236590657798_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fsgn5-2.fna.fbcdn.net&_nc_cat=105&_nc_ohc=2U-zW6Wgzb8AX_-lAbV&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AT845LuW8AxTul5yZHCRQPtzaOUPZXi7v7ojiIrzMRYenQ&oe=62E0CA64&_nc_sid=8fd12b",
        ),
      ],
      categoryList: [
        CategoryModel(
          id: "1",
          name: "Children's stories",
          imageLink:
              "https://img.freepik.com/premium-vector/little-cute-group-three-children-reading-books-sitting-sofa-flat-vector_627350-473.jpg?w=360",
        ),
        CategoryModel(
          id: "2",
          name: "Juvenile Fiction",
          imageLink:
              "https://scontent.fsgn5-15.fna.fbcdn.net/v/t1.18169-9/548913_593033844041426_625302973_n.png?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=lP9Tg-AGCyUAX-CXenw&_nc_ht=scontent.fsgn5-15.fna&oh=00_AT_5NPs_HS7gQGp80zkAgMPA4gkONK8LTv7wJdDrrJt4yA&oe=63009351",
        ),
      ],

      lastPage: 10,
      lastDay: "20/07/2022",
    ),
    "tu_ha": const BookModel(
      id: "0X1PxwEACAAJ",
      title: "One Fair Wage",
      description:
          "\u003cp\u003eFrom the author of the acclaimed Behind the Kitchen Door, a powerful examination of how the subminimum wage and the tipping system exploit society's most vulnerable \u003c/p\u003e \u003cp\u003e\"No one has done more to move forward the rights of food and restaurant workers than Saru Jayaraman.\" --Mark Bittman, author of The Kitchen Matrix and A Bone to Pick\u003c/p\u003e \u003cp\u003eBefore the COVID-19 pandemic devastated the country, more than six million people earned their living as tipped workers in the service industry. They served us in cafes and restaurants, they delivered food to our homes, they drove us wherever we wanted to go, and they worked in nail salons for as little as \$2.13 an hour--the federal tipped minimum wage since 1991--leaving them with next to nothing to get by.\u003c/p\u003e \u003cp\u003eThese workers, unsurprisingly, were among the most vulnerable workers during the pandemic. As businesses across the country closed down or drastically scaled back their services, hundreds of thousands lost their jobs. As in many other areas, the pandemic exposed the inadequacies of the nation's social safety net and minimum-wage standards.\u003c/p\u003e \u003cp\u003eOne of New York magazine's \"Influentials\" of New York City, one of CNN's Visionary Women in 2014, and a White House Champion of Change in 2014, Saru Jayaraman is a nationally acclaimed restaurant activist and the author of the bestselling Behind the Kitchen Door. In her new book, One Fair Wage, Jayaraman shines a light on these workers, illustrating how the people left out of the fight for a fair minimum wage are society's most marginalized: people of color, many of them immigrants; women, who form the majority of tipped workers; disabled workers; incarcerated workers; and youth workers. They epitomize the direction of our whole economy, reflecting the precariousness and instability that is increasingly the lot of American labor.\u003c/p\u003e",
      pageCount: 256,
      averageRating: 4,
      ratingsCount: 28,
      imageLink:
          "http://books.google.com/books/content?id=0X1PxwEACAAJ&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE73achb_AZLcuiw97WXajaSsHFP6mGPA2JEbtoeTrcRBFzWknipozTfP5mit9A3Fgi623G_obI0OQUp4fH7t8GF7MGpvYeykKjCYaDcJ84aUEE6p9arFqDPVPnkXCaw6nZ0MObnu&source=gbs_api",
      view: 112,

      //demo
      authorList: [
        AuthorModel(
          id: "3",
          name: "Teofilo Reyes",
          imageLink:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQazBCc0hPE6m3U_IqcBDU-oL8-U6n8E02IzQ&usqp=CAU",
        ),
        AuthorModel(
          id: "4",
          name: "Saru Jayaraman",
          imageLink:
              "https://scontent.fsgn5-14.fna.fbcdn.net/v/t1.6435-9/158900679_361613908619003_3323147903344266764_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=aFTEo5CYhLkAX-hveTX&_nc_ht=scontent.fsgn5-14.fna&oh=00_AT-V1aEyMpA2OI3RL6bM_phEoQPHNd23vNxR5t6kVc5Dyw&oe=63017A4F",
        ),
      ],
      categoryList: [
        CategoryModel(
          id: "3",
          name: "Business",
          imageLink:
              "https://www.kindpng.com/picc/m/240-2409266_family-business-icon-png-transparent-png.png",
        ),
        CategoryModel(
          id: "4",
          name: "Economy",
          imageLink: "https://cdn-icons-png.flaticon.com/512/4634/4634988.png",
        ),
      ],

      lastPage: 19,
      lastDay: "11/07/2022",
    ),
    "minwoo_k": const BookModel(
      id: "NNGXDwAAQBAJ",
      title: "Good Economics for Hard Times",
      subTitle: "Better Answers to Our Biggest Problems",
      description:
          "\u003cp\u003e\u003cb\u003eFROM THE WINNERS OF THE 2019 NOBEL PRIZE IN ECONOMICS\u003cbr\u003e\u003c/b\u003e\u003cbr\u003e\u003cb\u003e'Wonderfully refreshing . . . A must read' Thomas Piketty \u003c/b\u003e \u003cbr\u003e\u003cbr\u003eIn this revolutionary book, prize-winning economists Abhijit V. Banerjee and Esther Duflo show how economics, when done right, can help us solve the thorniest social and political problems of our day. From immigration to inequality, slowing growth to accelerating climate change, we have the resources to address the challenges we face but we are so often blinded by ideology.\u003cbr\u003e\u003cbr\u003eOriginal, provocative and urgent,\u003ci\u003e Good Economics for Hard Times\u003c/i\u003e offers the new thinking that we need. It builds on cutting-edge research in economics - and years of exploring the most effective solutions to alleviate extreme poverty - to make a persuasive case for an intelligent interventionism and a society built on compassion and respect. A much-needed antidote to polarized discourse, this book shines a light to help us appreciate and understand our precariously balanced world.\u003c/p\u003e",
      pageCount: 416,
      averageRating: 4,
      ratingsCount: 6,
      imageLink:
          "http://books.google.com/books/publisher/content?id=NNGXDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE73N5OMTvN2lsDO0XRn3HkAP46c0HqsZgx_IsDvOH3QNeMZRGmHKbipvE3h-QJGh-yavWXNXaRoWz_J1n8egkX2w0D18biGVO0AHEM0YP50zn-Dmlz5kQoxeYeuRGxVhHORxcr7v&source=gbs_api",
      view: 4592,

      //demo
      authorList: [
        AuthorModel(
          id: "6",
          name: "Abhijit V. Banerjee",
          imageLink:
              "https://images.firstpost.com/wp-content/uploads/2022/03/Abhijit-Banerjee-640.jpg?impolicy=website&width=1200&height=800",
        ),
        AuthorModel(
          id: "7",
          name: "Esther Duflo",
          imageLink:
              "https://unctad.org/sites/default/files/2021-06/Esther%20Duflo_2_credit%20Bryce%20Vickmark_1200x675_0.jpg",
        ),
      ],
      categoryList: [
        CategoryModel(
          id: "4",
          name: "Economy",
          imageLink: "https://cdn-icons-png.flaticon.com/512/4634/4634988.png",
        ),
      ],

      lastPage: 87,
      lastDay: "04/06/2022",
    ),
  };

  final Map<String, List<String>> history = {
    "tuan_nka": [
      "Harry Potter",
      "J. K. Rowling",
      "Stronger",
    ],
    "tu_ha": [
      "Being In Love",
      "Dreaming",
      "Make you look",
    ],
    "minwoo_k": [
      "Critical Thinking",
      "Deep Work",
      "Mr Right",
    ],
  };

  final Map<String, List<BookModel>> readBookMap = {
    "tuan_nka": [
      const BookModel(
        id: "0Yo7PgAACAAJ",
        title: "Harry Potter and the Philosopher's Stone",
        description:
            "Harry Potter thinks he is an ordinary boy - until he is rescued by a beetle eyed giant of a man, enrols at Hogwarts School of Witchcraft and Wizardry, learns to play Quidditch and does battle in a deadly duel. All because Harry Potter is a wizard! Follow the adventures of Harry Potter as he discovers the magical, the dangerous, the unpredictable world of Hogwarts School of Witchcraft and Wizardry.",
        pageCount: 332,
        averageRating: 4,
        ratingsCount: 10,
        imageLink:
            "http://books.google.com/books/content?id=0Yo7PgAACAAJ&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE73RXP6Obic8fu3_t4uV49W9RvQMhkhVxrsvcZ6YB8mGuRaixu3nCG-Nem2PSTlLBRxH5rXUnsTlm824KV32DZjGE6kmYacVNrKJFmaT2_f6CDIvaB8gJybnJOeyT9yFfLTJJ1yd&source=gbs_api",
        view: 12141,

        //demo
        authorList: [
          AuthorModel(
            id: "1",
            name: "J. K. Rowling",
            imageLink:
                "https://instagram.fsgn5-2.fna.fbcdn.net/v/t51.2885-19/139602632_1002634246809605_239709236590657798_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fsgn5-2.fna.fbcdn.net&_nc_cat=105&_nc_ohc=2U-zW6Wgzb8AX_-lAbV&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AT845LuW8AxTul5yZHCRQPtzaOUPZXi7v7ojiIrzMRYenQ&oe=62E0CA64&_nc_sid=8fd12b",
          ),
        ],
        categoryList: [
          CategoryModel(
            id: "1",
            name: "Children's stories",
            imageLink:
                "https://img.freepik.com/premium-vector/little-cute-group-three-children-reading-books-sitting-sofa-flat-vector_627350-473.jpg?w=360",
          ),
          CategoryModel(
            id: "2",
            name: "Juvenile Fiction",
            imageLink:
                "https://scontent.fsgn5-15.fna.fbcdn.net/v/t1.18169-9/548913_593033844041426_625302973_n.png?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=lP9Tg-AGCyUAX-CXenw&_nc_ht=scontent.fsgn5-15.fna&oh=00_AT_5NPs_HS7gQGp80zkAgMPA4gkONK8LTv7wJdDrrJt4yA&oe=63009351",
          ),
        ],

        lastPage: 10,
        lastDay: "20/07/2022",
      ),
      const BookModel(
        id: "0X1PxwEACAAJ",
        title: "One Fair Wage",
        description:
            "\u003cp\u003eFrom the author of the acclaimed Behind the Kitchen Door, a powerful examination of how the subminimum wage and the tipping system exploit society's most vulnerable \u003c/p\u003e \u003cp\u003e\"No one has done more to move forward the rights of food and restaurant workers than Saru Jayaraman.\" --Mark Bittman, author of The Kitchen Matrix and A Bone to Pick\u003c/p\u003e \u003cp\u003eBefore the COVID-19 pandemic devastated the country, more than six million people earned their living as tipped workers in the service industry. They served us in cafes and restaurants, they delivered food to our homes, they drove us wherever we wanted to go, and they worked in nail salons for as little as \$2.13 an hour--the federal tipped minimum wage since 1991--leaving them with next to nothing to get by.\u003c/p\u003e \u003cp\u003eThese workers, unsurprisingly, were among the most vulnerable workers during the pandemic. As businesses across the country closed down or drastically scaled back their services, hundreds of thousands lost their jobs. As in many other areas, the pandemic exposed the inadequacies of the nation's social safety net and minimum-wage standards.\u003c/p\u003e \u003cp\u003eOne of New York magazine's \"Influentials\" of New York City, one of CNN's Visionary Women in 2014, and a White House Champion of Change in 2014, Saru Jayaraman is a nationally acclaimed restaurant activist and the author of the bestselling Behind the Kitchen Door. In her new book, One Fair Wage, Jayaraman shines a light on these workers, illustrating how the people left out of the fight for a fair minimum wage are society's most marginalized: people of color, many of them immigrants; women, who form the majority of tipped workers; disabled workers; incarcerated workers; and youth workers. They epitomize the direction of our whole economy, reflecting the precariousness and instability that is increasingly the lot of American labor.\u003c/p\u003e",
        pageCount: 256,
        averageRating: 4,
        ratingsCount: 28,
        imageLink:
            "http://books.google.com/books/content?id=0X1PxwEACAAJ&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE73achb_AZLcuiw97WXajaSsHFP6mGPA2JEbtoeTrcRBFzWknipozTfP5mit9A3Fgi623G_obI0OQUp4fH7t8GF7MGpvYeykKjCYaDcJ84aUEE6p9arFqDPVPnkXCaw6nZ0MObnu&source=gbs_api",
        view: 112,

        //demo
        authorList: [
          AuthorModel(
            id: "3",
            name: "Teofilo Reyes",
            imageLink:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQazBCc0hPE6m3U_IqcBDU-oL8-U6n8E02IzQ&usqp=CAU",
          ),
          AuthorModel(
            id: "4",
            name: "Saru Jayaraman",
            imageLink:
                "https://scontent.fsgn5-14.fna.fbcdn.net/v/t1.6435-9/158900679_361613908619003_3323147903344266764_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=aFTEo5CYhLkAX-hveTX&_nc_ht=scontent.fsgn5-14.fna&oh=00_AT-V1aEyMpA2OI3RL6bM_phEoQPHNd23vNxR5t6kVc5Dyw&oe=63017A4F",
          ),
        ],
        categoryList: [
          CategoryModel(
            id: "3",
            name: "Business",
            imageLink:
                "https://www.kindpng.com/picc/m/240-2409266_family-business-icon-png-transparent-png.png",
          ),
          CategoryModel(
            id: "4",
            name: "Economy",
            imageLink:
                "https://cdn-icons-png.flaticon.com/512/4634/4634988.png",
          ),
        ],

        lastPage: 56,
        lastDay: "07/05/2022",
      ),
    ],
    "tu_ha": [
      const BookModel(
        id: "0X1PxwEACAAJ",
        title: "One Fair Wage",
        description:
            "\u003cp\u003eFrom the author of the acclaimed Behind the Kitchen Door, a powerful examination of how the subminimum wage and the tipping system exploit society's most vulnerable \u003c/p\u003e \u003cp\u003e\"No one has done more to move forward the rights of food and restaurant workers than Saru Jayaraman.\" --Mark Bittman, author of The Kitchen Matrix and A Bone to Pick\u003c/p\u003e \u003cp\u003eBefore the COVID-19 pandemic devastated the country, more than six million people earned their living as tipped workers in the service industry. They served us in cafes and restaurants, they delivered food to our homes, they drove us wherever we wanted to go, and they worked in nail salons for as little as \$2.13 an hour--the federal tipped minimum wage since 1991--leaving them with next to nothing to get by.\u003c/p\u003e \u003cp\u003eThese workers, unsurprisingly, were among the most vulnerable workers during the pandemic. As businesses across the country closed down or drastically scaled back their services, hundreds of thousands lost their jobs. As in many other areas, the pandemic exposed the inadequacies of the nation's social safety net and minimum-wage standards.\u003c/p\u003e \u003cp\u003eOne of New York magazine's \"Influentials\" of New York City, one of CNN's Visionary Women in 2014, and a White House Champion of Change in 2014, Saru Jayaraman is a nationally acclaimed restaurant activist and the author of the bestselling Behind the Kitchen Door. In her new book, One Fair Wage, Jayaraman shines a light on these workers, illustrating how the people left out of the fight for a fair minimum wage are society's most marginalized: people of color, many of them immigrants; women, who form the majority of tipped workers; disabled workers; incarcerated workers; and youth workers. They epitomize the direction of our whole economy, reflecting the precariousness and instability that is increasingly the lot of American labor.\u003c/p\u003e",
        pageCount: 256,
        averageRating: 4,
        ratingsCount: 28,
        imageLink:
            "http://books.google.com/books/content?id=0X1PxwEACAAJ&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE73achb_AZLcuiw97WXajaSsHFP6mGPA2JEbtoeTrcRBFzWknipozTfP5mit9A3Fgi623G_obI0OQUp4fH7t8GF7MGpvYeykKjCYaDcJ84aUEE6p9arFqDPVPnkXCaw6nZ0MObnu&source=gbs_api",
        view: 112,

        //demo
        authorList: [
          AuthorModel(
            id: "3",
            name: "Teofilo Reyes",
            imageLink:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQazBCc0hPE6m3U_IqcBDU-oL8-U6n8E02IzQ&usqp=CAU",
          ),
          AuthorModel(
            id: "4",
            name: "Saru Jayaraman",
            imageLink:
                "https://scontent.fsgn5-14.fna.fbcdn.net/v/t1.6435-9/158900679_361613908619003_3323147903344266764_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=aFTEo5CYhLkAX-hveTX&_nc_ht=scontent.fsgn5-14.fna&oh=00_AT-V1aEyMpA2OI3RL6bM_phEoQPHNd23vNxR5t6kVc5Dyw&oe=63017A4F",
          ),
        ],
        categoryList: [
          CategoryModel(
            id: "3",
            name: "Business",
            imageLink:
                "https://www.kindpng.com/picc/m/240-2409266_family-business-icon-png-transparent-png.png",
          ),
          CategoryModel(
            id: "4",
            name: "Economy",
            imageLink:
                "https://cdn-icons-png.flaticon.com/512/4634/4634988.png",
          ),
        ],

        lastPage: 19,
        lastDay: "11/07/2022",
      ),
      const BookModel(
        id: "0Yo7PgAACAAJ",
        title: "Harry Potter and the Philosopher's Stone",
        description:
            "Harry Potter thinks he is an ordinary boy - until he is rescued by a beetle eyed giant of a man, enrols at Hogwarts School of Witchcraft and Wizardry, learns to play Quidditch and does battle in a deadly duel. All because Harry Potter is a wizard! Follow the adventures of Harry Potter as he discovers the magical, the dangerous, the unpredictable world of Hogwarts School of Witchcraft and Wizardry.",
        pageCount: 332,
        averageRating: 4,
        ratingsCount: 10,
        imageLink:
            "http://books.google.com/books/content?id=0Yo7PgAACAAJ&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE73RXP6Obic8fu3_t4uV49W9RvQMhkhVxrsvcZ6YB8mGuRaixu3nCG-Nem2PSTlLBRxH5rXUnsTlm824KV32DZjGE6kmYacVNrKJFmaT2_f6CDIvaB8gJybnJOeyT9yFfLTJJ1yd&source=gbs_api",
        view: 12141,

        //demo
        authorList: [
          AuthorModel(
            id: "1",
            name: "J. K. Rowling",
            imageLink:
                "https://instagram.fsgn5-2.fna.fbcdn.net/v/t51.2885-19/139602632_1002634246809605_239709236590657798_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fsgn5-2.fna.fbcdn.net&_nc_cat=105&_nc_ohc=2U-zW6Wgzb8AX_-lAbV&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AT845LuW8AxTul5yZHCRQPtzaOUPZXi7v7ojiIrzMRYenQ&oe=62E0CA64&_nc_sid=8fd12b",
          ),
        ],
        categoryList: [
          CategoryModel(
            id: "1",
            name: "Children's stories",
            imageLink:
                "https://img.freepik.com/premium-vector/little-cute-group-three-children-reading-books-sitting-sofa-flat-vector_627350-473.jpg?w=360",
          ),
          CategoryModel(
            id: "2",
            name: "Juvenile Fiction",
            imageLink:
                "https://scontent.fsgn5-15.fna.fbcdn.net/v/t1.18169-9/548913_593033844041426_625302973_n.png?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=lP9Tg-AGCyUAX-CXenw&_nc_ht=scontent.fsgn5-15.fna&oh=00_AT_5NPs_HS7gQGp80zkAgMPA4gkONK8LTv7wJdDrrJt4yA&oe=63009351",
          ),
        ],

        lastPage: 23,
        lastDay: "20/01/2022",
      ),
    ],
    "minwoo_k": [
      const BookModel(
        id: "NNGXDwAAQBAJ",
        title: "Good Economics for Hard Times",
        subTitle: "Better Answers to Our Biggest Problems",
        description:
            "\u003cp\u003e\u003cb\u003eFROM THE WINNERS OF THE 2019 NOBEL PRIZE IN ECONOMICS\u003cbr\u003e\u003c/b\u003e\u003cbr\u003e\u003cb\u003e'Wonderfully refreshing . . . A must read' Thomas Piketty \u003c/b\u003e \u003cbr\u003e\u003cbr\u003eIn this revolutionary book, prize-winning economists Abhijit V. Banerjee and Esther Duflo show how economics, when done right, can help us solve the thorniest social and political problems of our day. From immigration to inequality, slowing growth to accelerating climate change, we have the resources to address the challenges we face but we are so often blinded by ideology.\u003cbr\u003e\u003cbr\u003eOriginal, provocative and urgent,\u003ci\u003e Good Economics for Hard Times\u003c/i\u003e offers the new thinking that we need. It builds on cutting-edge research in economics - and years of exploring the most effective solutions to alleviate extreme poverty - to make a persuasive case for an intelligent interventionism and a society built on compassion and respect. A much-needed antidote to polarized discourse, this book shines a light to help us appreciate and understand our precariously balanced world.\u003c/p\u003e",
        pageCount: 416,
        averageRating: 4,
        ratingsCount: 6,
        imageLink:
            "http://books.google.com/books/publisher/content?id=NNGXDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE73N5OMTvN2lsDO0XRn3HkAP46c0HqsZgx_IsDvOH3QNeMZRGmHKbipvE3h-QJGh-yavWXNXaRoWz_J1n8egkX2w0D18biGVO0AHEM0YP50zn-Dmlz5kQoxeYeuRGxVhHORxcr7v&source=gbs_api",
        view: 4592,

        //demo
        authorList: [
          AuthorModel(
            id: "6",
            name: "Abhijit V. Banerjee",
            imageLink:
                "https://images.firstpost.com/wp-content/uploads/2022/03/Abhijit-Banerjee-640.jpg?impolicy=website&width=1200&height=800",
          ),
          AuthorModel(
            id: "7",
            name: "Esther Duflo",
            imageLink:
                "https://unctad.org/sites/default/files/2021-06/Esther%20Duflo_2_credit%20Bryce%20Vickmark_1200x675_0.jpg",
          ),
        ],
        categoryList: [
          CategoryModel(
            id: "4",
            name: "Economy",
            imageLink:
                "https://cdn-icons-png.flaticon.com/512/4634/4634988.png",
          ),
        ],

        lastPage: 87,
        lastDay: "04/06/2022",
      ),
      const BookModel(
        id: "0Yo7PgAACAAJ",
        title: "Harry Potter and the Philosopher's Stone",
        description:
            "Harry Potter thinks he is an ordinary boy - until he is rescued by a beetle eyed giant of a man, enrols at Hogwarts School of Witchcraft and Wizardry, learns to play Quidditch and does battle in a deadly duel. All because Harry Potter is a wizard! Follow the adventures of Harry Potter as he discovers the magical, the dangerous, the unpredictable world of Hogwarts School of Witchcraft and Wizardry.",
        pageCount: 332,
        averageRating: 4,
        ratingsCount: 10,
        imageLink:
            "http://books.google.com/books/content?id=0Yo7PgAACAAJ&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE73RXP6Obic8fu3_t4uV49W9RvQMhkhVxrsvcZ6YB8mGuRaixu3nCG-Nem2PSTlLBRxH5rXUnsTlm824KV32DZjGE6kmYacVNrKJFmaT2_f6CDIvaB8gJybnJOeyT9yFfLTJJ1yd&source=gbs_api",
        view: 12141,

        //demo
        authorList: [
          AuthorModel(
            id: "1",
            name: "J. K. Rowling",
            imageLink:
                "https://instagram.fsgn5-2.fna.fbcdn.net/v/t51.2885-19/139602632_1002634246809605_239709236590657798_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fsgn5-2.fna.fbcdn.net&_nc_cat=105&_nc_ohc=2U-zW6Wgzb8AX_-lAbV&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AT845LuW8AxTul5yZHCRQPtzaOUPZXi7v7ojiIrzMRYenQ&oe=62E0CA64&_nc_sid=8fd12b",
          ),
        ],
        categoryList: [
          CategoryModel(
            id: "1",
            name: "Children's stories",
            imageLink:
                "https://img.freepik.com/premium-vector/little-cute-group-three-children-reading-books-sitting-sofa-flat-vector_627350-473.jpg?w=360",
          ),
          CategoryModel(
            id: "2",
            name: "Juvenile Fiction",
            imageLink:
                "https://scontent.fsgn5-15.fna.fbcdn.net/v/t1.18169-9/548913_593033844041426_625302973_n.png?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=lP9Tg-AGCyUAX-CXenw&_nc_ht=scontent.fsgn5-15.fna&oh=00_AT_5NPs_HS7gQGp80zkAgMPA4gkONK8LTv7wJdDrrJt4yA&oe=63009351",
          ),
        ],

        lastPage: 66,
        lastDay: "07/01/2022",
      ),
    ],
  };

  final Map<String, List<BookModel>> favoriteBookMap = {
    "tuan_nka": [
      const BookModel(
        id: "0Yo7PgAACAAJ",
        title: "Harry Potter and the Philosopher's Stone",
        description:
            "Harry Potter thinks he is an ordinary boy - until he is rescued by a beetle eyed giant of a man, enrols at Hogwarts School of Witchcraft and Wizardry, learns to play Quidditch and does battle in a deadly duel. All because Harry Potter is a wizard! Follow the adventures of Harry Potter as he discovers the magical, the dangerous, the unpredictable world of Hogwarts School of Witchcraft and Wizardry.",
        pageCount: 332,
        averageRating: 4,
        ratingsCount: 10,
        imageLink:
            "http://books.google.com/books/content?id=0Yo7PgAACAAJ&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE73RXP6Obic8fu3_t4uV49W9RvQMhkhVxrsvcZ6YB8mGuRaixu3nCG-Nem2PSTlLBRxH5rXUnsTlm824KV32DZjGE6kmYacVNrKJFmaT2_f6CDIvaB8gJybnJOeyT9yFfLTJJ1yd&source=gbs_api",
        view: 12141,

        //demo
        authorList: [
          AuthorModel(
            id: "1",
            name: "J. K. Rowling",
            imageLink:
                "https://instagram.fsgn5-2.fna.fbcdn.net/v/t51.2885-19/139602632_1002634246809605_239709236590657798_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fsgn5-2.fna.fbcdn.net&_nc_cat=105&_nc_ohc=2U-zW6Wgzb8AX_-lAbV&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AT845LuW8AxTul5yZHCRQPtzaOUPZXi7v7ojiIrzMRYenQ&oe=62E0CA64&_nc_sid=8fd12b",
          ),
        ],
        categoryList: [
          CategoryModel(
            id: "1",
            name: "Children's stories",
            imageLink:
                "https://img.freepik.com/premium-vector/little-cute-group-three-children-reading-books-sitting-sofa-flat-vector_627350-473.jpg?w=360",
          ),
          CategoryModel(
            id: "2",
            name: "Juvenile Fiction",
            imageLink:
                "https://scontent.fsgn5-15.fna.fbcdn.net/v/t1.18169-9/548913_593033844041426_625302973_n.png?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=lP9Tg-AGCyUAX-CXenw&_nc_ht=scontent.fsgn5-15.fna&oh=00_AT_5NPs_HS7gQGp80zkAgMPA4gkONK8LTv7wJdDrrJt4yA&oe=63009351",
          ),
        ],

        lastPage: 10,
        lastDay: "20/07/2022",
      ),
      const BookModel(
        id: "HEmJngEACAAJ",
        title: "Behind the Gates",
        description:
            "In a Chicago troubled by the war against the Alliance, Louisa and her best friend, Maddie, disguised as her twin sister, are sent to the exclusive Country Manor School, where they are cut off from the outside world and learn survival skills.",
        pageCount: 211,
        averageRating: 4,
        ratingsCount: 2,
        imageLink:
            "http://books.google.com/books/content?id=HEmJngEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
        view: 1241,

        //demo
        authorList: [
          AuthorModel(
            id: "2",
            name: "Eva Gray",
            imageLink:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6RiJfqmVgObeVExih1kwcYB436elPIgmbKw&usqp=CAU",
          ),
        ],
        categoryList: [
          CategoryModel(
            id: "2",
            name: "Juvenile Fiction",
            imageLink:
                "https://scontent.fsgn5-15.fna.fbcdn.net/v/t1.18169-9/548913_593033844041426_625302973_n.png?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=lP9Tg-AGCyUAX-CXenw&_nc_ht=scontent.fsgn5-15.fna&oh=00_AT_5NPs_HS7gQGp80zkAgMPA4gkONK8LTv7wJdDrrJt4yA&oe=63009351",
          ),
        ],
      ),
    ],
    "tu_ha": [
      const BookModel(
        id: "0X1PxwEACAAJ",
        title: "One Fair Wage",
        description:
            "\u003cp\u003eFrom the author of the acclaimed Behind the Kitchen Door, a powerful examination of how the subminimum wage and the tipping system exploit society's most vulnerable \u003c/p\u003e \u003cp\u003e\"No one has done more to move forward the rights of food and restaurant workers than Saru Jayaraman.\" --Mark Bittman, author of The Kitchen Matrix and A Bone to Pick\u003c/p\u003e \u003cp\u003eBefore the COVID-19 pandemic devastated the country, more than six million people earned their living as tipped workers in the service industry. They served us in cafes and restaurants, they delivered food to our homes, they drove us wherever we wanted to go, and they worked in nail salons for as little as \$2.13 an hour--the federal tipped minimum wage since 1991--leaving them with next to nothing to get by.\u003c/p\u003e \u003cp\u003eThese workers, unsurprisingly, were among the most vulnerable workers during the pandemic. As businesses across the country closed down or drastically scaled back their services, hundreds of thousands lost their jobs. As in many other areas, the pandemic exposed the inadequacies of the nation's social safety net and minimum-wage standards.\u003c/p\u003e \u003cp\u003eOne of New York magazine's \"Influentials\" of New York City, one of CNN's Visionary Women in 2014, and a White House Champion of Change in 2014, Saru Jayaraman is a nationally acclaimed restaurant activist and the author of the bestselling Behind the Kitchen Door. In her new book, One Fair Wage, Jayaraman shines a light on these workers, illustrating how the people left out of the fight for a fair minimum wage are society's most marginalized: people of color, many of them immigrants; women, who form the majority of tipped workers; disabled workers; incarcerated workers; and youth workers. They epitomize the direction of our whole economy, reflecting the precariousness and instability that is increasingly the lot of American labor.\u003c/p\u003e",
        pageCount: 256,
        averageRating: 4,
        ratingsCount: 28,
        imageLink:
            "http://books.google.com/books/content?id=0X1PxwEACAAJ&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE73achb_AZLcuiw97WXajaSsHFP6mGPA2JEbtoeTrcRBFzWknipozTfP5mit9A3Fgi623G_obI0OQUp4fH7t8GF7MGpvYeykKjCYaDcJ84aUEE6p9arFqDPVPnkXCaw6nZ0MObnu&source=gbs_api",
        view: 112,

        //demo
        authorList: [
          AuthorModel(
            id: "3",
            name: "Teofilo Reyes",
            imageLink:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQazBCc0hPE6m3U_IqcBDU-oL8-U6n8E02IzQ&usqp=CAU",
          ),
          AuthorModel(
            id: "4",
            name: "Saru Jayaraman",
            imageLink:
                "https://scontent.fsgn5-14.fna.fbcdn.net/v/t1.6435-9/158900679_361613908619003_3323147903344266764_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=aFTEo5CYhLkAX-hveTX&_nc_ht=scontent.fsgn5-14.fna&oh=00_AT-V1aEyMpA2OI3RL6bM_phEoQPHNd23vNxR5t6kVc5Dyw&oe=63017A4F",
          ),
        ],
        categoryList: [
          CategoryModel(
            id: "3",
            name: "Business",
            imageLink:
                "https://www.kindpng.com/picc/m/240-2409266_family-business-icon-png-transparent-png.png",
          ),
          CategoryModel(
            id: "4",
            name: "Economy",
            imageLink:
                "https://cdn-icons-png.flaticon.com/512/4634/4634988.png",
          ),
        ],

        lastPage: 19,
        lastDay: "11/07/2022",
      ),
      const BookModel(
        id: "NNGXDwAAQBAJ",
        title: "Good Economics for Hard Times",
        subTitle: "Better Answers to Our Biggest Problems",
        description:
            "\u003cp\u003e\u003cb\u003eFROM THE WINNERS OF THE 2019 NOBEL PRIZE IN ECONOMICS\u003cbr\u003e\u003c/b\u003e\u003cbr\u003e\u003cb\u003e'Wonderfully refreshing . . . A must read' Thomas Piketty \u003c/b\u003e \u003cbr\u003e\u003cbr\u003eIn this revolutionary book, prize-winning economists Abhijit V. Banerjee and Esther Duflo show how economics, when done right, can help us solve the thorniest social and political problems of our day. From immigration to inequality, slowing growth to accelerating climate change, we have the resources to address the challenges we face but we are so often blinded by ideology.\u003cbr\u003e\u003cbr\u003eOriginal, provocative and urgent,\u003ci\u003e Good Economics for Hard Times\u003c/i\u003e offers the new thinking that we need. It builds on cutting-edge research in economics - and years of exploring the most effective solutions to alleviate extreme poverty - to make a persuasive case for an intelligent interventionism and a society built on compassion and respect. A much-needed antidote to polarized discourse, this book shines a light to help us appreciate and understand our precariously balanced world.\u003c/p\u003e",
        pageCount: 416,
        averageRating: 4,
        ratingsCount: 6,
        imageLink:
            "http://books.google.com/books/publisher/content?id=NNGXDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE73N5OMTvN2lsDO0XRn3HkAP46c0HqsZgx_IsDvOH3QNeMZRGmHKbipvE3h-QJGh-yavWXNXaRoWz_J1n8egkX2w0D18biGVO0AHEM0YP50zn-Dmlz5kQoxeYeuRGxVhHORxcr7v&source=gbs_api",
        view: 4592,

        //demo
        authorList: [
          AuthorModel(
            id: "6",
            name: "Abhijit V. Banerjee",
            imageLink:
                "https://images.firstpost.com/wp-content/uploads/2022/03/Abhijit-Banerjee-640.jpg?impolicy=website&width=1200&height=800",
          ),
          AuthorModel(
            id: "7",
            name: "Esther Duflo",
            imageLink:
                "https://unctad.org/sites/default/files/2021-06/Esther%20Duflo_2_credit%20Bryce%20Vickmark_1200x675_0.jpg",
          ),
        ],
        categoryList: [
          CategoryModel(
            id: "4",
            name: "Economy",
            imageLink:
                "https://cdn-icons-png.flaticon.com/512/4634/4634988.png",
          ),
        ],
      ),
    ],
    "minwoo_k": [
      const BookModel(
        id: "NNGXDwAAQBAJ",
        title: "Good Economics for Hard Times",
        subTitle: "Better Answers to Our Biggest Problems",
        description:
            "\u003cp\u003e\u003cb\u003eFROM THE WINNERS OF THE 2019 NOBEL PRIZE IN ECONOMICS\u003cbr\u003e\u003c/b\u003e\u003cbr\u003e\u003cb\u003e'Wonderfully refreshing . . . A must read' Thomas Piketty \u003c/b\u003e \u003cbr\u003e\u003cbr\u003eIn this revolutionary book, prize-winning economists Abhijit V. Banerjee and Esther Duflo show how economics, when done right, can help us solve the thorniest social and political problems of our day. From immigration to inequality, slowing growth to accelerating climate change, we have the resources to address the challenges we face but we are so often blinded by ideology.\u003cbr\u003e\u003cbr\u003eOriginal, provocative and urgent,\u003ci\u003e Good Economics for Hard Times\u003c/i\u003e offers the new thinking that we need. It builds on cutting-edge research in economics - and years of exploring the most effective solutions to alleviate extreme poverty - to make a persuasive case for an intelligent interventionism and a society built on compassion and respect. A much-needed antidote to polarized discourse, this book shines a light to help us appreciate and understand our precariously balanced world.\u003c/p\u003e",
        pageCount: 416,
        averageRating: 4,
        ratingsCount: 6,
        imageLink:
            "http://books.google.com/books/publisher/content?id=NNGXDwAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&imgtk=AFLRE73N5OMTvN2lsDO0XRn3HkAP46c0HqsZgx_IsDvOH3QNeMZRGmHKbipvE3h-QJGh-yavWXNXaRoWz_J1n8egkX2w0D18biGVO0AHEM0YP50zn-Dmlz5kQoxeYeuRGxVhHORxcr7v&source=gbs_api",
        view: 4592,

        //demo
        authorList: [
          AuthorModel(
            id: "6",
            name: "Abhijit V. Banerjee",
            imageLink:
                "https://images.firstpost.com/wp-content/uploads/2022/03/Abhijit-Banerjee-640.jpg?impolicy=website&width=1200&height=800",
          ),
          AuthorModel(
            id: "7",
            name: "Esther Duflo",
            imageLink:
                "https://unctad.org/sites/default/files/2021-06/Esther%20Duflo_2_credit%20Bryce%20Vickmark_1200x675_0.jpg",
          ),
        ],
        categoryList: [
          CategoryModel(
            id: "4",
            name: "Economy",
            imageLink:
                "https://cdn-icons-png.flaticon.com/512/4634/4634988.png",
          ),
        ],

        lastPage: 87,
        lastDay: "04/06/2022",
      ),
      const BookModel(
        id: "0X1PxwEACAAJ",
        title: "One Fair Wage",
        description:
            "\u003cp\u003eFrom the author of the acclaimed Behind the Kitchen Door, a powerful examination of how the subminimum wage and the tipping system exploit society's most vulnerable \u003c/p\u003e \u003cp\u003e\"No one has done more to move forward the rights of food and restaurant workers than Saru Jayaraman.\" --Mark Bittman, author of The Kitchen Matrix and A Bone to Pick\u003c/p\u003e \u003cp\u003eBefore the COVID-19 pandemic devastated the country, more than six million people earned their living as tipped workers in the service industry. They served us in cafes and restaurants, they delivered food to our homes, they drove us wherever we wanted to go, and they worked in nail salons for as little as \$2.13 an hour--the federal tipped minimum wage since 1991--leaving them with next to nothing to get by.\u003c/p\u003e \u003cp\u003eThese workers, unsurprisingly, were among the most vulnerable workers during the pandemic. As businesses across the country closed down or drastically scaled back their services, hundreds of thousands lost their jobs. As in many other areas, the pandemic exposed the inadequacies of the nation's social safety net and minimum-wage standards.\u003c/p\u003e \u003cp\u003eOne of New York magazine's \"Influentials\" of New York City, one of CNN's Visionary Women in 2014, and a White House Champion of Change in 2014, Saru Jayaraman is a nationally acclaimed restaurant activist and the author of the bestselling Behind the Kitchen Door. In her new book, One Fair Wage, Jayaraman shines a light on these workers, illustrating how the people left out of the fight for a fair minimum wage are society's most marginalized: people of color, many of them immigrants; women, who form the majority of tipped workers; disabled workers; incarcerated workers; and youth workers. They epitomize the direction of our whole economy, reflecting the precariousness and instability that is increasingly the lot of American labor.\u003c/p\u003e",
        pageCount: 256,
        averageRating: 4,
        ratingsCount: 28,
        imageLink:
            "http://books.google.com/books/content?id=0X1PxwEACAAJ&printsec=frontcover&img=1&zoom=1&imgtk=AFLRE73achb_AZLcuiw97WXajaSsHFP6mGPA2JEbtoeTrcRBFzWknipozTfP5mit9A3Fgi623G_obI0OQUp4fH7t8GF7MGpvYeykKjCYaDcJ84aUEE6p9arFqDPVPnkXCaw6nZ0MObnu&source=gbs_api",
        view: 112,

        //demo
        authorList: [
          AuthorModel(
            id: "3",
            name: "Teofilo Reyes",
            imageLink:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQazBCc0hPE6m3U_IqcBDU-oL8-U6n8E02IzQ&usqp=CAU",
          ),
          AuthorModel(
            id: "4",
            name: "Saru Jayaraman",
            imageLink:
                "https://scontent.fsgn5-14.fna.fbcdn.net/v/t1.6435-9/158900679_361613908619003_3323147903344266764_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=aFTEo5CYhLkAX-hveTX&_nc_ht=scontent.fsgn5-14.fna&oh=00_AT-V1aEyMpA2OI3RL6bM_phEoQPHNd23vNxR5t6kVc5Dyw&oe=63017A4F",
          ),
        ],
        categoryList: [
          CategoryModel(
            id: "3",
            name: "Business",
            imageLink:
                "https://www.kindpng.com/picc/m/240-2409266_family-business-icon-png-transparent-png.png",
          ),
          CategoryModel(
            id: "4",
            name: "Economy",
            imageLink:
                "https://cdn-icons-png.flaticon.com/512/4634/4634988.png",
          ),
        ],
      ),
    ]
  };

  @override
  Future<List<BookModel>> getRecommendedBook({required String token}) async {
    // print(seed);
    return recommendedBooksMap[token]!;
  }

  @override
  Future<BookModel> getLastBook({required String token}) async {
    return lastBookMap[token]!;
  }

  @override
  Future<List<BookModel>> getSameCategoryBook({
    required String token,
    required BookModel bookItem,
  }) async {
    // await Future.delayed(const Duration(seconds: 1));

    final categoryList = bookItem.categoryList;

    return bookList.where(
      (element) {
        for (final category in categoryList) {
          for (final categoryBook in element.categoryList) {
            if (category.name == categoryBook.name &&
                element.id != bookItem.id) {
              return true;
            }
          }
        }
        return false;
      },
    ).toList();
  }

  @override
  Future<List<String>> getHistorySearch({required String token}) async {
    return history[token]!;
  }

  @override
  Future<void> deleteHistory(
      {required String token, required String name}) async {
    history[token]!.removeWhere((element) => element == name);
  }

  @override
  Future<List<BookModel>> getTopBook({required String token}) async {
    return bookList;
  }

  @override
  Future<List<BookModel>> getFavoriteBook({required String token}) async {
    return favoriteBookMap[token]!;
  }

  @override
  Future<List<BookModel>> getReadBook({required String token}) async {
    return readBookMap[token]!;
  }

  @override
  Future<bool> getIsFavorite({
    required String token,
    required BookModel bookItem,
  }) async {
    final favoriteBooks = favoriteBookMap[token]!;
    return favoriteBooks.any((element) => element.id == bookItem.id);
  }
}
