import 'dart:io';
import 'dart:math';

import 'package:e_commerce/src/_dev/categories_data.dart';
import 'package:e_commerce/src/network/domain_manager.dart';
import 'package:e_commerce/src/network/model/product/product.dart';
import 'package:e_commerce/src/network/model/product/variant.dart';

final random = Random();

final List<MProduct> sampleProducts = [
  for (int i = 1; i <= 50; i++)
    MProduct(
        id: 'prod_0${i.toString().padLeft(2, '0')}',
        name: [
          'Athletic Running Shoes',
          'Premium Leather Wallet',
          'Classic Aviator Sunglasses',
          'Smart Casual Blazer',
          'Ultra Soft Hoodie',
          'Vintage Denim Jacket',
          'Chic Summer Sandals',
          'Elegant Pearl Necklace',
          'Cozy Winter Scarf',
          'Sporty Digital Watch',
          'Trendy Cargo Pants',
          'Formal Silk Tie',
          'Breathable Yoga Leggings',
          'Comfort Fit Polo Shirt',
          'Lightweight Windbreaker',
          'Cotton Ankle Socks',
          'Designer Handbag',
          'Casual Canvas Sneakers',
          'Waterproof Hiking Boots',
          'Minimalist Gold Bracelet',
          'Relaxed Fit Chinos',
          'Thermal Underwear Set',
          'High-Waist Trousers',
          'Lace-Up Derby Shoes',
          'Classic Cotton Turtleneck',
          'Stylish Fedora Hat',
          'Luxury Cashmere Sweater',
          'Oversized Sunglasses',
          'Fashionable Midi Skirt',
          'Running Performance Shorts',
          'Leather Strap Wristwatch',
          'Outdoor Adventure Jacket',
          'Silk Patterned Scarf',
          'Casual Graphic T-Shirt',
          'Slim Fit Formal Suit',
          'Chunky Knit Cardigan',
          'Performance Gym Shorts',
          'Fleece-Lined Sweatpants',
          'Elegant Evening Clutch',
          'Denim Overalls',
          'Stretch Fit Sports Bra',
          'Breathable Mesh Cap',
          'High-Top Basketball Sneakers',
          'Casual Slip-On Loafers',
          'Vintage Checkered Shirt',
          'Lightweight Waterproof Parka',
          'Classic Striped Tie',
          'Rugged Outdoor Sandals'
        ][(i - 1) % 45],
        descriptipn: 'Premium quality and stylish design.',
        oldPrice: 2000 + (i * 15),
        newPrice: ((2000 + (i * 15)) * ((i % 5) * 2.5)).toInt(),
        image: imagePath[(i - 1) % imagePath.length],
        avgRating: 3.5 + (i % 5) * 0.2,
        isNew: i % 2 == 0,
        isFeatured: i % 3 == 0,
        discount: (i % 5) * 2.5,
        idCategory: idCategories[i % idCategories.length],
        variants: [
          for (int i = 0; i <= random.nextInt(6); i++)
            MVariant(
              id: 'var_0${i.toString().padLeft(2, '0')}',
              color: colors[random.nextInt(colors.length)],
              size: sizes[random.nextInt(sizes.length)],
              image: imagePath[(i - 1) % imagePath.length],
              price: 2000 + (i * 15)
            )
        ]),
];

final List<String> imagePath = [
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165151/lp5iqfrf1zbd6kugez0i.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165152/z5r2awnxodzzm2qlwcwa.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165153/fotkop9t142sk8m4x8tk.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165154/xrhgtzy6rycivbtxirid.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165155/cmzndodh7uczisgmwm9d.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165155/whqwxndvfpif9kkdmdno.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165156/rqj2bhursy9gpjrjxgso.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165157/w6dbzhkbomnamcqcmbd8.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165159/dhjhvp12dyxdtz7vfme9.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165160/vbfhsyl10aeurixoefel.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165161/zk6qvhco5zd5r5a2yhe7.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165162/piocpi2ifegky9mecblj.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165162/l5f2apzv7v4fcvxgqted.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165163/fcakknuxzowndhhsie1b.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165164/akngnctln3srmdp5zx7g.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165164/qk22g9lwwnscshnp1ut4.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165165/vec4knnqe8fikjmkuvph.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165166/ibpkcea1ycvraxjcsb2r.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165166/sapjcmfvamkrpqys1xqg.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165167/bmu1ztubzspw01kspdu2.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165168/w5elugm7g5nznwgk26d6.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165169/jebytjkqkmwmqxpflrqd.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165170/y4lmntdqpt89uwnzuedx.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165170/tpsrxyxg3nxukoapfgd3.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165171/jpdpfpbw1az1hlqaecuw.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165172/mthb7xkgjk9hwpqlvpo9.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165172/s1m0n8npxapkwt44ejtb.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165173/hlmwttt6g7lefsjbrahz.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165174/mcrtyq9msypsl4ybvwfx.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165174/k6vpx3wdu7qfm3x1iy7q.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165175/rvcgicigarfsrilgntrr.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165176/lryz6qg8tsqxd2nr1n1k.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165177/wcr6nfjrs7qnwvdotg0h.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165177/hnzeltpvwkxmizewxxcb.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165178/ghexf6tidp7qi3qa5chd.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165179/a7m1ciwhpxpulyk6ifhe.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165180/cg13aj4etarh3jmsv3zx.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165180/fspckzd3vpx3krzxeo8e.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165181/ygaionse7ftbnjbiuxap.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165182/uzzlmeqsotk6ct3tarvg.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165183/bpzmihpnay1r1ybjn6yc.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165184/ovkzhx2kempidbjb6qdq.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165185/t91w9nogbskx6lt9u9vg.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165185/sesqwf4dsj8nrzyudyzz.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165186/vnc20gttnh1q4kex699o.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165186/kn0txni5kk2cxsdxkusp.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165187/xffz2j967cqy9f36yhm0.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165188/ainoococm50hlv0ym7ta.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165189/gmthhgjokqvaqq4ic7my.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165189/uq8amynboltarw3nsyly.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165190/yf4p3xa0zmpkbxdtkwuz.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165191/v5ocwbmmw8zyyp5h3fqs.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165192/musx6h6wpvztqglbvyrs.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165192/v67sf9w3rqpdqvm1g9rb.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165193/lkn5ohhjfnqyw2wu5r0n.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165194/qthjbvt9rsvaskfwlo21.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165195/lweaqbjmflmwm1mschuy.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165195/sujuqnkr2r4k7zdzjj7w.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165196/zz9brkfdsynue7ux28l7.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165197/kimusv4u8jcv9jvxlp6v.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165198/zgo6aqefx5yej77s6rl6.jpg",
  "https://res.cloudinary.com/duqhnrtxz/image/upload/v1741165198/frv2kton3z3gioewts5v.jpg",
];

