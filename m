From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Fri, 24 Jun 2016 09:55:55 +0200
Subject: [PATCH V3] clocksource/drivers/arc: Convert init function to
 return error
In-Reply-To: <576CE6CA.8020808@synopsys.com>
References: <5763BC00.1030101@synopsys.com>
 <1466158167-23126-1-git-send-email-daniel.lezcano@linaro.org>
 <576CB1B6.9090003@synopsys.com> <576CD60D.1020103@linaro.org>
 <576CE6CA.8020808@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <576CE78B.6000305@linaro.org>
To: linux-snps-arc@lists.infradead.org

On 06/24/2016 09:52 AM, Vineet Gupta wrote:
> On Friday 24 June 2016 12:11 PM, Daniel Lezcano wrote:
>> Do you agree to move the driver to drivers/clocksource, so we can add the
>> COMPILE_TEST option ?
>
> Sure, this will require some common header adjustments etc. After the current
> fire-drill I'm pulled into ATM, I'll work on it next week'ish !

Great, thanks !


-- 
  <http://www.linaro.org/> Linaro.org ? Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
