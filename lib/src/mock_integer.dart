import 'consts.dart';

/// Generate random integer in range `min` to `max`, inclusive.
///
/// Throws [ArgumentError] if `min` is lower or equal than `max`.
int mockInteger([int min = 1, int max = 10]){

  min >= max ? throw ArgumentError('min should be lower than max') : null;

  if(min.isNegative && max.isNegative){
    return min + random.nextInt(min.abs() - max.abs() + 1);
  }else if(min.isNegative){
    return min + random.nextInt(min.abs() + max + 1);
  }else{
    return min + random.nextInt(max - min + 1);
  }
}

