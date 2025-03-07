// home.dart
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4ECDC4),
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar and Profile
            _buildSearchAndProfile(),
            
            // Main Content (White Container)
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: const MainContent(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF4ECDC4),
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (index) {
          // Tambahkan fungsi navigasi untuk bottom bar di sini nanti
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, size: 40),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget _buildSearchAndProfile() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Help others ...',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                // Fungsi untuk tombol profile akan ditambahkan di sini nanti
              },
              borderRadius: BorderRadius.circular(25),
              splashColor: const Color(0xFF4ECDC4).withOpacity(0.3),
              highlightColor: const Color(0xFF4ECDC4).withOpacity(0.1),
              child: Ink(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Icon(
                  Icons.person,
                  color: Color(0xFF4ECDC4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: const [
        // Spotlight Section
        Text(
          'Category',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        
        // Categories
        CategoryRow(),
        SizedBox(height: 20),
        
        // Donation Balance - now using the updated widget with a parameter
        DonationBalanceCard(balance: 200000), // You can change this value as needed
        SizedBox(height: 30),
        
        // Latest Campaign
        Text(
          'Latest Campaign',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        
        // Campaign Cards
        LatestCampaigns(),
        SizedBox(height: 30),
        
        // Finished Campaigns
        Text(
          'Finished Campaign',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        
        // Finished Campaign Cards - horizontal layout
        FinishedCampaignsHorizontal(),
      ],
    );
  }
}

class CategoryRow extends StatelessWidget {
  const CategoryRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildCategoryIcon(Icons.home_work, Colors.grey),
        _buildCategoryIcon(Icons.medical_services, Colors.red),
        _buildCategoryIcon(Icons.local_fire_department, Colors.orange),
        _buildCategoryIcon(Icons.volunteer_activism, Colors.brown),
      ],
    );
  }

  Widget _buildCategoryIcon(IconData icon, Color color) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // Fungsi untuk kategori akan ditambahkan di sini nanti
        },
        borderRadius: BorderRadius.circular(30), // Untuk efek splash yang bulat
        splashColor: const Color(0xFF4ECDC4).withOpacity(0.3),
        highlightColor: const Color(0xFF4ECDC4).withOpacity(0.1),
        child: Ink(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade300),
            color: Colors.white,
          ),
          child: Icon(
            icon,
            color: color,
            size: 30,
          ),
        ),
      ),
    );
  }
}

class DonationBalanceCard extends StatelessWidget {
  final double balance;
  
  const DonationBalanceCard({
    super.key, 
    this.balance = 200000, // Default value as dummy data
  });

  @override
  Widget build(BuildContext context) {
    // Format the balance with thousand separators
    final formattedBalance = _formatCurrency(balance);
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Donation balance :',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Rp. $formattedBalance',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
          _buildActionButton(Icons.add, 'Top up'),
          const SizedBox(width: 16),
          _buildActionButton(Icons.history, 'History'),
        ],
      ),
    );
  }

  // Format currency with thousand separators
  String _formatCurrency(double amount) {
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String Function(Match) mathFunc = (Match match) => '${match[1]}.';
    
    // Convert to string and format with thousand separators
    return amount.toStringAsFixed(0).replaceAllMapped(reg, mathFunc);
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              // Fungsi untuk tombol akan ditambahkan di sini nanti
            },
            borderRadius: BorderRadius.circular(20),
            splashColor: Colors.white.withOpacity(0.5),
            highlightColor: Colors.white.withOpacity(0.3),
            child: Ink(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF4ECDC4),
              ),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class LatestCampaigns extends StatelessWidget {
  const LatestCampaigns({super.key});

  @override
  Widget build(BuildContext context) {
    final campaigns = [
      {
        'title': 'Bantu muslim indonesia ke mekkah.',
        'organization': 'Bantubarengan',
        'amount': 'Rp 24.000.000',
        'icon': Icons.mosque,
        'progress': 0.75,
      },
      {
        'title': 'Bantu warga pelosok untuk makan siang.',
        'organization': 'Social project',
        'amount': 'Rp 50.000.000',
        'icon': Icons.restaurant,
        'progress': 0.6,
      },
      {
        'title': 'Bantu anak bangsa tersenyum',
        'organization': 'Anak bangsa',
        'amount': 'Rp 90.000.000',
        'icon': Icons.child_care,
        'progress': 0.85,
      },
    ];

    return SizedBox(
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: campaigns.length,
        itemBuilder: (context, index) {
          final campaign = campaigns[index];
          return CampaignCard(
            title: campaign['title'] as String,
            organization: campaign['organization'] as String,
            amount: campaign['amount'] as String,
            icon: campaign['icon'] as IconData,
            progress: campaign['progress'] as double,
            margin: EdgeInsets.only(
              right: index < campaigns.length - 1 ? 16 : 0,
            ),
          );
        },
      ),
    );
  }
}

