// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import { Script } from "forge-std/Script.sol";
import { BoxV1 } from "../src/BoxV1.sol";
import { ERC1967Proxy } from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

/**
 * @title DeployBox
 * @author Loc Giang
 * @notice This script returns a proxy after deploying the BoxV1 contract
 */
contract DeployBox is Script {
    function run() external returns (address) {
        // grab the proxy address from function deployBox()
        address proxy = deployBox();
        return proxy;
    }

    function deployBox() public returns (address) {
        vm.startBroadcast();
        // deploy new BoxV1 contract
        BoxV1 box = new BoxV1();
        // create a proxy, the input is the address of the newly created BoxV1 address
        ERC1967Proxy proxy = new ERC1967Proxy(address(box), "");
        
        // cast the proxy into address instead of ERC1967proxy
        // call the initialize function on the proxy
        // __Ownable_init(msg.sender): makes the message sender as the owner
        // __UUPSUpgradeable_init(): initializes the UUPS upgradeable functionality
        BoxV1(address(proxy)).initialize();
        vm.stopBroadcast();

        // return the address of the proxy
        return address(proxy);
    }
}