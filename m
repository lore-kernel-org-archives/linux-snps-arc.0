From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 17 Mar 2016 11:41:30 +0000
Subject: [PATCH v2] ARC: axs10x - add Ethernet PHY description in .dts
References: <1458207712-29435-1-git-send-email-abrodkin@synopsys.com>
 <56EA8DCC.8070308@cogentembedded.com>
 <1458214678.14496.15.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F4E903EF@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Thursday 17 March 2016 05:08 PM, Alexey Brodkin wrote:
> Hi Sergei,
>
> On Thu, 2016-03-17@13:58 +0300, Sergei Shtylyov wrote:
>> On 3/17/2016 12:41 PM, Alexey Brodkin wrote:
>>
>>> Following commit broke DW GMAC functionality on AXS10x boards:
>>> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=e34d65696d2ef13dc32f2a162556c86c461ed763
>>     Note that scripts/checkpatch.pl now enforces certain format for citing 
>> commits: commit <12-digit SHA1> ("<commit summary>").
> Frankly I haven't run that patch through checkpatch due to patch
> simplicity.
>
> But I'll try to not do any assumptions from now on and will try to
> use checkpatch for each and every thing I send :)
>
> Thanks for spotting all his!
>
> -Alexey

Sergei, do you mind providing a Ack/Reviewed-by on the patch below

-------->
>From 67216d835d8c2a5748ba1631c8bfc19da4fb87fa Mon Sep 17 00:00:00 2001
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 17 Mar 2016 12:41:52 +0300
Subject: [PATCH] ARC: axs10x - add Ethernet PHY description in .dts

Commit e34d65696d2e ("stmmac: create of compatible mdio bus for stmmac
driver") broke DW GMAC functionality on ARC AXS10x boards:

That's what happens on eth0 up:
  --------------------------->8------------------------
| libphy: PHY stmmac-0:ffffffff not found
| eth0: Could not attach to PHY
| stmmac_open: Cannot attach to PHY (error: -19)
  --------------------------->8------------------------

Simplest solution is to add PHY description in board's .dts.
And so we do here.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Rob Herring <robh at kernel.org>
Cc: Phil Reid <preid at electromag.com.au>
Cc: David S. Miller <davem at davemloft.net>
Cc: linux-kernel at vger.kernel.org
Cc: netdev at vger.kernel.org
Cc: stable at vger.kernel.org # 4.5
Cc: Sergei Shtylyov <sergei.shtylyov at cogentembedded.com>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/boot/dts/axs10x_mb.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arc/boot/dts/axs10x_mb.dtsi b/arch/arc/boot/dts/axs10x_mb.dtsi
index 44a578c10732..ab5d5701e11d 100644
--- a/arch/arc/boot/dts/axs10x_mb.dtsi
+++ b/arch/arc/boot/dts/axs10x_mb.dtsi
@@ -47,6 +47,14 @@
             clocks = <&apbclk>;
             clock-names = "stmmaceth";
             max-speed = <100>;
+            mdio0 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                compatible = "snps,dwmac-mdio";
+                phy1: ethernet-phy at 1 {
+                    reg = <1>;
+                };
+            };
         };
 
         ehci at 0x40000 {
-- 
2.5.0
