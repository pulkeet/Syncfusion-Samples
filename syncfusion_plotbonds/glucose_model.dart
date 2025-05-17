class GlucoseModel {
  final String measureDate;
  final double value;
  final String notes;
  final bool isManual;

  GlucoseModel({
    required this.measureDate,
    required this.value,
    required this.notes,
    required this.isManual,  
  });

  Map<String, dynamic> toMap() {
    return {
      'measureDate': measureDate,
      'value': value,
      'notes': notes,
      'isManual': isManual,
    };
  }

  factory GlucoseModel.fromMap(Map<String, dynamic> map) {
    return GlucoseModel(
      measureDate: map['measureDate'],
      value: map['value'],
      notes: map['notes'],
      isManual: map['isManual'] == 1, // Assuming 1 is true and 0 is false
    );
  }
}
