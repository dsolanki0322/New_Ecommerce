class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "When you say it, it’s marketing. When your customer says it, it’s social proof.",
    image: "assets/images/shopping.png",
    desc: "",
  ),
  OnboardingContents(
    title: "Your most unhappy customers are your greatest source of learning.",
    image: "assets/images/online-shop.png",
    desc: "",
  ),
  OnboardingContents(
    title: "Amazing things will happen when you listen to the consumer.",
    image: "assets/images/ecommerce (1).png",
    desc: "",
  ),
];
