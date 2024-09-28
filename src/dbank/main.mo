import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Time "mo:base/Time";
import Float "mo:base/Float";
//just created  a new canister

actor DBank {
  stable var currentValue: Float = 300; // Initializing with a default value
  let id: Nat = 2444254351454;
  stable var startTime = Time.now();
  Debug.print(debug_show(startTime));

  // Print a welcome message when the actor is initialized
  Debug.print("Hello Motoko");

  public func topUp(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue)); // Print the current value after increment
  };

 public func withDraw(amount:Float){
  let tempValue : Float = currentValue - amount;
  if(tempValue >= 0){

  currentValue -= amount;
  Debug.print(debug_show(currentValue));
  }
  else{
    Debug.print("Amount is too large ");
  }
 };

public query func checkBalance(): async Float{
  return currentValue;
};


// Time Tracking 
public func compound(){
  let currentTime =Time.now();
  let timeElapsed = currentTime - startTime;

  let timeElapsedinsec = timeElapsed / 1000000000;

  currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedinsec));
  startTime := currentTime;
}


};
