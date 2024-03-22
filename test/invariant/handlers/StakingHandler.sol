// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {CommonBase} from "forge-std/Base.sol";
import {StdCheats} from "forge-std/StdCheats.sol";
import {StdUtils} from "forge-std/StdUtils.sol";
import {console2 as console} from "forge-std/console2.sol";
import {IStaking} from "test/interfaces/IStaking.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract StakingHandler is CommonBase, StdCheats, StdUtils {
    IStaking private staking;
    IERC20 private yfi;

    uint256 public stakedAmount;

    constructor(IStaking _staking, IERC20 _yfi) {
        staking = _staking;
        yfi = _yfi;
    }

    function totalSupply() external view returns (uint256) {
        return staking.totalSupply();
    }

    function deposit(uint256 amount) external returns (uint256) {
        bound(amount, 0, yfi.balanceOf(address(this)));
        return staking.previewMint(amount);
    }

    // function locked() external view returns (uint256) {
    //     return vestingEscrow.locked();
    // }

    // function sum_unclaimed_claimed_locked() external view returns (uint256) {
    //     return vestingEscrow.unclaimed() + vestingEscrow.total_claimed() + vestingEscrow.locked();
    // }

    // function claim() external returns (uint256) {
    //     hoax(vestingEscrow.recipient());
    //     return vestingEscrow.claim();
    // }

    // function claim(address _sender) external returns (uint256) {
    //     if (vestingEscrow.open_claim()) {
    //         hoax(_sender);
    //         return vestingEscrow.claim(vestingEscrow.recipient());
    //     } else {
    //         hoax(vestingEscrow.recipient());
    //         return vestingEscrow.claim();
    //     }
    // }
}
