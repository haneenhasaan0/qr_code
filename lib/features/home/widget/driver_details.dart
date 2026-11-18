import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_code/core/app_colors/app_colors.dart';
import 'package:qr_code/core/services/local/shared_pref.dart';
import 'package:qr_code/features/home/data/repo/driver_vehicle_repo.dart';
import 'package:qr_code/features/licence/presentation/widget/shimmer_license.dart';
import 'package:qr_code/features/login/presentation/widget/user_name_widget.dart';

class DriverDetails extends StatefulWidget {
  const DriverDetails({super.key,required this.userName,required this.code});

 final String userName;
 final String code;
  @override
  State<DriverDetails> createState() => _DriverDetailsState();
}

class _DriverDetailsState extends State<DriverDetails> {
  String? imagePath = SharedPref.getString('profileImage');
  String? plate; // لوحة عربية السواق (من كود الميشن)
  bool vehicleLoaded = false;

  @override
  void initState() {
    super.initState();
    DriverVehicleRepo.getPlate(widget.userName).then((p) {
      if (mounted) setState(() { plate = p; vehicleLoaded = true; });
    });
  }

  Future<void> pickImage() async {
    final file = await FilePicker.pickFile(type: FileType.image);
    if (file?.path == null) return;
    final dir = await getApplicationDocumentsDirectory();
    final saved = await File(file!.path!).copy('${dir.path}/profile_${DateTime.now().millisecondsSinceEpoch}.${file.extension}');
    if (imagePath != null && File(imagePath!).existsSync()) File(imagePath!).deleteSync();
    SharedPref.setString('profileImage', saved.path);
    setState(() => imagePath = saved.path);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).focusColor,
        border: Border.symmetric(
        vertical: BorderSide.none,
        horizontal: BorderSide(color: AppColors.borderColor),
      ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            InkWell(
              onTap: pickImage,
              child: Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: AppColors.darkGreenColor,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: AppColors.greenColor),
                  image: imagePath != null && File(imagePath!).existsSync()
                      ? DecorationImage(image: FileImage(File(imagePath!)), fit: BoxFit.cover)
                      : null,
                ),
              ),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserNameWidget(code: widget.code,),
                Text("الكود :${widget.userName}",style: TextStyle(color: AppColors.borderColor),),
                if (!vehicleLoaded)
                  const Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: ShimmerLicense(width: 110, height: 14),
                  )
                else
                  Row(
                    children: [
                      Icon(Icons.local_shipping_outlined, size: 14, color: AppColors.borderColor),
                      const SizedBox(width: 4),
                      Text(plate ?? 'غير مربوط بعربية', style: TextStyle(color: AppColors.borderColor)),
                    ],
                  ),
              ],
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.menu, color: Theme.of(context).textTheme.bodyLarge?.color),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ],
        ),
      ),
    );
  }
}