class CampaignCard extends StatelessWidget {
  final String title;
  final String organization;
  final String amount;
  final IconData icon;
  final double progress;
  final EdgeInsets margin;

  const CampaignCard({
    super.key,
    required this.title,
    required this.organization,
    required this.amount,
    required this.icon,
    required this.progress,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      margin: margin,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Fungsi untuk campaign card akan ditambahkan di sini nanti
          },
          borderRadius: BorderRadius.circular(10),
          splashColor: const Color(0xFF4ECDC4).withOpacity(0.2),
          highlightColor: const Color(0xFF4ECDC4).withOpacity(0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image placeholder
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Icon(
                    icon,
                    size: 50,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          organization,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.check_circle,
                          color: Color(0xFF4ECDC4),
                          size: 16,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: progress,
                        backgroundColor: Colors.grey.shade200,
                        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF4ECDC4)),
                        minHeight: 10,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Collected $amount',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Separate model class for finished campaigns
class FinishedCampaignModel {
  final String id;
  final String title;
  final IconData icon;
  final String date;
  final String totalDonation;

  const FinishedCampaignModel({
    required this.id,
    required this.title,
    required this.icon,
    required this.date,
    required this.totalDonation,
  });
}

// Separate data source for finished campaigns
class FinishedCampaignDataSource {
  // This is dummy data
  static List<FinishedCampaignModel> getFinishedCampaigns() {
    return [
      FinishedCampaignModel(
        id: 'fc001',
        title: 'Bantu masyarakat terdampak banjir di Lampung',
        icon: Icons.flood,
        date: '20 Feb 2025',
        totalDonation: 'Rp 75.000.000',
      ),
      FinishedCampaignModel(
        id: 'fc002',
        title: 'Bantu Masyarakat terdampak gempa bumi di Padang',
        icon: Icons.landscape,
        date: '15 Jan 2025',
        totalDonation: 'Rp 120.000.000',
      ),
      FinishedCampaignModel(
        id: 'fc003',
        title: 'Bantuan makanan dan minuman untuk penderita tanggera',
        icon: Icons.food_bank,
        date: '05 Jan 2025',
        totalDonation: 'Rp 45.000.000',
      ),
    ];
  }
}

// Updated horizontal layout for finished campaigns
class FinishedCampaignsHorizontal extends StatelessWidget {
  const FinishedCampaignsHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    // Get finished campaigns from separate data source
    final campaigns = FinishedCampaignDataSource.getFinishedCampaigns();

    return SizedBox(
      height: 144, // Height for horizontal cards
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: campaigns.length,
        itemBuilder: (context, index) {
          final campaign = campaigns[index];
          return FinishedCampaignCard(
            campaign: campaign,
            margin: EdgeInsets.only(
              right: index < campaigns.length - 1 ? 16 : 0,
            ),
          );
        },
      ),
    );
  }
}

class FinishedCampaignCard extends StatelessWidget {
  final FinishedCampaignModel campaign;
  final EdgeInsets margin;

  const FinishedCampaignCard({
    super.key,
    required this.campaign,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // Width for horizontal card
      margin: margin,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // Fungsi untuk finished campaign card akan ditambahkan di sini nanti
          },
          borderRadius: BorderRadius.circular(10),
          splashColor: const Color(0xFF4ECDC4).withOpacity(0.2),
          highlightColor: const Color(0xFF4ECDC4).withOpacity(0.1),
          child: Row(
            children: [
              // Image placeholder
              Container(
                width: 100,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Icon(
                    campaign.icon,
                    size: 40,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        campaign.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Text(
                            'Selesai pada ${campaign.date}',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Total terkumpul: ${campaign.totalDonation}',
                        style: const TextStyle(
                          color: Color(0xFF4ECDC4),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
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
    );
  }
}