From: lkp@intel.com (kbuild test robot)
Date: Tue, 22 Dec 2015 03:45:47 +0800
Subject: [PATCH v3 2/2] add new platform driver for PCI RC
In-Reply-To: <5d0ef02da7c69534420aac36a8a0a375873bae99.1450694884.git.jpinto@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201512220321.CiZXINn9%fengguang.wu@intel.com>
To: linux-snps-arc@lists.infradead.org

Hi Joao,

[auto build test ERROR on arc/for-next]
[also build test ERROR on v4.4-rc6 next-20151221]

url:    https://github.com/0day-ci/linux/commits/Joao-Pinto/adding-PCI-support-to-AXS10x/20151221-234734
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc for-next
config: i386-allmodconfig (attached as .config)
reproduce:
        # save the attached .config to linux build tree
        make ARCH=i386 

All errors (new ones prefixed by >>):

   drivers/pci/host/pcie-designware.c: In function 'dw_pcie_host_init':
>> drivers/pci/host/pcie-designware.c:556:7: error: implicit declaration of function 'pci_has_flag' [-Werror=implicit-function-declaration]
     if (!pci_has_flag(PCI_PROBE_ONLY)) {
          ^
>> drivers/pci/host/pcie-designware.c:556:20: error: 'PCI_PROBE_ONLY' undeclared (first use in this function)
     if (!pci_has_flag(PCI_PROBE_ONLY)) {
                       ^
   drivers/pci/host/pcie-designware.c:556:20: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors

vim +/pci_has_flag +556 drivers/pci/host/pcie-designware.c

cbce7900 Zhou Wang   2015-10-29  550  
cbce7900 Zhou Wang   2015-10-29  551  #ifdef CONFIG_ARM
cbce7900 Zhou Wang   2015-10-29  552  	/* support old dtbs that incorrectly describe IRQs */
cbce7900 Zhou Wang   2015-10-29  553  	pci_fixup_irqs(pci_common_swizzle, of_irq_parse_and_map_pci);
0815f957 Yijing Wang 2014-11-11  554  #endif
0815f957 Yijing Wang 2014-11-11  555  
cbce7900 Zhou Wang   2015-10-29 @556  	if (!pci_has_flag(PCI_PROBE_ONLY)) {
cbce7900 Zhou Wang   2015-10-29  557  		pci_bus_size_bridges(bus);
cbce7900 Zhou Wang   2015-10-29  558  		pci_bus_assign_resources(bus);
4b1ced84 Jingoo Han  2013-07-31  559  

:::::: The code at line 556 was first introduced by commit
:::::: cbce7900598c26a12652f8ca9c41c5b29034c38d PCI: designware: Make driver arch-agnostic

:::::: TO: Zhou Wang <wangzhou1 at hisilicon.com>
:::::: CC: Bjorn Helgaas <bhelgaas at google.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/octet-stream
Size: 52582 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20151222/f7add423/attachment-0001.obj>
