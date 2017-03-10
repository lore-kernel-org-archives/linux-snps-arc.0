From: Vladislav.Zakharov@synopsys.com (Vlad Zakharov)
Date: Fri, 10 Mar 2017 09:17:21 +0000
Subject: update timer frequencies
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1489137441.2333.46.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hello,

I am trying to implement a cpufreq driver for ARC CPUs.?
The point is that ARC timers (including those are used for timekeeping) are driven by the same clock as ARC CPU core(s).

So if cpufreq driver changes CPU frequency timers frequency also updates.?
I added notification handler to ARC timer driver were I attempted to update clocksource frequency with
"__clocksource_update_freq_hz()" but I found that actually the frequency didn't update.?

During my further investigation I mentioned that timekeeping framework doesn't allow frequency changes for more than
11%. This is quiet frustratingly: ARC cores supports such adjustments themselves but current framework API doesn't give
us a chance to use this functionality and in fact it even forbids CPU frequency changes in runtime at all.

Maybe I am mistaken and there is some way to get this going? Or maybe we can add some minor changes to timekeeping
framework to resolve this issue (special flag that allows such changes or something like this?).

Thanks.

-- 
Best regards,
Vlad Zakharov <vzakhar at synopsys.com>
