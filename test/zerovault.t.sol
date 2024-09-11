/*
   *******************************************************
   *                                                     *
   *             ACS Contract Audit Program              *
   *   _______________________________________________   *
   *                                                     *
   *   A structured path for auditors and bug bounty      *
   *   hunters to learn by finding and reporting          *
   *   vulnerabilities in smart contracts.                *
   *                                                     *
   *   Level: Beginner                                    *
   *   Special thanks: Aniket Tyagi                       *
   *                                                     *
   *******************************************************
*/


// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

import { Test } from "forge-std/Test.sol";
import { Zerovault } from "../src/zerovault.sol";

contract ZeroVaultTest is Test {

    Zerovault public zerovault;
    address public owner = 0x1234567890AbcdEF1234567890aBcdef12345678;
    address public user = makeAddr("user");
    address public attacker = makeAddr("Attacker");

    function setUp() public {
        zerovault = new Zerovault(owner);
    }

    function testMint() public {

        // @info - Is Successful Mint
     
        vm.deal(owner, 1 ether);
        vm.startPrank(owner);
        zerovault.mint{value: 1 ether}();
        vm.stopPrank();

        assertEq(zerovault.tokenBalances(owner), 100);
        assertEq(zerovault.collateralBalances(owner), 1 ether);
    }

    function testSetOwnerKey() public {
     
        vm.startPrank(owner);
        zerovault.setownerkey("developer sucks the protocol");
        assertEq(zerovault.getOnwerKey(), "developer sucks the protocol");
        vm.stopPrank();
    }

    function testsettokenprice() public {

        vm.prank(owner);
        zerovault.settokenprice(100);
        assertEq(zerovault.tokenPrice(), 100);
    }

    function testchangeCollateralizationRatio() public {

        vm.prank(owner);
        zerovault.changeCollateralizationRatio(200);
        assertEq(zerovault.collateralizationRatio(), 200);

    }

    function testemergencyWithdraw() public {

        vm.prank(owner);
        zerovault.emergencyWithdraw(owner);
        Expect(zerovault.emergencyWithdraw(owner);)

    }

    function testliquidate() public {

        vm.prank(user);
        zerovault.mint{value: 20 ether}();
        zerovault.liquidate(user);

        assertEq(zerovault.collateralBalances(user),0 ether);
    }

    function testArbitraryTransferFrom() public { 

        vm.prankStart(user);
        zerovault.mint{value: 20 ether}();
        zerovault.approve(user,10);
        vm.prankStop();

        vm.prankStart(attacker);
        zerovault.transferFrom(user,attacker,10);
        vm.prankStop()

        assertEq(zerovault.tokenBalances(attacker), 10);

    }

}
