// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;


contract SimplePasswordStorage{

    // **** 1
    // limitations: one user can store only one password.
    // mapping(address=>bytes32) private passwords;

    // function storeHashedPassword(bytes32 _hashedPassword) external{
    //     address cur_user=msg.sender;
    //     require(passwords[cur_user]==0x0,"Id already taken.");
    //     passwords[cur_user]=_hashedPassword;
    // }

    // function getHashedPassword() external view returns(bytes32){
    //     address cur_user=msg.sender;
    //     require(passwords[cur_user]!=0x0,"Id not found.");
    //     return passwords[cur_user];
    // }


    // **** 2
    // mapping(uint256=>bytes32) private passwords;

    // function storeHashedPassword(uint256 _id,bytes32 _hashedPassword) external{
    //     require(passwords[_id]==0x0,"Id already taken.");
    //     passwords[_id]=_hashedPassword;
    // }

    

    // function getHashedPassword(uint256 _id) external view returns(bytes32){
    //     require(passwords[_id]!=0x0,"Id not found.");
    //     return passwords[_id];
    // }



    // **** 3.
    mapping(address=>mapping(uint256=>bytes32)) private passwords;


    function setHashedPassword(uint256 _id,bytes32 _hashedPassword) external{
        address sender=msg.sender;
        require(passwords[sender][_id]==bytes32(0),"Id already exixts!");
        passwords[sender][_id]=_hashedPassword;
    }

    function getHashedPassword(uint256 _id) external view returns(bytes32){
        address sender=msg.sender;
        require(passwords[sender][_id]!=bytes32(0),"Id don't exixts!");
        return passwords[sender][_id];
    }
}
