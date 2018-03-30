From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri, 30 Mar 2018 15:37:39 +0000
Subject: DW MMC multislot support
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1522424259.32101.7.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

I have plans to add multislot support to DesignWare MMC driver.

As of today I have proof of concept for multislot DW MMC driver with two slots working
simultaneously:
I reverted all commits which remove previous implementation of "pseudo-multislot"
and add all required steps for changing slot number to __dw_mci_start_request function.

But I have several issues with set_ios function in multislot mode (as each slot
is registered as separate mmc host):
1) We can change clock for slot 1 while slot 0 is active.
2) We can disable one slot (by calling set_ios with 'power_mode' == MMC_POWER_OFF)
 which cause clock disable for all slots.
3) We can enable one slot (by calling set_ios with 'power_mode' == MMC_POWER_ON)
 which cause DMA and FIFO reset while another slot is active.
And so on...


Here is my ideas how to fix this:
1) In set_ios function we can simply store parameters
 (like clock speed/timings/bus width) to corresponding slot structure and apply
 them only in the beginning of __dw_mci_start_request function if current slot is
 changed.
 Another option is to choose maximum clock which is suitable for both slots
 instead of clock switch on every slot change.
2) Do all actions for slot disabling ('power_mode' == MMC_POWER_OFF) only if
 others slots are disabled too.
3) Do all actions for slot enabling ('power_mode' == MMC_POWER_ON) only if
 no slots are enabled.


Maybe you have any comments or remarks about this?
All comments and suggestions are more than welcome.
-- 
 Eugeniy Paltsev
