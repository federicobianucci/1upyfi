// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {FoundryRandom} from "foundry-random/FoundryRandom.sol";
import {BaseTest} from "test/utils/BaseTest.sol";
import {StakingManager} from "test/invariant/managers/StakingManager.sol";
import {StakingHandler} from "test/invariant/handlers/StakingHandler.sol";

contract StakingInvariantTest is BaseTest {
    uint256 private constant HANDLERS = 10;

    StakingManager public manager;
    StakingHandler[] public handlers;

    function setUp() public override {
        super.setUp();

        for (uint256 i = 0; i < HANDLERS; ++i) {
            StakingHandler handler = new StakingHandler(staking);
            handlers.push(handler);
        }
        manager = new StakingManager(handlers);
        targetContract(address(manager));
    }

    // function invariant_vested_eq_sum_unclaimed_claimed_locked() external {
    //     for (uint256 i = 0; i < TOTAL_HANDLERS; ++i) {
    //         assertEq(
    //             handlers[i].sum_unclaimed_claimed_locked(),
    //             handlers[i].vestedAmount(),
    //             "Vested amount not eq sum of unclaimed, claimed and locked"
    //         );
    //     }
    // }
}
