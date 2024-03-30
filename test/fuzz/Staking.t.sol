// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "test/utils/BaseFuzzTest.sol";

contract StakingTest is BaseFuzzTest {
    function setUp() public override {
        super.setUp();

        deal(address(yfi), address(alice), 10 ether);
        deal(address(yfi), address(bob), 10 ether);
        deal(address(yfi), address(carol), 10 ether);

        vm.startPrank(alice);
        yfi.approve(address(liquidLocker), type(uint256).max);
        upYfi.approve(address(staking), type(uint256).max);
        liquidLocker.deposit(10 ether);

        vm.startPrank(bob);
        yfi.approve(address(liquidLocker), type(uint256).max);
        upYfi.approve(address(staking), type(uint256).max);
        liquidLocker.deposit(10 ether);

        vm.startPrank(carol);
        yfi.approve(address(liquidLocker), type(uint256).max);
        upYfi.approve(address(staking), type(uint256).max);
        liquidLocker.deposit(10 ether);
    }

    function testStake(uint256 amount) public {
        vm.startPrank(alice);
        uint256 amountAlice = bound(amount, 1 ether, upYfi.balanceOf(address(alice)));
        staking.deposit(amountAlice);
    }
}
