import 'package:flutter/material.dart';
import 'package:newmedicob/presentation/Homepage/model/healthTipModel.dart';

class FetchHealthTipProvider with ChangeNotifier {
  List<HealthTipModel> get health_TipsList => [
        HealthTipModel(
          title: "Prioritize Protein",
          daysAgo: 2,
          description:
              "Include lean protein sources like chicken, fish, beans, and tofu in your meals.",
          imageUrl: "https://example.com/protein.jpg",
        ),
        HealthTipModel(
          title: "Limit Processed Foods",
          daysAgo: 4,
          description:
              "Reduce consumption of processed foods high in unhealthy fats, sodium, and added sugars.",
          imageUrl: "https://example.com/processed_foods.jpg",
        ),
        HealthTipModel(
          title: "Get Regular Checkups",
          daysAgo: 1,
          description:
              "Schedule routine checkups and screenings to monitor your overall health.",
          imageUrl: "https://example.com/checkups.jpg",
        ),
        HealthTipModel(
          title: "Practice Mindfulness",
          daysAgo: 5,
          description:
              "Improve mental well-being through mindfulness techniques like meditation and deep breathing.",
          imageUrl: "https://example.com/mindfulness.jpg",
        ),
        HealthTipModel(
          title: "Set Realistic Goals",
          daysAgo: 3,
          description:
              "Create achievable health goals and track your progress for motivation.",
          imageUrl: "https://example.com/goals.jpg",
        ),
        HealthTipModel(
          title: "Stay Hydrated",
          daysAgo: 7,
          description:
              "Drink plenty of water throughout the day to maintain hydration and overall health.",
          imageUrl: "https://example.com/hydration.jpg",
        ),
        HealthTipModel(
          title: "Get Enough Sleep",
          daysAgo: 6,
          description:
              "Aim for 7-9 hours of quality sleep each night to support your body's recovery and overall well-being.",
          imageUrl: "https://example.com/sleep.jpg",
        ),
        HealthTipModel(
          title: "Exercise Regularly",
          daysAgo: 8,
          description:
              "Engage in regular physical activity, such as walking, running, or strength training, to improve fitness.",
          imageUrl: "https://example.com/exercise.jpg",
        ),
        HealthTipModel(
          title: "Eat a Balanced Diet",
          daysAgo: 9,
          description:
              "Focus on a balanced diet rich in fruits, vegetables, whole grains, and healthy fats.",
          imageUrl: "https://example.com/balanced_diet.jpg",
        ),
        HealthTipModel(
          title: "Practice Good Posture",
          daysAgo: 10,
          description:
              "Maintain good posture to reduce strain on your body and improve overall health.",
          imageUrl: "https://example.com/posture.jpg",
        ),
        HealthTipModel(
          title: "Reduce Stress",
          daysAgo: 11,
          description:
              "Incorporate stress-reducing activities like yoga, meditation, or hobbies into your daily routine.",
          imageUrl: "https://example.com/stress_reduction.jpg",
        ),
        HealthTipModel(
          title: "Avoid Smoking",
          daysAgo: 12,
          description:
              "Avoid smoking and exposure to secondhand smoke to reduce the risk of various health issues.",
          imageUrl: "https://example.com/no_smoking.jpg",
        ),
        HealthTipModel(
          title: "Moderate Alcohol Consumption",
          daysAgo: 13,
          description:
              "If you drink alcohol, do so in moderation and be mindful of its effects on your health.",
          imageUrl: "https://example.com/alcohol_moderation.jpg",
        ),
        HealthTipModel(
          title: "Practice Safe Sun Exposure",
          daysAgo: 14,
          description:
              "Protect your skin from harmful UV rays by wearing sunscreen, hats, and protective clothing.",
          imageUrl: "https://example.com/sun_protection.jpg",
        ),
        HealthTipModel(
          title: "Maintain Social Connections",
          daysAgo: 15,
          description:
              "Build and maintain strong social connections for mental and emotional well-being.",
          imageUrl: "https://example.com/social_connections.jpg",
        ),
        HealthTipModel(
          title: "Stay Mentally Active",
          daysAgo: 16,
          description:
              "Engage in activities that challenge your mind, such as reading, puzzles, or learning new skills.",
          imageUrl: "https://example.com/mental_activity.jpg",
        ),
        HealthTipModel(
          title: "Limit Screen Time",
          daysAgo: 17,
          description:
              "Reduce excessive screen time and take regular breaks to prevent eye strain and improve overall health.",
          imageUrl: "https://example.com/screen_time.jpg",
        ),
        HealthTipModel(
          title: "Eat Mindfully",
          daysAgo: 18,
          description:
              "Practice mindful eating by paying attention to hunger cues and enjoying meals without distractions.",
          imageUrl: "https://example.com/mindful_eating.jpg",
        ),
        HealthTipModel(
          title: "Keep a Healthy Weight",
          daysAgo: 19,
          description:
              "Maintain a healthy weight through a balanced diet and regular exercise.",
          imageUrl: "https://example.com/healthy_weight.jpg",
        ),
        HealthTipModel(
          title: "Wash Hands Regularly",
          daysAgo: 20,
          description:
              "Wash your hands regularly with soap and water to prevent the spread of germs and illness.",
          imageUrl: "https://example.com/hand_washing.jpg",
        ),
      ];
}
