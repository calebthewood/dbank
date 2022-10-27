import Debug "mo:base/Debug";

actor DBank {
  var currentValue = 300;
  currentValue := 100;

  let id = 8675309;
  Debug.print(debug_show (id));
  // Private Function, available only inside the cannister
  // 'public' makes function available outside DBank scope
  // :Nat is a natural number >= 0
  public func topUp(amount : Nat) {
    currentValue += amount;
    Debug.print(debug_show (currentValue));
  };

  public func withdraw(amount : Nat) {
    let tempValue : Int = currentValue - amount;
    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show (currentValue));
    } else {
      Debug.print("Insufficient Funds");
    };
  };

  public query func checkBalance() : async Nat {
    return currentValue;
  };
};

//Vocab:
//Orthogonal Persistance
//Update Methods
