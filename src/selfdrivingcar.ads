package selfDrivingCar with SPARK_Mode is

   type OnOff is (On, Off);
   type Gearbox is (Parked, Drive, Reversed);
   type ChargeLevel is range 0..100;   
   type CarSpeed is range 0..100;
   type Object is (Detected, Undeteced);
   type DiagnosticMode is (On, Off);
   --  type Moving is (No, Yes);
   type ChargeState is (Low, Ok, Max);  
   type TrafficLight is (Red, Amber, Green);
   
   type Car is record
      gear : Gearbox;
      switch : OnOff;
      battery : ChargeLevel;
      speed : CarSpeed;
      sensor : Object;
      diagnostic : DiagnosticMode;
      --  move : Moving;
      charge : ChargeState;
      signal : TrafficLight;
   end record;
   
   TheCar : Car := (gear => Parked, switch => Off, battery => 0,
                    speed => 0, sensor => Undeteced, diagnostic => Off,
                   charge => Max, signal => Red);
   
   function minimumCharge return Boolean
   is
     (TheCar.battery = 10);
   
   function speedLimit return Boolean
   is
     (TheCar.speed <= 60 and TheCar.speed >= 0);
   
   procedure turnOnCar with
     Global => (In_Out => TheCar),
     Pre => TheCar.gear = Parked and TheCar.switch = Off,
     Post => TheCar.switch = On;
   
   procedure driveCar with
     Global => (In_Out => TheCar),
     Pre => minimumCharge and TheCar.speed < 100,
     Post => minimumCharge and TheCar.speed >= 1;
   
   procedure increaseSpeed with
     Global => (In_Out => TheCar),
     Pre => TheCar.speed = 2,
     Post => speedLimit;
   
   procedure carSpeedLimit with
     Global => (In_Out => TheCar),
     Pre => speedLimit,
     Post => speedLimit;
   
   procedure lowCharge with
     Global => (In_Out => TheCar),
     Pre => TheCar.battery <= 20,
     Post => TheCar.charge = Low;
   
   procedure changeGear with
     Global => (In_Out => TheCar),
     Pre => TheCar.speed = 0 and TheCar.gear = Parked,
     Post => TheCar.gear = Drive;
   
   procedure objectDetection with
     Global => (In_Out => TheCar),
     Pre => TheCar.sensor = Detected,
     Post => TheCar.speed = 0;
   
   procedure enableDiagnosticMode with
     Global => (In_Out => TheCar),
     Pre => TheCar.switch = On and TheCar.diagnostic = Off,
     Post => TheCar.switch = Off and TheCar.diagnostic = On;
   
   procedure trafficLightSignal with
     Global => (In_Out => TheCar),
     Pre => TheCar.speed >= 1 and TheCar.signal = Red,
     Post => TheCar.speed = 0;
      
end selfDrivingCar;
