import 'package:flutter/material.dart';

class AttentionPage extends StatelessWidget {
  const AttentionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chú ý khi sử dụng ứng dụng'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AttentionItem(
              title: 'Chức Năng Ứng Dụng',
              content:
              'Ứng dụng này được thiết kế để giúp nhân viên nhận các nhiệm vụ và báo cáo tình hình tài sản của công ty. Hãy sử dụng nó để nắm bắt và quản lý công việc của bạn.',
            ),
            const Divider(),
            AttentionItem(
              title: 'Bảo Mật Thông Tin',
              content:
              'Chúng tôi cam kết bảo mật thông tin cá nhân của bạn. Không chia sẻ thông tin đăng nhập hoặc dữ liệu công việc của bạn với bất kỳ ai khác.',
            ),
            const Divider(),
            AttentionItem(
              title: 'Điều Khoản Sử Dụng',
              content:
              'Trước khi sử dụng ứng dụng, bạn cần đọc và đồng ý với Điều khoản sử dụng. Điều khoản này quy định các quyền và trách nhiệm của bạn khi sử dụng ứng dụng của chúng tôi.',
            ),
            const Divider(),
            AttentionItem(
              title: 'Liên hệ',
              content:
              'Nếu bạn có bất kỳ câu hỏi hoặc phản hồi nào về ứng dụng hoặc về các vấn đề liên quan đến bảo mật và quyền riêng tư, hãy liên hệ với chúng tôi qua địa chỉ email hoặc số điện thoại được cung cấp trong ứng dụng.',
            ),
          ],
        ),
      ),
    );
  }
}

class AttentionItem extends StatelessWidget {
  final String title;
  final String content;

  AttentionItem({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          content,
          style: const TextStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}