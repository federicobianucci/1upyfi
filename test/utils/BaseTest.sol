// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import {VyperDeployer} from "snekmate-utils/VyperDeployer.sol";

abstract contract BaseTest is Test {
    VyperDeployer vyperDeployer;

    function setUp() public virtual {
        vyperDeployer = new VyperDeployer();
    }

    function deployContract(string memory contractName, bytes memory args) public returns (address) {
        return vyperDeployer.deployContract("contracts/", contractName, args);
    }
}
