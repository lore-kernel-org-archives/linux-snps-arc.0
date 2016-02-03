From: robh@kernel.org (Rob Herring)
Date: Wed, 3 Feb 2016 09:39:15 -0600
Subject: [PATCH 2/9] ARC: [dts] Introduce Timer bindings
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F4E87B33@us01wembx1.internal.synopsys.com>
References: <1454410739-24444-1-git-send-email-vgupta@synopsys.com>
 <1454410739-24444-3-git-send-email-vgupta@synopsys.com>
 <20160202220353.GA10273@rob-hp-laptop>
 <C2D7FE5348E1B147BCA15975FBA23075F4E87B33@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAL_Jsq+15SERAN8B5vcKVG=O8=pLLw5_0-p2STHjyGUu7mx-7Q@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Wed, Feb 3, 2016@2:04 AM, Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
> Hi Rob,
>
> On Wednesday 03 February 2016 03:33 AM, Rob Herring wrote:
>> On Tue, Feb 02, 2016@04:28:52PM +0530, Vineet Gupta wrote:
>>> +Required properties:
>>> +
>>> +- compatible : should be "snps,arc-timer0"
>>
>> timer0 and timer1 are different h/w blocks, not just different
>> instances?
>
> Functionality wise they are identical (only the address of aux regs used to
> program them are different). Either can be configured to interrupt-on-limit or
> free-run-and-wrap-around. So we can indeed consider them 2 instances. ARC Linux
> uses timer0 for tick handling, timer1 for gtod.
>
> Do you prefer they not be differentiated as timer0 and timer1 ?
>
> So we have
>
> CLOCKSOURCE_OF_DECLARE(arc_clkevt, "snps,arc-timer0", arc_clockevent_setup);
> CLOCKSOURCE_OF_DECLARE(arc_timer1, "snps,arc-timer1", arc_cs_setup_timer1);
>
> I don't know how to achieve above, by keeping the DT names the same.

You just need a single CLOCKSOURCE_OF_DECLARE which will be called
twice. On the first call, setup one timer and on the 2nd call setup
the other one. IIRC the sp804 timer has something similar.

You'll need a unit address in the node name to distinguish them.

>
>>
>>> +- interrupts : single Interrupt going into parent intc
>>> +           (16 for ARCHS cores, 3 for ARC700 cores)
>>> +- clocks     : phandle to the source clock
>>> +
>>> +Optional properties:
>>> +
>>> +- interrupt-parent : phandle to parent intc
>>> +
>>> +Example:
>>> +
>>> +    timer0: timer_clkevt {
>>
>> just "timer" for node name. clkevt is a Linuxism.
>
> OK. So to document that this is for clockevent, change the label ?

That shouldn't be documented in the DT at all.

>
> timer_clkevent: timer {
>
>>
>>> +            compatible = "snps,arc-timer0";
>>> +            interrupts = <3>;
>>> +            interrupt-parent = <&core_intc>;
>>> +            clocks = <&timer0_clk>;
>>> +    };
>>> diff --git a/Documentation/devicetree/bindings/timer/snps,arc-timer1.txt b/Documentation/devicetree/bindings/timer/snps,arc-timer1.txt
>>> new file mode 100644
>>> index 000000000000..4886192ce2f2
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/timer/snps,arc-timer1.txt
>>> @@ -0,0 +1,17 @@
>>> +Synopsys ARC Free Running Local 32-bit Timer
>>> +- Found on all ARC CPUs (ARC700/ARCHS)
>>> +- Mandatory clocksource provider on ARC700
>>> +- Optional clocksource provider on UP ARC HS CPUs
>>> +  (and if better timer archs-rtc not available in SoC)
>>> +
>>> +Required properties:
>>> +
>>> +- compatible : should be "snps,arc-timer1"
>>> +- clocks     : phandle to the source clock
>>
>> No interrupt because it doesn't have one or you use this as a
>> clocksource and don't need it?
>
> Latter !

Then you should have the interrupt in the DT anyway.

Rob
