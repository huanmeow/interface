
import 'package:flutter/material.dart';

class TaiXiuScreen extends StatefulWidget {
  const TaiXiuScreen({super.key});

  @override
  _TaiXiuScreenState createState() => _TaiXiuScreenState();
}

class _TaiXiuScreenState extends State<TaiXiuScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tài Xỉu'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Nạp Tiền'),
            Tab(text: 'Rút Tiền'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildDepositTab(),
          _buildWithdrawTab(),
        ],
      ),
    );
  }

  Widget _buildDepositTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nạp Tiền',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              labelText: 'Số Tiền Nạp',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Xử lý nạp tiền ở đây
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Thông Báo'),
                  content: Text('Nạp tiền thành công!'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: Text('Xác Nhận Nạp Tiền'),
          ),
        ],
      ),
    );
  }

  Widget _buildWithdrawTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rút Tiền',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              labelText: 'Số Tài Khoản Ngân Hàng',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              labelText: 'Số Tiền Rút',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Xử lý rút tiền ở đây
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Thông Báo'),
                  content: Text('Rút tiền thành công!'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: Text('Xác Nhận Rút Tiền'),
          ),
        ],
      ),
    );
  }
}