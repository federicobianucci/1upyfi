// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import {VyperDeployer} from "snekmate-utils/VyperDeployer.sol";

import {MockToken} from "test/mocks/MockToken.sol";

import {IYearnVotingEscrow} from "test/interfaces/IYearnVotingEscrow.sol";

import {IProxy} from "test/interfaces/IProxy.sol";
import {IStaking} from "test/interfaces/IStaking.sol";
import {IStakingRewards} from "test/interfaces/IStakingRewards.sol";
import {IBasicRedeemer} from "test/interfaces/IBasicRedeemer.sol";
import {IRegistry} from "test/interfaces/IRegistry.sol";
import {ILiquidLocker} from "test/interfaces/ILiquidLocker.sol";

abstract contract BaseStakingInvariantTest is Test {
    VyperDeployer vyperDeployer;

    // yearn
    MockToken public yfi;
    MockToken public dYfi;
    IYearnVotingEscrow public yearnVotingEscrow;

    // 1up
    IProxy public proxy;
    IStaking public staking;
    IStakingRewards public stakingRewards;
    IBasicRedeemer public basicRedeemer;
    IRegistry public registry;
    ILiquidLocker public liquidLocker;

    function setUp() public virtual {
        vyperDeployer = new VyperDeployer();

        //---------- yearn contracts ----------//

        yfi = new MockToken("YFI", "YFI");
        dYfi = new MockToken("dYFI", "dYFI");

        yearnVotingEscrow =
            IYearnVotingEscrow(deployContract("mocks/YearnVotingEscrow", abi.encode(address(yfi), address(dYfi))));

        //---------- 1up contracts ----------//

        // proxy
        proxy = IProxy(deployContract("Proxy", abi.encode(address(yfi), address(dYfi))));

        // registry
        registry = IRegistry(deployContract("Registry", abi.encode(address(proxy))));

        // liquid locker
        liquidLocker = ILiquidLocker(
            deployContract("LiquidLocker", abi.encode(address(yfi), address(yearnVotingEscrow), address(proxy)))
        );

        // basic redeemer
        basicRedeemer = IBasicRedeemer(
            payable(
                deployContract(
                    "BasicRedeemer",
                    abi.encode(
                        address(yearnVotingEscrow),
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

        // staking
        staking = IStaking(deployContract("Staking", abi.encode(address(liquidLocker))));

        // staking rewards
        stakingRewards = IStakingRewards(
            deployContract("StakingRewards", abi.encode(address(proxy), address(staking), address(yfi), address(dYfi)))
        );
        vm.prank(address(vyperDeployer));
        staking.set_rewards(address(stakingRewards));
        vm.prank(address(vyperDeployer));
        stakingRewards.set_redeemer(address(basicRedeemer));

        vm.label(address(yfi), "YFI");
        vm.label(address(dYfi), "dYFI");
        vm.label(address(yearnVotingEscrow), "YearnVotingEscrow");

        vm.label(address(proxy), "Proxy");
        vm.label(address(staking), "Staking");
        vm.label(address(stakingRewards), "StakingRewards");
        vm.label(address(basicRedeemer), "BasicRedeemer");
        vm.label(address(registry), "Registry");
        vm.label(address(liquidLocker), "LiquidLocker");

        vm.label(address(0x10000), "Alice");
        vm.label(address(0x20000), "Bob");
        vm.label(address(0x30000), "Deployer");
    }

    function deployContract(string memory contractName, bytes memory args) public returns (address) {
        return vyperDeployer.deployContract("contracts/", contractName, args);
    }
}
