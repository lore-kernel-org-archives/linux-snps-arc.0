From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 25 Jan 2017 10:47:56 -0800
Subject: stmmac: GMAC_RGSMIIIS reports bogus values
In-Reply-To: <1485369563.7117.81.camel@synopsys.com>
References: <1478189833.4072.65.camel@synopsys.com>
 <a1f114cc-6120-154c-a3f7-3e0389d38e36@st.com>
 <1485369563.7117.81.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <c327164e-e544-ecd8-3501-44e68942b725@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 01/25/2017 10:39 AM, Alexey Brodkin wrote:
>> Also I wonder if, other version of the stmmac worked on this platform
>> before.
> It did work and still works. The only problem is we're getting
> a lot of noise now about bogus link status change. That's because
> this info is now in pr_info() compared to being previously in pr_debug().

While we sort out the real technical details, it is OK to go back to pr_debug
please - print_once or some such !
There is lot of useless console noise when we run any networking loads here !

echo 0 >  /proc/sys/kernel/printk

only helps in that it is not printed on console but clobbers dmesg nonetheless !

Thx,
-Vineet
