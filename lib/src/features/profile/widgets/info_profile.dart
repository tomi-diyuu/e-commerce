import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/src/features/account/bloc/account_bloc.dart';
import 'package:e_commerce/src/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class InfoProfile extends StatelessWidget {
  const InfoProfile(
      {super.key,
      required this.name,
      required this.email,
      required this.image});

  final String name;
  final String email;
  final String image;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        return Row(
          children: [
            // Avatar
            GestureDetector(
              onTap: () async {
                final path = await _pickImage();
                if (path == '') return; // Khi người dùng hủy không chọn ảnh
                context.read<AccountBloc>().add(AccountAvatarChanged(path));
              },
              child: CachedNetworkImage(
                imageUrl: image,
                imageBuilder: (context, imageProvider) => Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            // Name and email user
            _nameAndEmailUser(context)
          ],
        );
      },
    );
  }

  Widget _nameAndEmailUser(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 2, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: textStyle.titleMedium),
          Text(email, style: textStyle.labelLarge)
        ],
      ),
    );
  }

  Future<String> _pickImage() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (file != null) return file.path;
    return "";
  }
}
