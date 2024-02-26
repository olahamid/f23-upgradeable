// SPDX-License-Identifier:MIT
pragma solidity ^0.8.19;

import {UUPSUpgradeable} from "../lib/openzeppelin-contracts/contracts/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "../lib/openzeppelin-contracts/contracts/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "../lib/openzeppelin-contracts-upgradeable/contracts/access/OwnableUpgradeable.sol";
// import {Ownable} from "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";
//storage is stored to a proxy
// 
 
contract boxV1 is  Initializable, UUPSUpgradeable {
    uint256 internal number;
    
    // since proxy contract dont ue constructor it is meant to be used to an initializable contract
    constructor (){
        _disableInitializers();
     //what this disable initialler does is that it doesnt let any initialer set to true for starts
    }
    function initialize() public initializer{
        // __Ownable_init(msg.sender);
        // transferOwnership(msg.sender);
        __UUPSUpgradeable_init();
    }
    function getNumber() external view returns (uint256) {
        return number;
    }

    function version() external pure returns (uint256) {
        return 1;
    }
    function _authorizeUpgrade(address newImplementation) internal override {}
}
