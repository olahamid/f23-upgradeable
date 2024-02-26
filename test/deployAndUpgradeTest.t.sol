//SPDX-License-Identifier:MIT

pragma solidity ^0.8.19;
import {Test} from "../lib/forge-std/src/Test.sol";
import {console} from "../lib/forge-std/src/console.sol";
import {boxV1} from "../src/boxV1.sol";
import {boxV2} from "../src/boxV2.sol";
import {deployBox} from "../script/deployBox.s.sol";
import {upgradeableBox} from "../script/upgradeableBox.s.sol";

contract deployAndUpgradeTest is Test {
    deployBox deployer;
    upgradeableBox upgrader;

    address proxy;
    function setUp() public {
        deployer = new deployBox();
        upgrader = new upgradeableBox();
        proxy = deployer.run();
    }
    function testExpertRevertv1() public {
        vm.expectRevert();
       boxV2(proxy).setNumber(7); 

    }
    function testUpgrader() public {
        boxV2 BoxV2 = new boxV2();


         upgrader.upgradeBox(proxy, address(BoxV2));
         uint expertvalue = 2;
        assertEq(expertvalue, boxV2(proxy).version());

       boxV2(proxy).setNumber(7);
        assertEq(7,boxV2(proxy).getNumber());
        console.log (boxV2(proxy).getNumber());
    }
}