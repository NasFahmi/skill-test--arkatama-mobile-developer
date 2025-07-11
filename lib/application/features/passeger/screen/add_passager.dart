import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_test_mobile_developer/application/components/widget/button_secundary.dart';
import 'package:skill_test_mobile_developer/application/components/widget/button_thridy.dart';
import 'package:skill_test_mobile_developer/application/features/passeger/bloc/passanger_bloc.dart';
import 'package:skill_test_mobile_developer/application/features/service/bloc/travel_bloc.dart';

class AddPassager extends StatelessWidget {
  const AddPassager({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PassangerBloc(),
      child: AddPassagerScreen(),
    );
  }
}

class AddPassagerScreen extends StatefulWidget {
  const AddPassagerScreen({super.key});

  @override
  State<AddPassagerScreen> createState() => _AddPassagerScreenState();
}

class _AddPassagerScreenState extends State<AddPassagerScreen> {
  final TextEditingController passengerController = TextEditingController();
  final TextEditingController pickupLocationController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String selectedService = '';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF1572D3),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back button
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.chevron_left, size: 24),
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                // Expanded form
                Expanded(
                  child: BlocListener<PassangerBloc, PassangerState>(
                    listener: (context, state) {
                      if (state is PassangerSuccess) {
                        Navigator.pop(context);
                      } else if (state is PassangerFailed) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.message)));
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(32),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Add Passenger",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF262626),
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Passenger
                            const Text(
                              "Passenger*",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 8),
                            TextField(
                              controller: passengerController,
                              decoration: InputDecoration(
                                hintText: "Name - Age - City",
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: const BorderSide(
                                    width: 2,
                                    color: Color(0xFFEDF1F3),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: const BorderSide(
                                    color: Color(0xFF2563EB),
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Travel Services
                            const Text(
                              "Travel Services*",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 8),
                            BlocBuilder<PassangerBloc, PassangerState>(
                              builder: (context, state) {
                                if (state is PassangerFormLoaded) {
                                  final travels = state.travelEntity;

                                  return DropdownButtonFormField<String>(
                                    hint: const Text('Choose Service'),
                                    value: selectedService.isEmpty
                                        ? null
                                        : selectedService,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: const BorderSide(
                                          color: Color(0xFFEDF1F3),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: const BorderSide(
                                          color: Color(0xFF2563EB),
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    items: travels.map((travel) {
                                      return DropdownMenuItem<String>(
                                        value: travel.id.toString(),
                                        child: Text(
                                          '${travel.name} - ${travel.tanggalKeberangkatan}',
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedService = value!;
                                      });
                                    },
                                  );
                                } else if (state is PassangerLoading) {
                                  return const CircularProgressIndicator();
                                } else {
                                  return const Text("No available travels.");
                                }
                              },
                            ),
                            const SizedBox(height: 16),

                            // Pickup Location
                            const Text(
                              "Pickup Location*",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 8),
                            TextField(
                              controller: pickupLocationController,
                              decoration: InputDecoration(
                                hintText: "Pickup Location",
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFEDF1F3),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: const BorderSide(
                                    color: Color(0xFF2563EB),
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Whatsapp Number
                            const Text(
                              "Whatsapp Number",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Text("+62"),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: TextField(
                                    controller: phoneController,
                                    decoration: InputDecoration(
                                      hintText: "Whatsapp Number",
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: const BorderSide(
                                          color: Color(0xFFEDF1F3),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: const BorderSide(
                                          color: Color(0xFF2563EB),
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "Writing format without country code, must use active cellphone number",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Buttons
                            Row(
                              children: [
                                Expanded(
                                  child: ButtonThridy(
                                    mainButtonMessage: "Cancel",
                                    mainButton: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: ButtonSecundary(
                                    mainButtonMessage: "Add Passanger",
                                    mainButton: () {
                                      mainButton:
                                      () {
                                        final inputText =
                                            passengerController.text;
                                        final pickupLocation =
                                            pickupLocationController.text;
                                        final phoneNumber =
                                            phoneController.text;

                                        if (inputText.isEmpty ||
                                            selectedService.isEmpty ||
                                            pickupLocation.isEmpty) {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                "Please fill all required fields",
                                              ),
                                            ),
                                          );
                                          return;
                                        }

                                        context.read<PassangerBloc>().add(
                                          CreatePassangerEvent(
                                            inputText: inputText,
                                            travelId: int.parse(
                                              selectedService,
                                            ),
                                            pickupLocation: pickupLocation,
                                            phoneNumber: phoneNumber,
                                          ),
                                        );
                                      };
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
