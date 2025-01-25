class Listtile {
  final String title;
  final String leading;
  final String trailing;
  Listtile(
      {required this.leading, required this.title, required this.trailing});
}

List<Listtile> count = [
  Listtile(
      leading: 'assets/Icons/Location.png',
      title: 'Business Location',
      trailing: 'assets/Icons/Arrow - Right 2.png'),
  Listtile(
      leading: 'assets/Icons/Work.png',
      title: 'Bookings',
      trailing: 'assets/Icons/Arrow - Right 2.png'),
  Listtile(
      leading: 'assets/Icons/Wallet.png',
      title: 'My Services',
      trailing: 'assets/Icons/Arrow - Right 2.png'),
];
