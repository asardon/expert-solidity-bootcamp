pragma solidity ^0.8.4;


/* 
potential dangers
1. left/right shift:
* potentially unexpected behavior due to
- truncating/losing bits
- padding bits
2. bit operations: 
*/

contract TestA {
    uint256 public x;

    constructor() {
    }

    function set(uint256 _x) external {
        x = _x;
    }

    function update() external {
        uint256 _x = x;
        if(_x & 0xde == 0xde) {
            x *= 4;
        } else if(_x & 0xbe == 0xbe) {
            x /= 4;
        }
    }
}