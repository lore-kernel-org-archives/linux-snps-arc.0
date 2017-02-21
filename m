From: Vladislav.Zakharov@synopsys.com (Vlad Zakharov)
Date: Tue, 21 Feb 2017 11:13:35 +0000
Subject: cpufreq: get cpufreq_frequency_table from clk driver
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1487675614.25108.30.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hello,

I am trying to implement a cpufreq driver for ARCHS cpu.

And I faced with one question I am not able to answer myself. cpufreq framework allows us using cpufreq frequency tables
that store available for current policy range of frequencies with any additional data. As I understand for example it
can be clock configurations for this particular frequency.

Also I have a clk driver that manages actual cpu frequency. In fact it uses very similar tables that contain frequencies
and corresponding values of clock configurations registers that are to be set up with current frequency.

So the question is can I get such tables from clk driver somehow? I would be very convenient: this tables differs for
ARCHS CPU. E.g. on different boards it is clocked by different PLLs and oscillators.

Do you know any way to get the tables from clk driver? Any suggestions or comments might be very helpful.

Thanks!

-- 
Best regards,
Vlad Zakharov <vzakhar at synopsys.com>
