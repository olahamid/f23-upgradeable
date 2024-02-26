// SPDX-License-Identifier:MIT
pragma solidity ^0.8.19;

import {UUPSUpgradeable} from "../lib/openzeppelin-contracts/contracts/proxy/utils/UUPSUpgradeable.sol";

contract boxV2 is UUPSUpgradeable {
    uint256 internal number;
    function setNumber (uint _number) public {
        number = _number;
    }

    function getNumber() external view returns (uint256) {
        return number;
    }

    function version() external pure returns (uint256) {
        return 2;
    }
    function _authorizeUpgrade(address newImplementation) internal override {}
}
