import 'package:chat_app/core/theme.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages', style: Theme.of(context).textTheme.titleLarge),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'Recent',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Container(
            height: 100,
            padding: const EdgeInsets.all(5),
            //creating a horizontal scrolling section like in instagram
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildRecentContact('Arun', context),
                _buildRecentContact('Nishant', context),
                _buildRecentContact('Vivek', context),
                _buildRecentContact('Sharad', context),
                _buildRecentContact('Srijan', context),
                _buildRecentContact('Ujjwal', context),
                _buildRecentContact('Sumit sir', context)
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                color: DefaultColors.messageListPage,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: ListView(children: [
              _buildMessageTile('Arun', 'hii there', '22:30'),
              _buildMessageTile('Arun', 'hii there', '22:30'),
              _buildMessageTile('Arun', 'hii there', '22:30'),
              _buildMessageTile('Arun', 'hii there', '22:30'),
            ]),
          ))
        ],
      ),
    );
  }

//widget for recent chats
  Widget _buildRecentContact(String name, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                'https://imgs.search.brave.com/-O3o8tlYYSepjS1_UXpiLoxRv9G2YCL5rFVY358qGII/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly93d3cu/cG5nYWxsLmNvbS93/cC1jb250ZW50L3Vw/bG9hZHMvNS9Vc2Vy/LVByb2ZpbGUtUE5H/LUhpZ2gtUXVhbGl0/eS1JbWFnZS5wbmc'),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  //widget for individual chats
  Widget _buildMessageTile(String name, String message, String time) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      leading: const CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(
            'https://imgs.search.brave.com/-O3o8tlYYSepjS1_UXpiLoxRv9G2YCL5rFVY358qGII/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly93d3cu/cG5nYWxsLmNvbS93/cC1jb250ZW50L3Vw/bG9hZHMvNS9Vc2Vy/LVByb2ZpbGUtUE5H/LUhpZ2gtUXVhbGl0/eS1JbWFnZS5wbmc'),
      ),
      title: Text(
        name,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        message,
        style: const TextStyle(color: Colors.grey),
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        time,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
