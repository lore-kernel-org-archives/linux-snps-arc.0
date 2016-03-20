From: robh@kernel.org (Rob Herring)
Date: Sat, 19 Mar 2016 19:42:12 -0500
Subject: [PATCH v3] ARC: [dts] Introduce Timer bindings
In-Reply-To: <1458278789-18924-1-git-send-email-vgupta@synopsys.com>
References: <20160317162421.GA21947@rob-hp-laptop>
 <1458278789-18924-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160320004212.GA8061@rob-hp-laptop>
To: linux-snps-arc@lists.infradead.org

On Fri, Mar 18, 2016@10:56:29AM +0530, Vineet Gupta wrote:
> ARC Timers have historically been probed directly.
> As precursor to start probing Timers thru DT introduce these bindings
> Note that to keep series bisectable, these bindings are not yet used in
> code.
> 
> Cc: Daniel Lezcano <daniel.lezcano at linaro.org>
> Cc: Rob Herring <robh at kernel.org>
> Cc: devicetree at vger.kernel.org
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---
> v3:
>  - Renamed Node name to avoid new warnings when unit address used w/o regs [Rob]
> v2:
>  - http://lists.infradead.org/pipermail/linux-snps-arc/2016-March/000653.html
>  - snps,arc-timer[0-1] folded into single snps-arc-timer	[Rob]
>  - Node name in DT example fixed:				[Rob]
>      "timer1: timer_clksrc {" -> timer at 1 {
>  - Introduced 64bit RTC in skeleton_hs.dtsi			[Vineet]
> v1:
>  - http://lists.infradead.org/pipermail/linux-snps-arc/2016-February/000447.html
> ---
>  .../devicetree/bindings/timer/snps,arc-timer.txt   | 32 ++++++++++++++++++++++
>  .../devicetree/bindings/timer/snps,archs-gfrc.txt  | 14 ++++++++++
>  .../devicetree/bindings/timer/snps,archs-rtc.txt   | 14 ++++++++++
>  arch/arc/boot/dts/abilis_tb10x.dtsi                | 14 ++++++++++
>  arch/arc/boot/dts/skeleton.dtsi                    | 14 ++++++++++
>  arch/arc/boot/dts/skeleton_hs.dtsi                 | 20 ++++++++++++++
>  arch/arc/boot/dts/skeleton_hs_idu.dtsi             | 14 ++++++++++
>  7 files changed, 122 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/snps,arc-timer.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/snps,archs-gfrc.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/snps,archs-rtc.txt

Acked-by: Rob Herring <robh at kernel.org>
