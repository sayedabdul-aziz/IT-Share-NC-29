class OnBoardingModel {
  final String image;
  final String title;
  final String desc;

  OnBoardingModel(
      {required this.image, required this.title, required this.desc});
}

List<OnBoardingModel> model = [
  OnBoardingModel(
      image: 'assets/on1.svg',
      title: 'ابحث عن دكتور متخصص',
      desc:
          'اكتشف مجموعة واسعة من الأطباء الخبراء والمتخصصين في مختلف المجالات.'),
  OnBoardingModel(
      image: 'assets/on2.svg',
      title: 'سهولة الحجز',
      desc: 'احجز المواعيد بضغطة زرار في أي وقت وفي أي مكان.'),
  OnBoardingModel(
      image: 'assets/on3.svg',
      title: 'آمن وسري',
      desc: 'كن مطمئنًا لأن خصوصيتك وأمانك هما أهم أولوياتنا.')
];
