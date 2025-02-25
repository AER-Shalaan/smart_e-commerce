import 'package:flutter/material.dart';

import '../model/f_a_q.dart';

class FAQProvider extends ChangeNotifier {
  List<FAQ> allFaqs = [
    FAQ(
        question: "How do I make a purchase?",
        answer:
            "When you find a product you want to purchase, tap on it to view the product details. Check the price, description, and available options (if applicable), and then tap the \"Add to Cart\" button. Follow the on-screen instructions to complete the purchase, including providing shipping details and payment information."),
    FAQ(
        question: "What payment methods are accepted?",
        answer:
            "We accept various payment methods including credit/debit cards, PayPal, and Apple Pay. Additional options may be available depending on your location."),
    FAQ(
        question: "How do I track my orders?",
        answer:
            "Once your order is shipped, you will receive a tracking number via email. You can also track your order from the 'My Orders' section in your account."),
    FAQ(
        question: "Can I cancel or return an order?",
        answer:
            "Yes, orders can be canceled before they are shipped. If you want to return an order, please check our return policy for eligibility and process details."),
    FAQ(
        question: "How can I contact customer support for assistance?",
        answer:
            "You can reach our customer support team via email, live chat, or by calling our hotline. Our team is available 24/7 to assist you."),
    FAQ(
        question: "How does the recommendation system work?",
        answer:
            "Our AI-powered recommendation system suggests products based on your browsing history, past purchases, and interactions. You will receive personalized notifications about new arrivals and special discounts on your favorite items."),
    FAQ(
        question: "Can I upload multiple products as a seller?",
        answer:
            "Yes! Sellers can upload multiple products at once using a customized Excel sheet. Our system will verify the data and provide feedback before listing the products."),
    FAQ(
        question: "What is the AI verification for product listings?",
        answer:
            "Our platform uses AI to review product listings before they go live. This ensures accurate descriptions, appropriate language, and compliance with our marketplace policies."),
    FAQ(
        question: "How does the product comparison feature work?",
        answer:
            "Our comparison tool allows you to compare products from the same category. You can add multiple products and view a detailed side-by-side comparison, including specifications, features, and images."),
    FAQ(
        question: "Is my personal data safe?",
        answer:
            "Yes! We prioritize user privacy and only use your data to enhance your shopping experience. We do not share your information with third parties without your consent."),
    FAQ(
        question: "Can I save my favorite products for later?",
        answer:
            "Yes! You can add products to your wishlist to easily find them later. Access your wishlist from your account anytime."),
    FAQ(
        question: "How do I apply discount codes?",
        answer:
            "During checkout, you can enter a valid discount code in the provided field. If the code is applicable, the discount will be applied automatically."),
    FAQ(
        question: "What should I do if I receive a damaged product?",
        answer:
            "If you receive a damaged or defective product, contact our support team immediately. We will guide you through the return and replacement process."),
    FAQ(
        question: "Does Smart E-Commerce offer international shipping?",
        answer:
            "Yes, we offer international shipping to select locations. Shipping costs and delivery times vary based on your location."),
  ];

  List<FAQ> filteredFaqs = [];

  FAQProvider() {
    filteredFaqs = allFaqs;
  }

  void toggleFAQ(int index) {
    filteredFaqs[index].isExpanded = !filteredFaqs[index].isExpanded;
    notifyListeners();
  }

  void filterFAQs(String query) {
    if (query.isEmpty) {
      filteredFaqs = allFaqs;
    } else {
      filteredFaqs = allFaqs
          .where(
              (faq) => faq.question.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
