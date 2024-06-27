import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Float "mo:base/Float";
import Time "mo:base/Time";

actor DBank{
    stable var balance: Float=400;
    // Debug.print(debug_show(balance));
    Debug.print(debug_show(balance));
    stable var startTime = Time.now();

    let id= 1234;
    // Debug.print(debug_show(id));
    public func topUp(amount : Float){
        balance += amount;
        // Debug.print(debug_show(balance));
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
        let timeElapsedS = timeElapsedNs/1000000000;
        balance := balance*(1.01**Float.fromInt(timeElapsedS));
        startTime := currentTime;
    }
}