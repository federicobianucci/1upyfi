// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {BaseTest} from "test/utils/BaseTest.sol";

contract StakingTest is BaseTest {
    function setUp() public override {
        super.setUp();

        // deal YFI to actors
        deal(address(yfi), address(0x10000), 100 ether);
        deal(address(yfi), address(0x20000), 100 ether);
        deal(address(yfi), address(0x30000), 100 ether);
    }

    function testSetUp() public {
        assert(yfi.balanceOf(address(0x10000)) == 100 ether);
        assert(yfi.balanceOf(address(0x20000)) == 100 ether);
        assert(yfi.balanceOf(address(0x30000)) == 100 ether);
        assert(dYfi.balanceOf(address(0x10000)) == 0);
        assert(dYfi.balanceOf(address(0x20000)) == 0);
        assert(dYfi.balanceOf(address(0x30000)) == 0);
    }
}
