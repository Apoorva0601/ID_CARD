import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:barcode_widget/barcode_widget.dart';

void main() => runApp(
      const MaterialApp(
        home: IDCard(),
        debugShowCheckedModeBanner: false,
      ),
    );

class IDCard extends StatelessWidget {
  const IDCard({super.key});

  @override
  Widget build(BuildContext context) {
    const String usn = "NNM24MC017";

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1F1C2C), Color.fromARGB(255, 84, 79, 107)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Container(
            width: 250,
            height: 450,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(250,3, 3, 3),
                  blurRadius: 12,
                  offset: Offset(5, 5),
                ),
              ],
            ),
            child: Stack(
              children: [
                // Top Yellow Banner
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: 175,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),

                // Main Content
                Column(
                  children: [
                    const SizedBox(height: 16),
                    Container(
                      height: 60,
                      width: 230,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: AssetImage('assets/nitte-nmamit-logo.jpg'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0.95, end: 1.0),
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeInOut,
                      builder: (context, scale, child) {
                        return Transform.scale(
                          scale: scale,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.7),
                                  blurRadius: 20,
                                  spreadRadius: 1,
                                )
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/Apoorva_poojary.jpg',
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Apoorva',
                      style: GoogleFonts.arsenal(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'College: NMAMIT',
                              style: GoogleFonts.arsenal(
                                fontSize: 13,
                                fontWeight: FontWeight.w900,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Course: MCA',
                              style: GoogleFonts.arsenal(
                                fontSize: 13,
                                fontWeight: FontWeight.w900,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'USN: $usn',
                              style: GoogleFonts.arsenal(
                                fontSize: 13,
                                fontWeight: FontWeight.w900,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: BarcodeWidget(
                        data: usn,
                        barcode: Barcode.code128(),
                        width: 160,
                        height: 50,
                        drawText: true,
                        style: GoogleFonts.arsenal(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'NMAMIT.2025',
                      style: GoogleFonts.arsenal(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey, // Light text color
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
