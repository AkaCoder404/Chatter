class Chat {
  final String name, lastMessage, image, time;
  final bool isActive;

  Chat({
    this.name = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    this.isActive = false,
  });
}

List chatsData = [
  Chat(
    name: "Aka Coder",
    lastMessage: "Hope you are doing well...",
    image: "assets/images/OLP.png",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "Aka Coder 1",
    lastMessage: "Hello, I am...",
    image: "assets/images/OLP.png",
    time: "8m ago",
    isActive: true,
  ),
];
