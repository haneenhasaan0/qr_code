import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class CurrentLocationField extends StatefulWidget {
  const CurrentLocationField({super.key, this.onChanged, this.locationAddress});

  final ValueChanged<String?>? onChanged;
  final String? locationAddress;

  @override
  State<CurrentLocationField> createState() => _CurrentLocationFieldState();
}

class _CurrentLocationFieldState extends State<CurrentLocationField> {
  final Geocoding geocoding = Geocoding(locale: const Locale('ar'));

  String locationText = '';
  double? latitude;
  double? longitude;
  bool isLoading = false;

  Future<void> getCurrentLocation() async {
    setState(() {
      isLoading = true;
      locationText = 'جاري تحديد موقعك...';
    });

    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
        throw Exception('فعّل خدمة الموقع وجربي تاني');
      }

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied) {
        throw Exception('لازم تسمح للتطبيق بالوصول للموقع');
      }

      if (permission == LocationPermission.deniedForever) {
        await Geolocator.openAppSettings();
        throw Exception('فعّل إذن الموقع للتطبيق من إعدادات الموبايل');
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );
      final placemarks = await geocoding.placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      String address = '';

      for (final place in placemarks) {
        final parts =
            [
                  place.street,
                  place.subLocality,
                  place.locality,
                  place.subAdministrativeArea,
                  place.administrativeArea,
                ]
                .where((part) => part != null && part.trim().isNotEmpty)
                .map((part) => part!.trim())
                .toSet()
                .toList();

        final candidate = parts.join('، ');

        if (candidate.isNotEmpty &&
            !candidate.contains('+') &&
            !RegExp(r'^[0-9A-Z]+\+[0-9A-Z]+$').hasMatch(candidate)) {
          address = candidate;
          break;
        }
      }

      if (address.isEmpty) {
        address = '${position.latitude}, ${position.longitude}';
      }

      if (!mounted) return;

      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
        locationText = address;
      });
      widget.onChanged?.call(address);
    } catch (e) {
      if (!mounted) return;

      setState(() {
        locationText = '';
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString().replaceFirst('Exception: ', ''))),
      );
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          validator: (value) {
            if (latitude == null || longitude == null) {
              return 'من فضلك حددي موقعك الحالي';
            }
            return null;
          },
          onChanged: widget.onChanged,
          key: ValueKey(locationText),
          initialValue: locationText,
          readOnly: true,
          style: Theme.of(context).textTheme.bodyLarge,
          decoration: InputDecoration(
            hintText: 'موقعي الحالي',
            filled: true,
            fillColor: Theme.of(context).focusColor,
            prefixIcon: const Icon(Icons.location_on),
            suffixIcon: IconButton(
              onPressed: isLoading ? null : getCurrentLocation,
              tooltip: 'تحديد موقعي الحالي',
              icon: isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.my_location),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        if (latitude != null && longitude != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'Latitude: $latitude\nLongitude: $longitude',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
      ],
    );
  }
}
