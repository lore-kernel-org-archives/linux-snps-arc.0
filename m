From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 24 Jun 2016 13:22:42 +0530
Subject: [PATCH V3] clocksource/drivers/arc: Convert init function to
 return error
In-Reply-To: <576CD60D.1020103@linaro.org>
References: <5763BC00.1030101@synopsys.com>
 <1466158167-23126-1-git-send-email-daniel.lezcano@linaro.org>
 <576CB1B6.9090003@synopsys.com> <576CD60D.1020103@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <576CE6CA.8020808@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Friday 24 June 2016 12:11 PM, Daniel Lezcano wrote:
> Do you agree to move the driver to drivers/clocksource, so we can add the
> COMPILE_TEST option ?

Sure, this will require some common header adjustments etc. After the current
fire-drill I'm pulled into ATM, I'll work on it next week'ish !

-Vineet
