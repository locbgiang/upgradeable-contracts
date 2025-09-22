// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import { Script } from "forge-std/Script.sol";
import { BoxV1 } from "../src/BoxV1.sol";
import { BoxV2 } from "../src/BoxV2.sol";
import { ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import { DevOpsTools } from "@foundry-devops/src/DevOpsTools.sol";

contract UpgradeBox is Script {
    function run () {
        
    }
}

