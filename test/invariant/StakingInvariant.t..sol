// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "test/utils/BaseStakingInvariantTest.sol";
import {StakingManager} from "test/invariant/managers/StakingManager.sol";
import {StakingHandler} from "test/invariant/handlers/StakingHandler.sol";

contract StakingInvariantTest is BaseStakingInvariantTest {
    uint256 private constant HANDLERS = 3;

    StakingManager public manager;
    StakingHandler[] public handlers;

    function setUp() public override {
        super.setUp();

        for (uint256 i = 0; i < HANDLERS; ++i) {
            StakingHandler handler = new StakingHandler(staking);
            deal(address(liquidLocker), address(handler), 100 ether);
            vm.prank(address(handler));
            liquidLocker.approve(address(staking), type(uint256).max);
            handlers.push(handler);
        }
        manager = new StakingManager(handlers);
        targetContract(address(manager));

        vm.warp(1711120319);
    }

    function invariant_upYFI_gte_supYFI_totalSupply() external view {
        assert(liquidLocker.balanceOf(address(staking)) >= staking.totalSupply());
    }
}
