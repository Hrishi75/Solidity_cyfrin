// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24; //refers to version

contract SimpleStorage {
         
    // bool hasFavoriteNumber = true;  //default false
    uint256   myfavoriteNumber; //default 0
    struct Person{
        uint256 favoriteNumber;
        string name;
    }

    Person[] public listOfPeople; 
    // string favoritNumberIntext = "hello world";
    // int256 favoriteInt = -88;
    // address myaddress = 0x2160d0Be4F5EDEc2fe7B899Fd1D2a9b02D7166e2;
    // bytes32 favoriteByte32 = "cat"; 
     
    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public virtual {
            myfavoriteNumber = _favoriteNumber;
    }
    //view, pure
    function retrieve() public view  returns(uint256){
        return myfavoriteNumber;    
    }
     
    // calldata, memory, storage
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person (_favoriteNumber, _name)); 
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
        //0xd9145CCE52D386f254917e481eB44e9943F39138
}




