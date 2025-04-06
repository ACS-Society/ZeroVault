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
    address public owner = rHEFAtoM6kmM7EeXRikAuZEkYLVubzwrPXCjqN1Wvr8;

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

}
