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

    // function skipSeconds(uint256 _seconds) external returns (uint256) {
    //     _seconds = bound(_seconds, 1, maxSkipSeconds);
    //     skip(_seconds);
    //     return block.timestamp;
    // }

    // function skipDays(uint256 _days) external returns (uint256) {
    //     _days = bound(_days, 1, type(uint16).max);
    //     uint256 _seconds = bound(_days * 86_400, 1, maxSkipSeconds);
    //     skip(_seconds);
    //     return block.timestamp;
    // }

    // function claim(uint256 _handlerIndex) external returns (uint256) {
    //     uint256 index = bound(_handlerIndex, 0, handlers.length - 1);
    //     return handlers[index].claim();
    // }

    // function claim(uint256 _handlerIndex, address _sender) external returns (uint256) {
    //     uint256 index = bound(_handlerIndex, 0, handlers.length - 1);
    //     return handlers[index].claim(_sender);
    // }
}
