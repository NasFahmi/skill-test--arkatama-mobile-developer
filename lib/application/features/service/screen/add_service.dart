import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skill_test_mobile_developer/application/components/widget/button_secundary.dart';
import 'package:skill_test_mobile_developer/application/components/widget/button_thridy.dart';
import 'package:skill_test_mobile_developer/application/features/service/bloc/travel_bloc.dart';

class AddService extends StatelessWidget {
  const AddService({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TravelBloc(),
      child: AddServiceScreen(),
    );
  }
}

class AddServiceScreen extends StatefulWidget {
  const AddServiceScreen({super.key});

  @override
  State<AddServiceScreen> createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  final TextEditingController serviceNameController = TextEditingController();
  final TextEditingController quotaController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  String selectedCarFleet = '';

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      dateController.text = DateFormat('dd MMM yyyy').format(picked);
    }
  }

  Future<void> _pickTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      timeController.text = picked.format(context);
    }
  }

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
                // Back Button
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

                // Form Container
                Expanded(
                  child: BlocListener<TravelBloc, TravelState>(
                    listener: (context, state) {
                      if (state is TravelSuccess) {
                        Navigator.pop(context);
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
                              "Add Service",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF262626),
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Service Name
                            const Text(
                              "Service Name*",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 8),
                            TextField(
                              controller: serviceNameController,
                              decoration: _inputDecoration(
                                "Ex: Trip to Malang",
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Quota
                            const Text(
                              "Quota*",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 8),
                            TextField(
                              controller: quotaController,
                              keyboardType: TextInputType.number,
                              decoration: _inputDecoration("Quota"),
                            ),
                            const SizedBox(height: 16),

                            // Car Fleet
                            const Text(
                              "Car Fleet*",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 8),
                            DropdownButtonFormField<String>(
                              hint: const Text('Choose Car Fleet'),
                              value: selectedCarFleet.isEmpty
                                  ? null
                                  : selectedCarFleet,
                              decoration: _inputDecoration(""),
                              items: ['Toyota Hiace', 'Isuzu Elf', 'Avanza']
                                  .map((fleet) {
                                    return DropdownMenuItem(
                                      value: fleet,
                                      child: Text(fleet),
                                    );
                                  })
                                  .toList(),
                              onChanged: (val) => setState(() {
                                selectedCarFleet = val!;
                              }),
                            ),
                            const SizedBox(height: 16),

                            // Departure Date
                            const Text(
                              "Departure Date*",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 8),
                            TextField(
                              controller: dateController,
                              readOnly: true,
                              onTap: _pickDate,
                              decoration: _inputDecoration("Departure Date")
                                  .copyWith(
                                    suffixIcon: const Icon(
                                      Icons.calendar_today,
                                    ),
                                  ),
                            ),
                            const SizedBox(height: 16),

                            // Departure Time
                            const Text(
                              "Departure Time*",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 8),
                            TextField(
                              controller: timeController,
                              readOnly: true,
                              onTap: _pickTime,
                              decoration: _inputDecoration("Departure Time")
                                  .copyWith(
                                    suffixIcon: const Icon(Icons.access_time),
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
                                    mainButtonMessage: "Add Service",
                                    mainButton: () {
                                      final serviceName = serviceNameController
                                          .text
                                          .trim();
                                      final quota =
                                          int.tryParse(
                                            quotaController.text.trim(),
                                          ) ??
                                          0;
                                      final fleet = selectedCarFleet;
                                      final date = dateController.text.trim();
                                      final time = timeController.text.trim();

                                      // Validasi sederhana
                                      if (serviceName.isEmpty ||
                                          quota <= 0 ||
                                          fleet.isEmpty ||
                                          date.isEmpty ||
                                          time.isEmpty) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Please fill all fields',
                                            ),
                                          ),
                                        );
                                        return;
                                      }

                                      // Gabungkan tanggal dan waktu jadi DateTime
                                      final parsedDate = DateFormat(
                                        'dd MMM yyyy',
                                      ).parse(date);
                                      final parsedTime = TimeOfDay(
                                        hour: int.parse(time.split(':')[0]),
                                        minute: int.parse(
                                          time.split(':')[1].split(' ')[0],
                                        ),
                                      );
                                      final now = DateTime.now();
                                      final departureDate = DateTime(
                                        parsedDate.year,
                                        parsedDate.month,
                                        parsedDate.day,
                                        parsedTime.hour,
                                        parsedTime.minute,
                                      );

                                      BlocProvider.of<TravelBloc>(context).add(
                                        CreateTravel(
                                          serviceName: serviceName,
                                          quota: quota,
                                          carFleet: fleet,
                                          departureDate: departureDate,
                                        ),
                                      );
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

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xFFF6F6F6)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xFF2563EB), width: 2),
      ),
    );
  }
}
