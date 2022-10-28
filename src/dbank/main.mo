import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;
  stable var startTime = Time.now();
  let id = 8675309;
  Debug.print(debug_show (id));
  // Private Function, available only inside the cannister
  // 'public' makes function available outside DBank scope
  // :Nat is a natural number >= 0
  public func topUp(amount : Float) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  public func withdraw(amount : Float) {
    let tempValue : Float = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("Insufficient Funds");
    };
  };

  public query func checkBalance() : async Float {
    return currentValue;
  };

  public func checkTime() {
    let time = Time.now();
    Debug.print(debug_show (time));
  };

  public func compoundInterest() {
    let timeElapsedS = (Time.now() - startTime) / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));

  };
};
