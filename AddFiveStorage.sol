
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage {
    // overrides
    //virtual overirides
    function store(uint256 _newNumber) public override {
        myfavoriteNumber = _newNumber +5;
    }

}