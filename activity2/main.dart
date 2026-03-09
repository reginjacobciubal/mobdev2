import 'package:flutter/material.dart';

void main() {
  runApp(const StudentProfileApp());
}

class StudentProfileApp extends StatelessWidget {
  const StudentProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MobDev Assignment',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F2F7),
      appBar: AppBar(
        title: const Text(
          'Mobile Development 2',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 3, 10, 94),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Column(
            children: [
              // 1. MY PROFILE HEADER (PURPLE) - From your screenshot
              const InfoCard(
                cardColor: Color.fromARGB(255, 46, 60, 138),
                title: 'My Profile',
                subtitle: 'Student Information Card',
                isHeader: true,
                details: [],
              ),
              const SizedBox(height: 12),

              // 2. PROFILE PHOTO (RED) - Now moved to the top
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFC62828), 
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Column(
                  children: [
                    const Text('Profile Photo', 
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 15),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/ArtApp_Magazine.png',
                        height: 685,
                        width: 620,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => 
                          const Icon(Icons.person, size: 100, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // 3. PERSONAL DETAILS (RED)
              const InfoCard(
                cardColor: Color.fromARGB(255, 172, 17, 17),
                title: 'Personal Details',
                details: [
                  'Full Name: Ciubal, Regin Jacob',
                  'Nickname: RJ',
                  'Birthday: July 12, 2005',
                  'Age: 20',
                  'Gender: Male',
                  'Address: San Fernando City, La Union',
                ],
              ),
              const SizedBox(height: 12),

              // 4. ACADEMIC INFORMATION (GREEN)
              const InfoCard(
                cardColor: Color(0xFF2E7D32),
                title: 'Academic Information',
                details: [
                  'School: Lorma Colleges',
                  'Course: BSIT',
                  'Year & Section: MobDev',
                  'Student No.: 2402414',
                  'Subject: Mobile Development 2',
                  'Instructor: Daddy',
                ],
              ),
              const SizedBox(height: 12),

              // 5. MY FAVORITES (BLUE)
              const InfoCard(
                cardColor: Color(0xFF1976D2),
                title: 'My Favorites',
                details: [
                  'Color: kakki',
                  'Food: letchon',
                  'Movie: Pinoy Action',
                  'Music: Tatsulok',
                  'Sport: Badminton',
                  'Hobby: Playing online games',
                ],
              ),
              const SizedBox(height: 12),

              // 6. FUN FACTS (BROWN)
              const InfoCard(
                cardColor: Color.fromARGB(255, 180, 93, 62),
                title: 'Fun Facts About Me',
                details: [
                  'Skill: Graphic Designer',
                  'Dream Job: Technician',
                  'Quote: Practice, Learn',
                ],
              ),
              const SizedBox(height: 20),

              // 7. DEVELOPER INFO (NAVY BLUE)
              const InfoCard(
                cardColor: Color.fromARGB(255, 0, 0, 128),
                title: 'Developer Info',
                details: [
                  'Name: Regin Jacob Ciubal',
                  'Email: reginciubal23@gmail.com',
                  'Contact: 09564819789',
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final Color cardColor;
  final String title;
  final String? subtitle;
  final List<String> details;
  final bool isHeader;

  const InfoCard({
    super.key,
    required this.cardColor,
    required this.title,
    required this.details,
    this.subtitle,
    this.isHeader = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: isHeader ? 32 : 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 5),
            Text(subtitle!, style: const TextStyle(color: Colors.white70, fontSize: 16)),
          ],
          if (details.isNotEmpty) ...[
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: details.map((detail) => Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(
                  detail,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              )).toList(),
            ),
          ],
        ],
      ),
    );
  }
}