class Chat {
  final String name;
  final String? lastMessage;
  final String? image;
  final String time;
  final bool? isActive;

  Chat({
    required this.name,
    this.lastMessage,
    this.image,
    required this.time,
    this.isActive,
  });
}

List chatsData = <Chat>[
  Chat(
    name: "Jenny Glenn",
    lastMessage: "Hope you are doing well...",
    image: "assets/images/user.png",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "Ndam Lesly",
    lastMessage: "Hello Abdullah! I am...",
    image: "assets/images/user_2.png",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "Bright Efuet",
    lastMessage: "Do you have update...",
    image: "assets/images/user_3.png",
    time: "5d ago",
    isActive: false,
  ),
  Chat(
    name: "Njiki samsam",
    lastMessage: "You’re welcome :)",
    image: "assets/images/user_4.png",
    time: "5d ago",
    isActive: true,
  ),
  Chat(
    name: "Albert Boom",
    lastMessage: "Thanks",
    image: "assets/images/user_5.png",
    time: "6d ago",
    isActive: false,
  ),
  Chat(
    name: "Iclan client",
    lastMessage: "Hope you are doing well...",
    image: "assets/images/user.png",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "Ester Bright",
    lastMessage: "Hello fanny sup...",
    image: "assets/images/user_2.png",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "Tanze Thomas",
    lastMessage: "Do you have geography text book...",
    image: "assets/images/user_3.png",
    time: "5d ago",
    isActive: false,
  ),
];
