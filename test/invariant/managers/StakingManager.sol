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

    function deposit(uint256 handlerIndex, uint256 amount) public {
        uint256 index = bound(handlerIndex, 0, handlers.length - 1);
        handlers[index].deposit(amount);
    }
}
