From: noamc@ezchip.com (Noam Camus)
Date: Tue, 3 Nov 2015 15:32:02 +0000
Subject: [PATCH v1 20/20] ARC: Add eznps platform to Kconfig and Makefile
In-Reply-To: <563743CB.2090001@synopsys.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446297327-16298-21-git-send-email-noamc@ezchip.com>
 <563743CB.2090001@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <DB5PR02MB11414328B771A1312E5258EDD62B0@DB5PR02MB1141.eurprd02.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

>From: Vineet Gupta [mailto:Vineet.Gupta1 at synopsys.com] 
>Sent: Monday, November 02, 2015 1:07 PM

>> +ifdef CONFIG_ARC_PLAT_EZNPS
>> +ifeq ($(KBUILD_SRC),)
>> +KBUILD_CPPFLAGS += -Iarch/arc/plat-eznps/include else KBUILD_CPPFLAGS 
>> ++= -I$(srctree)/arch/arc/plat-eznps/include
>> +endif
>> +endif

>Are you sure you need special handling for out-of-tree build. The $srctree) version shd work just fine for both !
Thanks, I will use $(srctree) for both

- Noam
