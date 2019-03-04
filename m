From: evgeniy.didin@synopsys.com (Evgeniy Didin)
Date: Mon, 4 Mar 2019 17:41:12 +0000
Subject: AGL on Synopsys ARC HSDK board
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <b0706ee3eb3da1ab612566d3d641a6794920d9d6.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi AGL community,

We would like to add Synopsys ARC HS Development Kit (HSDK) board [1] as one
of supported boards to upstream AGL. HSDK board is a SOC with 4 ARC HS38 cores
and Vivante GPU. Currently flounder_6.0.4 release with additional patches is
working well on HSDK board. Most of changes I have made were related 
with updating packages in poky and meta-openembedded for compatibility 
with glibc2.28 and GCC 8*. Also I was forced to upgrade Weston to 4.0.0 
for proper support of separate video output devices 
(We use external USB-HDMI adapter).
The rest remained unchanged or was slightly changed.

I'm wondering which branch/tag should be used for preparing patches that
will add support of our board in upstream AGL?

[1] https://www.synopsys.com/dw/ipdir.php?ds=arc-hs-development-kit

Thanks in advance and best regards,
Evgeniy Didin
