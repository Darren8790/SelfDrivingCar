package body selfDrivingCar with SPARK_Mode is

   procedure turnOnCar
   is
   begin
      if (TheCar.switch = Off and TheCar.gear = Parked)
      then TheCar.switch := On;
      else TheCar.switch := Off;
      end if;
   end turnOnCar;
   
   procedure driveCar
   is
   begin
      if (TheCar.battery >= 10 and TheCar.speed < 100)
      then TheCar.speed := TheCar.speed + 1;
      else TheCar.speed := 0;
      end if;       
   end driveCar;
   
   procedure increaseSpeed
   is
   begin
      if (TheCar.speed > 1 and TheCar.speed < 100)
      then TheCar.speed := 50;
      else TheCar.speed := 0;
      end if;
   end increaseSpeed;
   
   procedure lowCharge
   is
   begin
      if (TheCar.battery <= 20)
      then TheCar.charge := Low;
      else TheCar.charge := Ok;
      end if;   
   end lowCharge;
   
   procedure carSpeedLimit
   is
   begin
      if (TheCar.speed < 100)
      then TheCar.speed := + 1;
      end if;
   end carSpeedLimit;

   procedure changeGear
   is
   begin
      if (TheCar.speed = 0 and TheCar.gear = Parked)
      then TheCar.gear := Drive;
      end if;
   end changeGear;
   
   procedure objectDetection
   is
   begin
      if (TheCar.sensor = Detected)
      then TheCar.speed := 0;
      end if;
   end objectDetection;
      
   procedure enableDiagnosticMode
   is
   begin
      if (TheCar.switch = On)
      then TheCar.switch := Off; TheCar.diagnostic := On;
      end if;
   end enableDiagnosticMode;
   
   procedure trafficLightSignal
   is
   begin
      if (TheCar.speed > 0 and TheCar.signal = Red)
      then TheCar.speed := 0;
      end if;
   end trafficLightSignal;
   
end selfDrivingCar;
