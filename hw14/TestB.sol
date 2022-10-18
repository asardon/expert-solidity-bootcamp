pragma solidity ^0.8.4;


/* 
potential dangers
1. left/right shift:
* potentially unexpected behavior due to
- truncating/losing bits
- padding bits
2. bit operations: 
*/

contract TestB {
    uint256 public x;

    constructor() {
    }

    function set(uint256 _x) external {
        x = _x;
    }

    function update() external {
        assembly {
            let _x := sload(0)
            if eq(and(_x, 0xde), 0xde) {
                _x := mul(_x, 4)
            }
            if eq(and(_x, 0xbe), 0xbe) {
                _x := div(_x, 4)
            }
            sstore(0, _x)
        }
    }
}