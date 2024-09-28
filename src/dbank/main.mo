import Debug "mo:base/Debug";
import Nat "mo:base/Nat";

//just created  a new canister

actor DBank {
  stable var currentValue: Nat = 300; // Initializing with a default value
  let id: Nat = 2444254351454;

  // Print a welcome message when the actor is initialized
  Debug.print("Hello Motoko");

  public func topUp(amount: Nat) {
    currentValue += amount;
    Debug.print(debug_show(currentValue)); // Print the current value after increment
  };

 public func withDraw(amount:Nat){
  let tempValue : Int = currentValue - amount;
  if(tempValue >= 0){

  currentValue -= amount;
  Debug.print(debug_show(currentValue));
  }
  else{
    Debug.print("Amount is too large ");
  }
 };

public query func checkBalance(): async Nat{
  return currentValue;
};

};
