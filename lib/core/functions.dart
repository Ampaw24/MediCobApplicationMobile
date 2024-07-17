
//Interprete bmi's 
String interpretBMI(double bmi) {
  if (bmi < 18.5) {
    return 'Underweight';
  } else if (bmi >= 18.5 && bmi < 24.9) {
    return 'Normal weight';
  } else if (bmi >= 25 && bmi < 29.9) {
    return 'Overweight';
  } else if (bmi >= 30) {
    return 'Obesity';
  } else {
    return 'Invalid BMI';
  }
}