From: Joao.Pinto@synopsys.com (Joao Pinto)
Date: Mon, 15 Feb 2016 18:15:55 +0000
Subject: [PATCH v9 2/2] pcie-designware platform driver
In-Reply-To: <56BB0777.6080208@synopsys.com>
References: <9069117816a5cd9cc3314b6d584c26d457807b8e.1454952698.git.jpinto@synopsys.com>
 <201602090552.plkRtxUR%fengguang.wu@intel.com>
 <20160208232808.GB1353@localhost> <56BB0777.6080208@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56C215DB.50603@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Bjorn!
Did you have opportunity to check the v9 patch set?
Thanks.

Joao

On 2/10/2016 9:48 AM, Joao Pinto wrote:
> Hi Bjorn,
> 
> On 2/8/2016 11:28 PM, Bjorn Helgaas wrote:
>>>      if (!pci_has_flag(PCI_PROBE_ONLY)) {
>>>                        ^
>>>    drivers/pci/host/pcie-designware.c:581:20: note: each undeclared identifier is reported only once for each function it appears in
>>>    cc1: some warnings being treated as errors
>>
>> I have fixes for this on my pci/misc branch, so you don't need to
>> worry about these errors.  Basically I'm moving the PCI_PROBE_ONLY and
>> pci_has_flag() declarations from the arch-specific asm/pci-bridge.h
>> files to the generic linux/pci.h file.
> 
> Ok, thanks.
> 
>>
>>> vim +/pci_has_flag +581 drivers/pci/host/pcie-designware.c
>>>
>>> cbce7900 Zhou Wang   2015-10-29  575  
>>> cbce7900 Zhou Wang   2015-10-29  576  #ifdef CONFIG_ARM
>>> cbce7900 Zhou Wang   2015-10-29  577  	/* support old dtbs that incorrectly describe IRQs */
>>> cbce7900 Zhou Wang   2015-10-29  578  	pci_fixup_irqs(pci_common_swizzle, of_irq_parse_and_map_pci);
>>> 0815f957 Yijing Wang 2014-11-11  579  #endif
>>> 0815f957 Yijing Wang 2014-11-11  580  
>>> cbce7900 Zhou Wang   2015-10-29 @581  	if (!pci_has_flag(PCI_PROBE_ONLY)) {
>>> cbce7900 Zhou Wang   2015-10-29  582  		pci_bus_size_bridges(bus);
>>> cbce7900 Zhou Wang   2015-10-29  583  		pci_bus_assign_resources(bus);
>>> 4b1ced84 Jingoo Han  2013-07-31  584  
>>>
>>> :::::: The code at line 581 was first introduced by commit
>>> :::::: cbce7900598c26a12652f8ca9c41c5b29034c38d PCI: designware: Make driver arch-agnostic
>>>
>>> :::::: TO: Zhou Wang <wangzhou1 at hisilicon.com>
>>> :::::: CC: Bjorn Helgaas <bhelgaas at google.com>
>>>
>>> ---
>>> 0-DAY kernel test infrastructure                Open Source Technology Center
>>> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
>>
>>
> 
> If there's anything else that is needed for the pcie-designware platform driver,
> please let me know.
> 
> Thanks,
> Joao
> 
