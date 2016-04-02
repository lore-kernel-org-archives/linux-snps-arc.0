From: lkp@intel.com (kbuild test robot)
Date: Sat, 2 Apr 2016 14:43:33 +0800
Subject: [PATCH v7 3/3] irqchip: add nps Internal and external irqchips
In-Reply-To: <1459542085-3065-4-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201604021438.HeC3CfXe%fengguang.wu@intel.com>
To: linux-snps-arc@lists.infradead.org

Hi Noam,

[auto build test WARNING on tip/irq/core]
[also build test WARNING on v4.6-rc1 next-20160401]
[if your patch is applied to the wrong git tree, please drop us a note to help improving the system]

url:    https://github.com/0day-ci/linux/commits/Noam-Camus/Adding-NPS400-drivers/20160402-044058
config: parisc-allyesconfig (attached as .config)
reproduce:
        wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        make.cross ARCH=parisc 

All warnings (new ones prefixed by >>):

   In file included from drivers/irqchip/irq-eznps.c:39:0:
>> include/soc/nps/common.h:37:0: warning: "IPI_IRQ" redefined
    #define IPI_IRQ     5
    ^
   In file included from include/linux/irq.h:26:0,
                    from arch/parisc/include/asm/hardirq.h:12,
                    from include/linux/hardirq.h:8,
                    from include/linux/interrupt.h:12,
                    from drivers/irqchip/irq-eznps.c:33:
   arch/parisc/include/asm/irq.h:24:0: note: this is the location of the previous definition
    #define IPI_IRQ  (CPU_IRQ_BASE + 1)
    ^

vim +/IPI_IRQ +37 include/soc/nps/common.h

4ff0d081 Noam Camus 2016-04-01  21   *        provided with the distribution.
4ff0d081 Noam Camus 2016-04-01  22   *
4ff0d081 Noam Camus 2016-04-01  23   * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
4ff0d081 Noam Camus 2016-04-01  24   * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
4ff0d081 Noam Camus 2016-04-01  25   * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
4ff0d081 Noam Camus 2016-04-01  26   * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
4ff0d081 Noam Camus 2016-04-01  27   * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
4ff0d081 Noam Camus 2016-04-01  28   * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
4ff0d081 Noam Camus 2016-04-01  29   * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
4ff0d081 Noam Camus 2016-04-01  30   * SOFTWARE.
4ff0d081 Noam Camus 2016-04-01  31   */
4ff0d081 Noam Camus 2016-04-01  32  
4ff0d081 Noam Camus 2016-04-01  33  #ifndef SOC_NPS_COMMON_H
4ff0d081 Noam Camus 2016-04-01  34  #define SOC_NPS_COMMON_H
4ff0d081 Noam Camus 2016-04-01  35  
4ff0d081 Noam Camus 2016-04-01  36  #ifdef CONFIG_SMP
4ff0d081 Noam Camus 2016-04-01 @37  #define IPI_IRQ					5
4ff0d081 Noam Camus 2016-04-01  38  #endif
4ff0d081 Noam Camus 2016-04-01  39  
4ff0d081 Noam Camus 2016-04-01  40  #define NPS_HOST_REG_BASE			0xF6000000
4ff0d081 Noam Camus 2016-04-01  41  
4ff0d081 Noam Camus 2016-04-01  42  #define NPS_MSU_BLKID				0x018
4ff0d081 Noam Camus 2016-04-01  43  
4ff0d081 Noam Camus 2016-04-01  44  #define CTOP_INST_RSPI_GIC_0_R12		0x3C56117E
4ff0d081 Noam Camus 2016-04-01  45  #define CTOP_INST_MOV2B_FLIP_R3_B1_B2_INST	0x5B60

:::::: The code at line 37 was first introduced by commit
:::::: 4ff0d0814a05fc7aa0841df0a58bde13f7254c01 soc: Support for EZchip SoC

:::::: TO: Noam Camus <noamc at ezchip.com>
:::::: CC: 0day robot <fengguang.wu at intel.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/octet-stream
Size: 43728 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20160402/550b1f4b/attachment-0001.obj>
