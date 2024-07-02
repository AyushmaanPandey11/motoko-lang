import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Float "mo:base/Float";
import Time "mo:base/Time";

actor DBank{
    stable var balance: Float=300;
    // balance := 300;
    Debug.print(debug_show(balance));
    stable var startTime = Time.now();
    Debug.print(debug_show(startTime));

    let id= 1234;
    // Debug.print(debug_show(id));
    public func topUp(amount : Float){
        balance += amount;
        Debug.print(debug_show(balance));
    };
    public func withdraw(amount: Float){
        let tempValue: Float = balance - amount;
        if(tempValue >= 0)
        {
            balance -= amount;
            Debug.print(debug_show(balance));
        }
        else
        {
            Debug.print("Not sufficient balance");
        }
    };
    // query function
    public query func getBalance(): async Float{
        return balance;
    };

    public func compoundInterest(){
        let currentTime = Time.now();
        let timeElapsedNs = currentTime-startTime;
        let timeElapsedHundredS = timeElapsedNs/100000000000;
        balance := balance*(1.01**Float.fromInt(10));
        startTime := currentTime;
    }
}