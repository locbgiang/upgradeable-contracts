// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import { UUPSUpgradeable } from "@openzeppelin-upgradeable/contracts/proxy/utils/UUPSUpgradeable.sol";
import { Initializable } from "@openzeppelin-upgradeable/contracts/proxy/utils/Initializable.sol";
import { OwnableUpgradeable } from "@openzeppelin-upgradeable/contracts/access/OwnableUpgradeable.sol";


contract BoxV1 is Initializable, OwnableUpgradeable, UUPSUpgradeable {
    uint256 internal value;

    // constructor is not allowed on proxy contracts
    constructor() {
        _disableInitializers();
    }

    function initialize() public initializer {
        __Ownable_init(msg.sender);
        __UUPSUpgradeable_init();
    }

    function getValue() public view returns (uint256) {
        return value;
    }

    function version () public returns (uint256) {
        return 1;
    }

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}
}