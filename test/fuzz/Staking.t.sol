// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {BaseTest} from "test/utils/BaseTest.sol";
import {MockToken} from "test/mocks/MockToken.sol";

import {IVotingEscrow} from "test/interfaces/IVotingEscrow.sol";

import {IProxy} from "test/interfaces/IProxy.sol";
import {IStaking} from "test/interfaces/IStaking.sol";
import {IStakingRewards} from "test/interfaces/IStakingRewards.sol";
import {IBasicRedeemer} from "test/interfaces/IBasicRedeemer.sol";
import {IGaugeRewards} from "test/interfaces/IGaugeRewards.sol";
import {IRegistry} from "test/interfaces/IRegistry.sol";
import {ILiquidLocker} from "test/interfaces/ILiquidLocker.sol";

contract StakingTest is BaseTest {
    // 1up
    IProxy public proxy;
    IStaking public staking;
    IStakingRewards public stakingRewards;
    IBasicRedeemer public basicRedeemer;
    IGaugeRewards public gaugeRewards;
    IRegistry public registry;
    ILiquidLocker public liquidLocker;

    // yearn
    IVotingEscrow public votingEscrow;

    IERC20 public yfi;
    IERC20 public dYfi;

    function setUp() public override {
        super.setUp();

        yfi = IERC20(0x0bc529c00C6401aEF6D220BE8C6Ea1667F6Ad93e);
        dYfi = IERC20(0x41252E8691e964f7DE35156B68493bAb6797a275);

        votingEscrow = IVotingEscrow(0x90c1f9220d90d3966FbeE24045EDd73E1d588aD5);

        proxy = IProxy(deployContract("Proxy", abi.encode(address(yfi), address(dYfi))));
        registry = IRegistry(deployContract("Registry", abi.encode(address(proxy))));
        liquidLocker = ILiquidLocker(
            deployContract("LiquidLocker", abi.encode(address(yfi), address(votingEscrow), address(proxy)))
        );
        staking = IStaking(deployContract("Staking", abi.encode(address(yfi))));
        stakingRewards = IStakingRewards(
            deployContract("StakingRewards", abi.encode(address(proxy), address(staking), address(yfi), address(dYfi)))
        );
        gaugeRewards = IGaugeRewards(deployContract("GaugeRewards", abi.encode(address(dYfi), address(registry))));
        basicRedeemer = IBasicRedeemer(
            payable(
                deployContract(
                    "BasicRedeemer",
                    abi.encode(
                        address(votingEscrow),
                        address(liquidLocker),
                        address(yfi),
                        address(dYfi),
                        address(proxy),
                        address(gaugeRewards),
                        address(stakingRewards)
                    )
                )
            )
        );

        // deal YFI to actors
        deal(address(yfi), address(0x10000), 100 ether);
        deal(address(yfi), address(0x20000), 100 ether);
        deal(address(yfi), address(0x30000), 100 ether);

        vm.label(address(yfi), "YFI");
        vm.label(address(dYfi), "dYFI");
        vm.label(address(0x10000), "Alice");
        vm.label(address(0x20000), "Bob");
        vm.label(address(0x30000), "Deployer");
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
