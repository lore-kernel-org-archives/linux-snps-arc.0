From: noamca@mellanox.com (Noam Camus)
Date: Fri, 8 Apr 2016 08:58:54 +0000
Subject: [PATCH v8 2/3] clocksource: Add NPS400 timers driver
In-Reply-To: <20160407165751.GC9188@linaro.org>
References: <1459707299-31564-1-git-send-email-noamca@mellanox.com>
 <1459707299-31564-3-git-send-email-noamca@mellanox.com>,
 <20160407165751.GC9188@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <HE1PR05MB16254CDCFCF9A36D3BE4AE73AA910@HE1PR05MB1625.eurprd05.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

>From: Daniel Lezcano <daniel.lezcano at linaro.org>
>Sent: Thursday, April 7, 2016 7:57 PM

>> Add internal tick generator which is shared by all cores.
>> Each cluster of cores view it through dedicated address.
>> This is used for SMP system where all CPUs synced by same
>> clock source.

>Acked-by: Daniel Lezcano <daniel.lezcano at linaro.org>

Thank you Daniel, could you review accompanied header at SOC directory.
This header is at previous patch on same set of this one.
https://lkml.org/lkml/2016/4/3/187

Regards,
Noam
