import 'package:car_dashboard/pages/booking_page/widgets/booking_parameter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../generated/assets.gen.dart';
import '../../models/booking_car.dart';
import '../../resources/app_typography.dart';
import '../../resources/theme/custom_theme_extension.dart';
import '../../widgets/dropdown/custom_dropdown.dart';
import 'widgets/booking_car_card.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  List<BookingCar> bookingCars = [
    BookingCar(
      name: 'Audi A4',
      classCar: 'Coupe',
      image: Assets.images.carAudiA4.path,
      passengers: 4,
      returningType: 'Manual',
      priceForDay: 400,
      isSelected: true,
    ),
    BookingCar(
      name: 'Mercedes-Benz M-Class',
      classCar: 'Coupe',
      image: Assets.images.carMercedesBenzMClass.path,
      passengers: 4,
      returningType: 'Manual',
      priceForDay: 300,
      isSelected: false,
    ),
    BookingCar(
      name: 'Audi Q5',
      classCar: 'Coupe',
      image: Assets.images.carAudiQ5.path,
      passengers: 4,
      returningType: 'Manual',
      priceForDay: 200,
      isSelected: false,
    ),
    BookingCar(
      name: 'Maruti Suzuki Dzire',
      classCar: 'Coupe',
      image: Assets.images.carMarutiSuzukiDzire.path,
      passengers: 4,
      returningType: 'Manual',
      priceForDay: 250,
      isSelected: true,
    ),
    BookingCar(
      name: 'Toyota Innova',
      classCar: 'Coupe',
      image: Assets.images.carToyotaInnova.path,
      passengers: 4,
      returningType: 'Manual',
      priceForDay: 350,
      isSelected: true,
    ),
  ];

  @override
  void initState() {
    super.initState();
    bookingCars = [
      ...bookingCars,
      ...bookingCars,
      ...bookingCars,
      ...bookingCars
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Text(
                  'Booking',
                  style: AppTypography.headingH1.copyWith(
                    color: colors(context).parametersTextColor,
                  ),
                ),
                const Gap(30.0),
                Row(
                  children: [
                    const Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomDropdown(
                              text: 'New',
                            ),
                            Gap(16.0),
                            CustomDropdown(
                              text: 'Toyota',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Gap(16.0),
                        BookingParameter(
                          iconPath: Assets.icons.grid.path,
                        ),
                        const Gap(16.0),
                        BookingParameter(
                          iconPath: Assets.icons.settings.path,
                        ),
                      ],
                    ),
                  ],
                ),
                const Gap(30.0),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: bookingCars.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 550.0,
                    mainAxisExtent: 314.0,
                    crossAxisSpacing: 25.0,
                    mainAxisSpacing: 20.0,
                  ),
                  itemBuilder: (context, index) => BookingCarCard(
                    bookingCar: bookingCars[index],
                    onChanged: (bool newValue) {
                      setState(() {
                        bookingCars[index] = bookingCars[index].copyWith(
                          isSelected: newValue,
                        );
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
