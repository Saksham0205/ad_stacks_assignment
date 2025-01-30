import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 250,
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        child: Stack(
                          children: [
                            Image.asset("assets/logo.png",height: 80,width: 180,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0xFFFFB020),
                            width: 2,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/avatar2.jpg'),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Pooja Mishra',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Color(0xFF7B61FF))
                        ),
                        child: Text(
                          'Admin',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(height: 1),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                    child: Column(
                      children: [
                        _buildMenuItem(Icons.home_filled, 'Home',
                            selected: true),
                        _buildMenuItem(Icons.people_outline, 'Employees'),
                        _buildMenuItem(Icons.checklist_outlined, 'Attendance'),
                        _buildMenuItem(Icons.assessment_outlined, 'Summary'),
                        _buildMenuItem(Icons.info_outline, 'Information'),
                        SizedBox(height: 12),
                        _buildWorkspaceItem('WORKSPACES'),
                        _buildWorkspaceItem('Adstacks', expanded: true),
                        _buildWorkspaceItem('Finance'),
                        Divider(height: 24),
                        _buildMenuItem(Icons.settings_outlined, 'Setting'),
                        _buildMenuItem(Icons.logout_outlined, 'Logout'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Main Content
          Expanded(
            child: Container(
              color: Colors.grey[100],
              child: Column(
                children: [
                  // Top Bar
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    color: Colors.grey[100],
                    child: Row(
                      children: [
                        Text(
                          'Home',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w200,
                            color: Colors.grey
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 350,
                          decoration: BoxDecoration(
                            color: Color(0xFF1F2937),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: 'Search',
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400]),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8,),
                              Icon(Icons.search, color: Colors.white, size: 20),
                            ],
                          ),
                        ),
                        SizedBox(width: 16),
                        Icon(Icons.edit_note_outlined),
                        SizedBox(width: 16),
                        Icon(Icons.notifications_outlined),
                        SizedBox(width: 16),
                        Icon(Icons.power_settings_new),
                        SizedBox(width: 16),
                        CircleAvatar(
                          backgroundImage:
                              AssetImage("iphone_avatar2.jpg"),
                          radius: 20,
                        ),
                      ],
                    ),
                  ),
                  // Main Content Area
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(24),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                _buildTopRatingCard(),
                                SizedBox(height: 24),
                                Row(
                                  children: [
                                    Expanded(child: _buildProjectsCard()),
                                    SizedBox(width: 24),
                                    Expanded(child: _buildCreatorsCard()),
                                  ],
                                ),
                                SizedBox(height: 24),
                                _buildPerformanceChart(),
                              ],
                            ),
                          ),
                          SizedBox(width: 24),
                          SizedBox(
                            width: 300,
                            child: Column(
                              children: [
                                _buildCalendarCard(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {bool selected = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: selected ? Color(0xFFEEF2FF) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: selected ? Colors.black87 : Colors.black54,
          size: 22,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: selected ? Colors.black87 : Colors.black54,
            fontSize: selected ? 17 : 15,
            fontWeight: selected ? FontWeight.bold : FontWeight.w500,
          ),
        ),
        dense: true,
        horizontalTitleGap: 8,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      ),
    );
  }

  Widget _buildWorkspaceItem(String title, {bool expanded = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title == 'WORKSPACES') ...[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Color(0xFFEEF2FF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.add, size: 20, color: Colors.black87),
              ],
            ),
          ),
        ] else
          ListTile(
            title: Text(
              title,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Icon(
              expanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
              color: Colors.black54,
              size: 20,
            ),
            dense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          ),
      ],
    );
  }

  Widget _buildTopRatingCard() {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF6C3CE9),
            Color(0xFFFF9B9B),
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -20,
            top: 20,
            child: _buildShape(
              height: 60,
              width: 120,
              color: Colors.blue.shade300,
              rotation: 0.2,
            ),
          ),
          Positioned(
            right: 40,
            bottom: 20,
            child: _buildShape(
              height: 80,
              width: 80,
              color: Colors.black87,
              shape: BoxShape.circle,
            ),
          ),
          Positioned(
            right: 100,
            top: 40,
            child: Transform.rotate(
              angle: 0.5,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.purple.shade800,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          Positioned(
            right: 20,
            top: 10,
            child: _buildShape(
              height: 40,
              width: 80,
              color: Colors.greenAccent,
              shape: BoxShape.rectangle,
              borderRadius: 20,
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ETHEREUM 2.0',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Top Rating\nProject',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Trending project and high rating\nProject Created by team.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1A1147),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Learn More.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShape({
    required double height,
    required double width,
    required Color color,
    BoxShape shape = BoxShape.rectangle,
    double borderRadius = 0,
    double rotation = 0,
  }) {
    return Transform.rotate(
      angle: rotation,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          shape: shape,
          borderRadius: shape == BoxShape.rectangle
              ? BorderRadius.circular(borderRadius)
              : null,
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(2, 2),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectsCard() {
    final List<Map<String, dynamic>> projects = [
      {
        'color': Color(0xFFDC4B5D),
        'icon': Image.asset('assets/blockchain1.jpg', width: 24, height: 24),
      },
      {
        'color': Color(0xFF1F2937),
        'icon': Image.asset('assets/blockchain2.jpg', width: 24, height: 24),
      },
      {
        'color': Color(0xFF1F2937),
        'icon': Image.asset('assets/blockchain3.jpg', width: 24, height: 24),
      },
    ];

    return Card(
      color: Color(0xFF121826),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        height: 350,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Projects',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: projects[index]['color'],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: projects[index]['icon'],
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Technology behind the Blockchain',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 2),
                              Row(
                                children: [
                                  Text(
                                    'Project #1',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    ' • ',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    'See project details',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.edit_outlined,
                          color: Colors.white,
                          size: 18,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCreatorsCard() {
    final List<Map<String, dynamic>> creators = [
      {
        'username': '@maddison_c21',
        'artworks': '9821',
        'avatar': 'assets/avatar1.jpg'
      },
      {
        'username': '@karl.will02',
        'artworks': '7032',
        'avatar': 'assets/avatar2.jpg'
      },
      {
        'username': '@maddison_c21',
        'artworks': '9821',
        'avatar': 'assets/avatar1.jpg'
      },
      {
        'username': '@maddison_c21',
        'artworks': '9821',
        'avatar': 'assets/avatar1.jpg'
      },
    ];

    return Card(
      color: Color(0xFF121826),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Top Creators',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 56),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(
                          color: Color(0xFF64748B),
                          fontSize: 14,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Artworks',
                        style: TextStyle(
                          color: Color(0xFF64748B),
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(width: 80),
                      Text(
                        'Rating',
                        style: TextStyle(
                          color: Color(0xFF64748B),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: creators.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(creators[index]['avatar']),
                        radius: 20,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              creators[index]['username'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            Text(
                              creators[index]['artworks'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(width: 60),
                            Container(
                              width: 64,
                              height: 4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: Color(0xFF121826),
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    width: 48,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      color: Color(0xFF7B61FF),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarCard() {
    return Card(
      color: Color(0xFF121826),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'GENERAL 10:00 AM TO 7:00 PM',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'OCT',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down, size: 18),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '2023',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down, size: 18),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Table(
                    children: [
                      TableRow(
                        children: ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su']
                            .map((day) => Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Text(
                                      day,
                                      style: TextStyle(
                                        color: Color(0xFF64748B),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                      ...List.generate(
                        6,
                        (weekIndex) => TableRow(
                          children: List.generate(
                            7,
                            (dayIndex) {
                              final day = weekIndex * 7 + dayIndex - 0;
                              final isSelected =
                                  day == 27 || day == 29 || day == 30;
                              final isCurrentMonth = day > 0 && day <= 31;
                              return Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? Color(0xFF7B61FF)
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Center(
                                      child: Text(
                                        isCurrentMonth ? day.toString() : '',
                                        style: TextStyle(
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.black87,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildEventCard(
              'Today Birthday',
              2,
              ['assets/iphone_avatar1.jpg', 'assets/iphone_avatar2.jpg'],
              'Birthday Wishing',
            ),
            SizedBox(height: 16),
            _buildEventCard(
              'Anniversary',
              3,
              [
                'assets/iphone_avatar1.jpg',
                'assets/iphone_avatar2.jpg',
                'assets/iphone_avatar2.jpg'
              ],
              'Anniversary Wishing',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventCard(
      String title, int total, List<String> avatars, String buttonText) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Color(0xFFFFD700), size: 16),
              SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.star, color: Color(0xFFFFD700), size: 16),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: avatars
                .map(
                  (avatar) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(avatar),
                      radius: 20,
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  color: Color(0xFF64748B),
                  fontSize: 14,
                ),
              ),
              SizedBox(width: 8),
              Text(
                total.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.send, size: 16),
            label: Text(
              buttonText,
              style: TextStyle(fontSize: 14),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF7B61FF),
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildPerformanceChart() {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Over All Performance',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                    Text(
                      'The Years',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    _buildLegendItem('Pending\nDone', Color(0xFFFF9B9B)),
                    SizedBox(width: 24),
                    _buildLegendItem('Project\nDone', Color(0xFF6B4EE8)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),
            SizedBox(
              height: 300,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: 10,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.grey[200],
                        strokeWidth: 1,
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 10,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) => Text(
                          '${value.toInt()}',
                          style: TextStyle(
                            color: Color(0xFF6B4EE8),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: (value, meta) {
                          final years = ['2015', '2016', '2017', '2018', '2019', '2020'];
                          return Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              years[value.toInt()],
                              style: TextStyle(
                                color: Color(0xFF6B4EE8),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  minX: 0,
                  maxX: 5,
                  minY: 0,
                  maxY: 50,
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 25),
                        FlSpot(1, 22),
                        FlSpot(2, 15),
                        FlSpot(3, 45),
                        FlSpot(4, 15),
                        FlSpot(5, 35),
                      ],
                      isCurved: true,
                      curveSmoothness: 0.35,
                      color: Color(0xFF6B4EE8),
                      barWidth: 2,
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) =>
                            FlDotCirclePainter(
                              radius: 4,
                              color: Colors.white,
                              strokeWidth: 2,
                              strokeColor: Color(0xFF6B4EE8),
                            ),
                      ),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF6B4EE8).withOpacity(0.2),
                            Color(0xFF6B4EE8).withOpacity(0.0),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 32),
                        FlSpot(1, 35),
                        FlSpot(2, 10),
                        FlSpot(3, 38),
                        FlSpot(4, 48),
                        FlSpot(5, 28),
                      ],
                      isCurved: true,
                      curveSmoothness: 0.35,
                      color: Color(0xFFFF9B9B),
                      barWidth: 2,
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) =>
                            FlDotCirclePainter(
                              radius: 4,
                              color: Colors.white,
                              strokeWidth: 2,
                              strokeColor: Color(0xFFFF9B9B),
                            ),
                      ),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFF9B9B).withOpacity(0.2),
                            Color(0xFFFF9B9B).withOpacity(0.0),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipColor: (LineBarSpot touchedSpot) => Color(0xFF7B61FF),
                      tooltipRoundedRadius: 8,
                      tooltipPadding: EdgeInsets.all(8),
                      getTooltipItems: (touchedSpots) {
                        return touchedSpots.map((touchedSpot) {
                          return LineTooltipItem(
                            '${touchedSpot.y.toInt()}',
                            TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: '\n2023',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          );
                        }).toList();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 8),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 12,
            height: 1.2,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
