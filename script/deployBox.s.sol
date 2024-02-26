//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
import {Script} from "../lib/forge-std/src/Script.sol";
import {boxV1} from "../src/boxV1.sol";
import {ERC1967Proxy} from "../lib/openzeppelin-contracts/contracts/proxy/ERC1967/ERC1967Proxy.sol";
contract deployBox {
    
    function run() external returns(address){
        address proxy = DeployRun();
        return proxy;
    }

    function DeployRun() public returns (address) {
        boxV1 Box = new boxV1();
        ERC1967Proxy proxy = new ERC1967Proxy (address(Box), "");
        return address(proxy);

    }


}