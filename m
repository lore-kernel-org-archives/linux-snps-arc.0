From: jogo@openwrt.org (Jonas Gorski)
Date: Fri, 6 Nov 2015 11:57:12 +0100
Subject: "compatible" and "model" properties in .dts for ARC boards
In-Reply-To: <82634871.ymdF4uL7TN@wuerfel>
References: <1446749422.3151.29.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F44D0C84@IN01WEMBXA.internal.synopsys.com>
 <82634871.ymdF4uL7TN@wuerfel>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <563C8788.9090301@openwrt.org>
To: linux-snps-arc@lists.infradead.org

On 06.11.2015 09:59, Arnd Bergmann wrote:
> On Friday 06 November 2015 04:45:24 Vineet Gupta wrote:
>>>
>>> During OpenWRT upsreaming process one interesting topic was raised.
>>> See in the middle of https://lists.openwrt.org/pipermail/openwrt-devel/2015-November/036959.html
>>>
>>> In Device Tree descriptions for our boards we don't use "model" property
>>> even though it is a required one as specified by ePAPR, see
>>> http://free-electrons.com/~thomas/pub/Power_ePAPR_APPROVED_v1.0.pdf,
>>> page 39 "Table 3-1 Root node properties".
>>>
>>> Instead we put 2 items in "compatible" property.
>>>
>>> For example:
>>> ------------------->8----------------
>>> compatible = "snps,axs101", "snps,arc-sdp";
>>> ------------------->8----------------
>>>
>>> And from ePAPR standpoint it makes sense to split contents of that "compatible"
>>> property in 2:
>>> ------------------->8----------------
>>> compatible = "snps,arc-sdp";
>>> model = "snps,axs101";
>>> ------------------->8----------------
>>
>> It seems model is just a descriptive label and we can surely add them to existing DT.
>> compatible on the other hand is more fundamental used for exact comparisons etc
>> and follows the vendor,device convention.
>> It is pretty common for compatible to have multiple strings for exactly the same
>> reason as I have them here. Both axs101 and axs103 are based on sdp thus we want
>> the ability to have both pieces of information and use as needed.
> 
> Correct.
> 
> The model should also be a human readable name of the machine, just one
> string like "Synapsys AXS101 Development Board" (or whatever that is called).

This contradicts ePAPR, which says the model's recommended* format is the same as
the compatible one's (<vendor>,<model>). Most PowerPC and some MIPS dts files
follow that, while ARM(64) uses the free text form.

To me it looks like the intended usage was
model = <actual_model>; compatible = <platform>;
but the actual usage in arm is
model = <human readable string>; compatible = <actual_model>, <platform>;

Of course for changing this in the existing dts files it might be a bit late, but it
would be good to decide which of these two is the actually expected format. 

It also is a required property, and we have a few boards not having a model property,
including the example in Documentation/devicetree/usage-model.txt.


Jonas

* compatible strings are also only "recommended" to be in that format.
