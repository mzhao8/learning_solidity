// https://www.tutorialspoint.com/solidity/solidity_contracts.htm

pragma solidity ^0.5.0;

contract C {
    // private state variable
    uint private data;

    // public state variable
    uint public info;

    // constructor
    constructor() public {
        info = 10;
    }

    // private function
    function increment(uint a) private pure returns(uint) {
        return a + 1; 
        }

    // public function
    function updateData(uint a) public {data = a;}
    function getData() public view returns(uint) {return data;}
    function compute(uint a, uint b) internal pure returns(uint) { return a + b; }
}

// External contract
contract D {
    function readData() public returns(uint) {
        C c = new C(); // new instance of contract C
        c.updateData(7); // data = 7
        return c.getData(); // assuming c returns 7?
    }
}

// Derived contract
contract E is C {
    uint private result; // private variable
    C private c; // make C contract private?

    constructor() public {
        c = new C();
    }
    function getComputedResult() public {
        result = compute(3, 5); // add 3 and 5, result= 8
    }
    function getResult() public view returns(uint) { return result; }
    function getData() public view returns(uint) { return c.info(); }
}
