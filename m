From: stephane.desneux@iot.bzh (Stephane Desneux)
Date: Tue, 5 Mar 2019 11:58:34 +0100
Subject: [agl-discussions] AGL on Synopsys ARC HSDK board
In-Reply-To: <b0706ee3eb3da1ab612566d3d641a6794920d9d6.camel@synopsys.com>
References: <b0706ee3eb3da1ab612566d3d641a6794920d9d6.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <301b8692-5c89-6b9a-3fb0-3f0efdcb2b60@iot.bzh>
To: linux-snps-arc@lists.infradead.org

Hi Evgeniy,

Alignment on Yocto releases is currently as follows:

* AGL/FF (6.x) is aligned on Yocto/Rocko (2.4)
* AGL/GG (7.x), released recently, is also aligned on Yocto/Rocko (2.4)
* AGL/HH (to be released in June or July) will be aligned on Yocto/Thud (2.6)

For now, AGL master branch is still aligned on rocko but there's an ongoing
effort to bump to thud. See [1] to keep synced. Some early builds exist for qemu
and we're currently in the process of bumping ref boards BSPs (Intel, Renesas).

Given the components you had to backport to rocko, I'm quite sure that aligning
on thud is a good option for you: it will be easier to push your patches *after*
AGL alignment on thud. Hopefully, you shouldn't have to wait for a long time :)

Best regards,

[1] https://jira.automotivelinux.org/browse/SPEC-1837
---
Stephane Desneux - CTO - IoT.bzh
stephane.desneux at iot.bzh - www.iot.bzh

On 04/03/2019 18:41, Evgeniy Didin wrote:
> Hi AGL community,
> 
> We would like to add Synopsys ARC HS Development Kit (HSDK) board [1] as one
> of supported boards to upstream AGL. HSDK board is a SOC with 4 ARC HS38 cores
> and Vivante GPU. Currently flounder_6.0.4 release with additional patches is
> working well on HSDK board. Most of changes I have made were related 
> with updating packages in poky and meta-openembedded for compatibility 
> with glibc2.28 and GCC 8*. Also I was forced to upgrade Weston to 4.0.0 
> for proper support of separate video output devices 
> (We use external USB-HDMI adapter).
> The rest remained unchanged or was slightly changed.
> 
> I'm wondering which branch/tag should be used for preparing patches that
> will add support of our board in upstream AGL?
> 
> [1] https://www.synopsys.com/dw/ipdir.php?ds=arc-hs-development-kit
> 
> Thanks in advance and best regards,
> Evgeniy Didin
> 
> 
> 
> _______________________________________________
> automotive-discussions mailing list
> automotive-discussions at lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/automotive-discussions
> 
