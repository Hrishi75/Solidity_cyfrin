// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import "./SimpleStorage.sol";

contract StorageFactory{

    //uint256 public  favoriteNumber
    //type visibility name
    SimpleStorage[] public listOfSimpleStorageContracts;


    function createSimpleStorageContract() public {
            // how does the storgae factory know what simple storage look?
            SimpleStorage newSimpleStorageContract = new SimpleStorage();
            listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public{
        // address
        //ABI - application binary interface
        listOfSimpleStorageContracts[_simpleStorageIndex].store(_newSimpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }
}