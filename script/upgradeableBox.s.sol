//SPDX-License-Identifier:MIT
pragma solidity ^0.8.19;
import {Script} from "../lib/forge-std/src/Script.sol";
import {boxV1} from "../src/boxV1.sol";
import {boxV2} from "../src/boxV2.sol";
import {DevOpsTools} from "../lib/foundry-devops/src/DevOpsTools.sol";
import {UUPSUpgradeable} from "../lib/openzeppelin-contracts/contracts/proxy/utils/UUPSUpgradeable.sol";

contract upgradeableBox is Script {

    function run () external returns (address) {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("ERC1967Proxy", block.chainid);

        vm.startBroadcast();
        boxV2 newBox = new boxV2();
        vm.stopBroadcast();

        address proxy = upgradeBox(mostRecentlyDeployed, address(newBox));
        return proxy;

        }
        
    function upgradeBox(address proxyAddress, address newBox) public returns (address) {
        vm.startBroadcast();
        boxV1 proxy = boxV1(address(proxyAddress));
        proxy.upgradeTo(address(newBox));
        vm.stopBroadcast();
        return address(proxy);
    }
}