final List<String> colors = [
  "Red",
  "Blue",
  "White",
  "Black",
  "Pink",
  "Green",
  "Coban"
];

final List<String> sizes = ["S", "XS", "M", "L", "XL", "XXL"];

final List<String> idCategories = [
  '03FqQJjPdioNXoO0Gk8n',
  'DUSi2zH36SVikvQhYH85',
  'EAV73VLmj7kZJPLhJyvw',
  'MYSRS38DmVgjrfrh5Vkk',
  'ON8pZDHkxiTc5kRWi49T',
  'QDZxgaiDnxUMLgha05iv',
  'Qr3wf1TRtYhMy4cIAoOM',
  'RjSQAUwPX2pwxRHSLpXu',
  'Wcy51kqt9l3oPovVx0r3',
  'aWyW6IRQoDfF40pfwkLf',
  'gKtWeyQGq1egIwGMOmaL',
  'gN8qp66m6WCMHpyiE411',
  'hHI5YDkM2YZWbQkfl3ct',
  'lJSKiX9VPgg7770WhP4v',
  'lprxqcYdwQ9t4tYLGfPb',
  'q4mvacMtD5KNXpxgmbJH',
  'sciQlSExayQcGi3I2Khe',
  'wKN5ivS9Ve41xwID7BjF',
  'yRn9HDsnGTUvs8GxR5N7'
];

class UpLoad {
  final domain = DomainManager();
  Future<void> uploadProducts() async {
    for (var product in sampleProducts) {
      print("Uploading product: ${product.toJson()}"); //
      final result = await domain.product.getOrAddProduct(product);
      if (result.isSuccess) {
        print("Uploaded: ${result.data?.name}");
      } else {
        print("Error uploading ${product.name}: ${result.error}");
      }
    }
  }

  Future<void> uploadCategories() async {
    for (var cate in getClothingCategories) {
      final result = await domain.catgory.getOrAddCategories(cate);
      if (result.isSuccess) {
        print("Uploaded: ${result.data?.name}");
      } else {
        print("Error uploading ${cate.name}: ${result.error}");
      }
    }
  }

  List<String> getFilePaths(String directoryPath) {
    final directory = Directory(directoryPath);
    if (!directory.existsSync()) {
      throw Exception("Directory does not exist: $directoryPath");
    }

    return directory
        .listSync()
        .whereType<File>()
        .map((file) => file.path)
        .toList();
  }

  Future<void> uploadFile() async {
    final paths = getFilePaths(
        "/Users/tomi.diyu/Desktop/images/marc.com.vn-1741163023567");

    List<String> uploadedUrls = [];

    for (var path in paths) {
      final upload = await domain.upload.uploadFile(path);
      print(path);
      uploadedUrls.add('"${upload.url}",');
    }

    // Lưu danh sách URL vào một tệp văn bản
    final outputFile = File('/Users/tomi.diyu/Desktop/uploaded_urls.txt');
    await outputFile.writeAsString(uploadedUrls.join('\n'));

    print("Đã lưu danh sách URL vào uploaded_urls.txt");
  }

  Future<List<String>> readFile(String filePath) async {
    final file = File(filePath);

    if (await file.exists()) {
      return await file.readAsLines();
    } else {
      throw Exception("File không tồn tại: $filePath");
    }
  }
}
