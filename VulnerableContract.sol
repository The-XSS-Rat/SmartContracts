pragma solidity ^0.5.0;

contract Attacker {
    function attack(address victim) public {
        uint balance = victim.balance;
        victim.transfer(balance);
    }
}

contract Victim {
    uint public funds;

    function deposit() public payable {
        funds += msg.value;
    }

    function withdraw(uint amount) public {
        require(amount <= funds, "Insufficient funds");
        funds -= amount;
        msg.sender.transfer(amount);
    }
}
