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
    IERC20 private upYfi;

    uint256 public stakedAmount;

    constructor(IStaking _staking) {
        staking = _staking;
        upYfi = IERC20(staking.asset());
    }

    function totalSupply() external view returns (uint256) {
        return staking.totalSupply();
    }

    function deposit(uint256 amount) external returns (uint256) {
        vm.assume(amount != 0);
        amount = bound(amount, 0, upYfi.balanceOf(address(this)));
        return staking.deposit(amount);
    }

    function donation(uint256 amount) external returns (bool) {
        amount = bound(amount, 0, upYfi.balanceOf(address(this)));
        return upYfi.transfer(address(staking), amount);
    }

    function lock(uint256 duration) external returns (uint256) {
        return staking.lock(duration);
    }

    function unstake(uint256 amount) external {
        vm.assume(amount != 0);
        amount = bound(amount, 0, staking.balanceOf(address(this)));
        staking.unstake(amount);
    }

    function withdraw(uint256 amount) external returns (uint256) {
        vm.assume(amount != 0);
        amount = bound(amount, 0, staking.maxWithdraw(address(this)));
        return staking.withdraw(amount);
    }
}
