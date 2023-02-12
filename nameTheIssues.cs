pragma solidity ^0.8.0;

contract Vulnerable {
    address owner;

    function Vulnerable() public {
        owner = msg.sender;
    }

    function setOwner(address newOwner) public {
        owner = newOwner;
    }

    function steal() public {
        // This function allows anyone to call it and steal all the funds in the contract
        msg.sender.transfer(address(this).balance);
    }

    function getOwner() public view returns (address) {
        return owner;
    }
}
