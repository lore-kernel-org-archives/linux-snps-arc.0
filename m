From: peppe.cavallaro@st.com (Giuseppe CAVALLARO)
Date: Tue, 31 Jan 2017 14:46:32 +0100
Subject: stmmac: GMAC_RGSMIIIS reports bogus values
In-Reply-To: <1485869040.2706.15.camel@synopsys.com>
References: <1478189833.4072.65.camel@synopsys.com>
 <a1f114cc-6120-154c-a3f7-3e0389d38e36@st.com>
 <1485369563.7117.81.camel@synopsys.com>
 <1485512586.2693.35.camel@synopsys.com>
 <28d0ab2c-eb68-a520-e59a-83b15700fe44@st.com>
 <1485869040.2706.15.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <ce57ab03-ca3f-405e-a5b6-c69e311536b6@st.com>
To: linux-snps-arc@lists.infradead.org

Hello Alexey

On 1/31/2017 2:24 PM, Alexey Brodkin wrote:
> Hi Giuseppe,
>
> On Tue, 2017-01-31@10:55 +0100, Giuseppe CAVALLARO wrote:
>> On 1/27/2017 11:23 AM, Alexey Brodkin wrote:
>>>
>>> That's why my initial proposal was to ignore whatever we read from this register
>>> if we have MDIO bus instantiated already.
>>
>> sorry for my late reply, I agree with this approach, according to the
>> HW and platform configuration the driver has to understand and then
>> work to use either SMA or PCS module.
>
> I already submitted another solution which IMHO is much cleaner and appropriate,
> see David has it already in master tree here:
> http://git.kernel.org/cgit/linux/kernel/git/davem/net.git/commit/?id=0a764db103376cf69d04449b10688f3516cc0b88
>

it's ok, thx for that

Peppe

> -Alexey
>
