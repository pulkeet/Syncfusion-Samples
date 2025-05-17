import 'package:syncfusion_sample/glucose_model.dart';

class GlucoseDummyData {
  static List<GlucoseModel> getDailySample() {
    return [
      
      GlucoseModel(
        measureDate: '2025-05-17 03:00',
        value: 40,
        notes: 'Late night',
        isManual: false,
      ),
      GlucoseModel(
        measureDate: '2025-05-17 04:00',
        value: 95,
        notes: 'Fasting',
        isManual: false,
      ),
      GlucoseModel(
        measureDate: '2025-05-17 07:30',
        value: 105,
        notes: 'Before breakfast',
        isManual: true,
      ),
      GlucoseModel(
        measureDate: '2025-05-17 08:30',
        value: 135,
        notes: 'After breakfast',
        isManual: false,
      ),
      GlucoseModel(
        measureDate: '2025-05-17 10:00',
        value: 120,
        notes: 'Mid-morning',
        isManual: true,
      ),
      GlucoseModel(
        measureDate: '2025-05-17 12:00',
        value: 110,
        notes: 'Before lunch',
        isManual: false,
      ),
      GlucoseModel(
        measureDate: '2025-05-17 13:30',
        value: 145,
        notes: 'After lunch',
        isManual: true,
      ),
      GlucoseModel(
        measureDate: '2025-05-17 15:00',
        value: 230,
        notes: 'Afternoon',
        isManual: false,
      ),
      GlucoseModel(
        measureDate: '2025-05-17 17:00',
        value: 275,
        notes: 'Pre-snack',
        isManual: true,
      ),
      GlucoseModel(
        measureDate: '2025-05-17 18:00',
        value: 140,
        notes: 'After snack',
        isManual: false,
      ),
      GlucoseModel(
        measureDate: '2025-05-17 19:30',
        value: 225,
        notes: 'Before dinner',
        isManual: true,
      ),
      GlucoseModel(
        measureDate: '2025-05-17 21:00',
        value: 250,
        notes: 'After dinner',
        isManual: false,
      ),
      GlucoseModel(
        measureDate: '2025-05-17 22:30',
        value: 110,
        notes: 'Before bed',
        isManual: true,
      ),
      GlucoseModel(
        measureDate: '2025-05-17 23:00',
        value: 70,
        notes: 'Midnight',
        isManual: false,
      )
    ];
  }
}
