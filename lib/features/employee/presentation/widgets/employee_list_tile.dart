import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transisi_recruitment_test/core/helpers/global_helper.dart';
import 'package:transisi_recruitment_test/features/employee/domain/entities/employee_entity.dart';

class EmployeeListTile extends StatelessWidget {
  final int index;
  final List<EmployeeEntity> listEmployee;
  final Function()? onSelected;
  const EmployeeListTile({
    super.key,
    required this.index,
    required this.listEmployee,
    this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onSelected,
      leading: GlobalHelper.isEmpty(listEmployee[index].avatar)
          ? CircleAvatar(radius: 48.w)
          : ClipOval(
              child: CachedNetworkImage(
                imageUrl: listEmployee[index].avatar,
                errorWidget: (context, url, error) =>
                    CircleAvatar(radius: 48.w),
                width: 48.w,
                height: 48.w,
              ),
            ),
      title: Text(
        listEmployee[index].fullname,
        style: TextStyle(
          fontSize: 16.w,
        ),
      ),
      subtitle: Text(
        listEmployee[index].email,
        style: TextStyle(
          fontSize: 12.w,
        ),
      ),
    );
  }
}
