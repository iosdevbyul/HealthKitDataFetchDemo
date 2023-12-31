//
//  DummyData.swift
//  HKTest
//
//  Created by PNT001 on 2023/10/13.
//

import Foundation
import HealthKit

let HKQuantityTypeIdentifierTitles:[HKQuantityTypeIdentifier] = [
    .bodyMass,
    .bodyMassIndex,
    .bodyFatPercentage,
    .height,
    .leanBodyMass,
    .waistCircumference,
    .appleSleepingWristTemperature,
    
    //Fitness
    .stepCount,
    .distanceWalkingRunning,
    .distanceCycling,
    .distanceWheelchair,
    .basalEnergyBurned,
    .activeEnergyBurned,
    .flightsClimbed,
    .nikeFuel,
    .appleExerciseTime,
    .pushCount,
    .distanceSwimming,
    .swimmingStrokeCount,
    .vo2Max,
    .distanceDownhillSnowSports,
    .appleStandTime,
    .walkingSpeed,
    .walkingDoubleSupportPercentage,
    .walkingAsymmetryPercentage,
    .walkingStepLength,
    .sixMinuteWalkTestDistance,
    .stairAscentSpeed,
    .stairDescentSpeed,
    .appleMoveTime,
    .appleWalkingSteadiness,
    .runningStrideLength,
    .runningVerticalOscillation,
    .runningGroundContactTime,
    .runningPower,
    .runningSpeed,
    
    //Vitals
    .heartRate,
    .bodyTemperature,
    .basalBodyTemperature,
    .bloodPressureSystolic,
    .bloodPressureDiastolic,
    .respiratoryRate,
    .restingHeartRate,
    .walkingHeartRateAverage,
    .heartRateVariabilitySDNN,
    .heartRateRecoveryOneMinute,
    
    //Results
    .oxygenSaturation,
    .peripheralPerfusionIndex,
    .bloodGlucose,
    .numberOfTimesFallen,
    .electrodermalActivity,
    .inhalerUsage,
    .insulinDelivery,
    .bloodAlcoholContent,
    .forcedVitalCapacity,
    .forcedExpiratoryVolume1,
    .peakExpiratoryFlowRate,
    .environmentalAudioExposure,
    .headphoneAudioExposure,
    .numberOfAlcoholicBeverages,
    
    // Nutrition
    .dietaryFatTotal,
    .dietaryFatPolyunsaturated,
    .dietaryFatMonounsaturated,
    .dietaryFatSaturated,
    .dietaryCholesterol,
    .dietarySodium,
    .dietaryCarbohydrates,
    .dietaryFiber,
    .dietarySugar,
    .dietaryEnergyConsumed,
    .dietaryProtein,
    .dietaryVitaminA,
    .dietaryVitaminB6,
    .dietaryVitaminB12,
    .dietaryVitaminC,
    .dietaryVitaminD,
    .dietaryVitaminE,
    .dietaryVitaminK,
    .dietaryCalcium,
    .dietaryIron,
    .dietaryThiamin,
    .dietaryRiboflavin,
    .dietaryNiacin,
    .dietaryFolate,
    .dietaryBiotin,
    .dietaryPantothenicAcid,
    .dietaryPhosphorus,
    .dietaryIodine,
    .dietaryMagnesium,
    .dietaryZinc,
    .dietarySelenium,
    .dietaryCopper,
    .dietaryManganese,
    .dietaryChromium,
    .dietaryMolybdenum,
    .dietaryChloride,
    .dietaryPotassium,
    .dietaryCaffeine,
    .dietaryWater,
    .uvExposure,
    .atrialFibrillationBurden,
    .underwaterDepth,
    .waterTemperature
]

let HKCategoryTypeIdentifierTitles: [HKCategoryTypeIdentifier] = [
    .sleepAnalysis,
    .appleStandHour,
    .cervicalMucusQuality,
    .ovulationTestResult,
    .pregnancyTestResult,
    .progesteroneTestResult,
    .menstrualFlow,
    .intermenstrualBleeding,
    .persistentIntermenstrualBleeding,
    .prolongedMenstrualPeriods,
    .irregularMenstrualCycles,
    .infrequentMenstrualCycles,
    .sexualActivity,
    .mindfulSession,
    .highHeartRateEvent,
    .lowHeartRateEvent,
    .irregularHeartRhythmEvent,
    .toothbrushingEvent,
    .pregnancy,
    .lactation,
    .contraceptive,
    .environmentalAudioExposureEvent,
    .headphoneAudioExposureEvent,
    .handwashingEvent,
    .lowCardioFitnessEvent,
    .appleWalkingSteadinessEvent,
    
    // Symptoms
    .abdominalCramps,
    .acne,
    .appetiteChanges,
    .bladderIncontinence,
    .bloating,
    .breastPain,
    .chestTightnessOrPain,
    .chills,
    .constipation,
    .coughing,
    .diarrhea,
    .dizziness,
    .drySkin,
    .fainting,
    .fatigue,
    .fever,
    .generalizedBodyAche,
    .hairLoss,
    .headache,
    .heartburn,
    .hotFlashes,
    .lossOfSmell,
    .lossOfTaste,
    .lowerBackPain,
    .memoryLapse,
    .moodChanges,
    .nausea,
    .nightSweats,
    .pelvicPain,
    .rapidPoundingOrFlutteringHeartbeat,
    .runnyNose,
    .shortnessOfBreath,
    .sinusCongestion,
    .skippedHeartbeat,
    .sleepChanges,
    .soreThroat,
    .vaginalDryness,
    .vomiting,
    .wheezing,
]

let HKCharacteristicTypeIdentifierTitles: [HKCharacteristicTypeIdentifier] = [
    .activityMoveMode,
    .biologicalSex,
    .bloodType,
    .dateOfBirth,
    .fitzpatrickSkinType,
    .wheelchairUse
]
