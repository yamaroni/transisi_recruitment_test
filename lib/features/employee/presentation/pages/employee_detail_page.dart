import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_symbols_icons/symbols.dart';

class EmployeeDetailPage extends StatelessWidget {
  final String avatar;
  final String? email;
  final String? fullname;
  final Function()? onEdited;
  const EmployeeDetailPage({
    super.key,
    required this.avatar,
    this.email,
    this.fullname,
    this.onEdited,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Symbols.chevron_left,
            size: 32.w,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 16.w,
            ),
            child: InkWell(
              onTap: onEdited,
              child: Icon(
                Symbols.edit,
                size: 24.w,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[50],
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              height: MediaQuery.sizeOf(context).height / 2.5,
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: avatar,
                      height: 96.w,
                      width: 96.w,
                    ),
                  ),
                  Text(
                    fullname ?? 'Employee',
                    style: TextStyle(
                      fontSize: 20.w,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.w),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                color: Colors.white,
              ),
              child: ListTile(
                leading: const Icon(Symbols.email),
                title: Text(
                  email ?? 'example@email.com',
                  style: TextStyle(
                    fontSize: 16.w,
                  ),
                ),
                subtitle: Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 14.w,
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
