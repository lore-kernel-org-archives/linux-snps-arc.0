From: noamc@ezchip.com (Noam Camus)
Date: Sun, 27 Dec 2015 21:41:05 +0000
Subject: [PATCH v5 04/20] clocksource: Add NPS400 timers driver
In-Reply-To: <201512272200.4NfpC6DB%fengguang.wu@intel.com>
References: <1451222619-3610-5-git-send-email-noamc@ezchip.com>,
 <201512272200.4NfpC6DB%fengguang.wu@intel.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <HE1PR02MB13872391DF4E87BD2A7B7EC6D6FA0@HE1PR02MB1387.eurprd02.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

>From: kbuild test robot <lkp at intel.com>
>Sent: Sunday, December 27, 2015 4:55 PM

>[if your patch is applied to the wrong git tree, please drop us a note to help improving the system]
>Hi Noam,

>[auto build test ERROR on arc/for-next]
>[also build test ERROR on v4.4-rc6 next-20151223]

>url:    https://github.com/0day-ci/linux/commits/Noam-Camus/Adding-plat-eznps-to-ARC/20151227-220433
>base:   https://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc for-next
>config: i386-allmodconfig (attached as .config)
>reproduce:
>       # save the attached .config to linux build tree
>      make ARCH=i386

This is meant for ARC only (not i386), I will add to the Kconfig file a dependency on my platform. 

-Noam
