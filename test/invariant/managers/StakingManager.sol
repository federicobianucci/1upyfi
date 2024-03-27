// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {CommonBase} from "forge-std/Base.sol";
import {StdCheats} from "forge-std/StdCheats.sol";
import {StdUtils} from "forge-std/StdUtils.sol";
import {console2 as console} from "forge-std/console2.sol";
import {StakingHandler} from "test/invariant/handlers/StakingHandler.sol";

contract StakingManager is CommonBase, StdCheats, StdUtils {
    StakingHandler[] private handlers;

    constructor(StakingHandler[] memory _handlers) {
        handlers = _handlers;
    }

    function warp(uint256 amount) external {
        amount = bound(amount, 1, 1 days);
        vm.warp(block.timestamp + amount);
    }

    function deposit(uint256 index, uint256 amount) public {
        index = bound(index, 0, handlers.length - 1);
        handlers[index].deposit(amount);
    }

    function donation(uint256 index, uint256 amount) public {
        index = bound(index, 0, handlers.length - 1);
        handlers[index].donation(amount);
    }

    function lock(uint256 index, uint256 duration) public {
        index = bound(index, 0, handlers.length - 1);
        handlers[index].lock(duration);
    }

    function unstake(uint256 index, uint256 amount) public {
        index = bound(index, 0, handlers.length - 1);
        handlers[index].unstake(amount);
    }

    function withdraw(uint256 index, uint256 amount) public {
        index = bound(index, 0, handlers.length - 1);
        handlers[index].withdraw(amount);
    }
}
