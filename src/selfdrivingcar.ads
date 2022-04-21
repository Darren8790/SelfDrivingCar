package selfDrivingCar with SPARK_Mode is

   type Car is (On, Off);
   type Parking is (Parked, Unparked);
   type ChargeLevel is range 1..100;
   type Speed is range 1..100;
   type Object is (Detected, Undeteced);
   
   procedure turnOnCar return Boolean is
      
   procedure minimumCharge;
   procedure lowCharge;
   procedure speedLimit;
   procedure changeGear;
   procedure objectDetection;
   procedure diagnosticMode;

end selfDrivingCar;
