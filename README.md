# SelfDrivingCar

Statistically, cars are dangerous. Human error contributes to most accidents on the roads. To make car-travel more safe a system was developed using Ada SPARK.

A driver’s assistance system for an automatic-gearbox electric car was developed. This system will prevent certain actions when they are unsafe. For example, the driver will be unable to start the car unless it is in the Parked gear; the speed limit must be obeyed at all times; the gearbox cannot go directly from Drive to Reverse; and so on. In particular:
– The car cannot be turned on unless it is in Parked.
– The car cannot be driven unless there is a minimum charge in the battery.
– Once in motion, the system will warn of low charge.
– The speed limit can never be exceeded.
– The speed of the car must be zero in order to change gear.
– If the car’s sensors detect an object, then the car cannot move towards that object.
– The car must have a diagnostic mode which renders it incapable of any other operation.