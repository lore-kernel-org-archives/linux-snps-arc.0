Return-Path: <SRS0=L+j5=L3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5EFC07E97
	for <linux-snps-arc@archiver.kernel.org>; Sat,  3 Jul 2021 18:23:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8105F61942
	for <linux-snps-arc@archiver.kernel.org>; Sat,  3 Jul 2021 18:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8105F61942
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=omqlI1vU6nIe5c6AL4DDpUmWQ1VLKPP5UZ1NXmc93Dc=; b=VCRf33VE18STD2
	2TljfVif1vaMhS2nlyMBnL8TG4G6JAywBGK7jIJoS4Jk8ZcKdqXuv4SiH13HB8+EAyUCattkkJaPt
	zPqyb57FEH6VJOSsyvHJSwwc55SBWEYs1l+dput1TQ0fce/GCA6KvRCcN/7WYEhS3/UogU+bxmLUp
	2shlDBTlxAFS/5hCW/X0auncD9hsx5FCk8VcDIEg4HGTmaQCyRiHrZmVrThlDcqnbd8/D8hw/BBvd
	KFKREvl+sgxcXKtbE8X2BVcofLX3erdwauMVtkKJUQvTHMe2fSCku1qwM5x7ETsKHjbUuhdlq+qbd
	MfhTIIUfZ+Pc0LmEh1wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzkIw-005DVa-VO; Sat, 03 Jul 2021 18:23:50 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzkIs-005DV0-Te
 for linux-snps-arc@lists.infradead.org; Sat, 03 Jul 2021 18:23:49 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 036C81C0004;
 Sat,  3 Jul 2021 18:23:38 +0000 (UTC)
Date: Sat, 3 Jul 2021 20:23:38 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: abrodkin@synopsys.com
Cc: openembedded-core@lists.openembedded.org,
 linux-snps-arc@lists.infradead.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [OE-core] [PATCH] dhcpcd: add ARC support
Message-ID: <YOCrKpzbRZjmJGLq@piout.net>
References: <20210702191521.28757-1-abrodkin@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210702191521.28757-1-abrodkin@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210703_112347_276545_AF85177B 
X-CRM114-Status: GOOD (  22.79  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hello Alexey,

On 02/07/2021 12:15:21-0700, Alexey Brodkin via lists.openembedded.org wrote:
> This retrofits ARC support from upstream [1].
> Should be a part of the next release of "dhcpcd".
> 
> https://github.com/NetworkConfiguration/dhcpcd/commit/82386110e67cf75c224e9817fce55e6b0f143266
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>  meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.0.bb   |  1 +
>  ...rc-privsep-linux.c-add-support-for-arc-28.patch | 60 ++++++++++++++++++++++
>  2 files changed, 61 insertions(+)
>  create mode 100644 meta/recipes-connectivity/dhcpcd/files/0002-src-privsep-linux.c-add-support-for-arc-28.patch
> 
> diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.0.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.0.bb
> index 56fcf5cc0b..5be480eb03 100644
> --- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.0.bb
> +++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.0.bb
> @@ -13,6 +13,7 @@ UPSTREAM_CHECK_URI = "https://roy.marples.name/downloads/dhcpcd/"
>  
>  SRC_URI = "https://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
>             file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch \
> +           file://0002-src-privsep-linux.c-add-support-for-arc-28.patch \
>             file://dhcpcd.service \
>             file://dhcpcd@.service \
>             "
> diff --git a/meta/recipes-connectivity/dhcpcd/files/0002-src-privsep-linux.c-add-support-for-arc-28.patch b/meta/recipes-connectivity/dhcpcd/files/0002-src-privsep-linux.c-add-support-for-arc-28.patch
> new file mode 100644
> index 0000000000..ec895143d8
> --- /dev/null
> +++ b/meta/recipes-connectivity/dhcpcd/files/0002-src-privsep-linux.c-add-support-for-arc-28.patch
> @@ -0,0 +1,60 @@
> +From 82386110e67cf75c224e9817fce55e6b0f143266 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Mon, 8 Feb 2021 07:23:54 +0100
> +Subject: [PATCH] src/privsep-linux.c: add support for arc (#28)
> +
> +Fix the following build failure:
> +
> +privsep-linux.c:206:4: error: #error "Platform does not support seccomp filter yet"
> + #  error "Platform does not support seccomp filter yet"
> +    ^~~~~
> +In file included from privsep-linux.c:36:
> +privsep-linux.c:213:38: error: 'SECCOMP_AUDIT_ARCH' undeclared here (not in a function); did you mean 'SECCOMP_ALLOW_ARG'?
> +  BPF_JUMP(BPF_JMP + BPF_JEQ + BPF_K, SECCOMP_AUDIT_ARCH, 1, 0),
> +                                      ^~~~~~~~~~~~~~~~~~
> +
> +It should be noted that AUDIT_ARCH_{ARCOMPACT,ARCV2} is only defined
> +since kernel 5.2 and
> +https://github.com/torvalds/linux/commit/67f2a8a29311841ba6ab9b0e2d1b8f1e9978cd84
> +
> +Detection of arc compact and arc v2 have been "copy/pasted" from
> +https://github.com/wbx-github/uclibc-ng/commit/afab56958f1cbb47b831ee3ebff231dfbae74af2
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/d29083700a80dd647621eed06faeeae03f0587d3
> +

I did run that through the autobuilders and it is working fine but this
is missing an Upstream-Status tag.

> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/privsep-linux.c | 16 ++++++++++++++++
> + 1 file changed, 16 insertions(+)
> +
> +diff --git a/src/privsep-linux.c b/src/privsep-linux.c
> +index 402667af..21d41a9a 100644
> +--- a/src/privsep-linux.c
> ++++ b/src/privsep-linux.c
> +@@ -149,6 +149,22 @@ ps_root_sendnetlink(struct dhcpcd_ctx *ctx, int protocol, struct msghdr *msg)
> + #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_I386
> + #elif defined(__x86_64__)
> + #  define SECCOMP_AUDIT_ARCH AUDIT_ARCH_X86_64
> ++#elif defined(__arc__)
> ++#  if defined(__A7__)
> ++#    if (BYTE_ORDER == LITTLE_ENDIAN)
> ++#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_ARCOMPACT
> ++#    else
> ++#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_ARCOMPACTBE
> ++#    endif
> ++#  elif defined(__HS__)
> ++#    if (BYTE_ORDER == LITTLE_ENDIAN)
> ++#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_ARCV2
> ++#    else
> ++#      define SECCOMP_AUDIT_ARCH AUDIT_ARCH_ARCV2BE
> ++#    endif
> ++#  else
> ++#    error "Platform does not support seccomp filter yet"
> ++#  endif
> + #elif defined(__arm__)
> + #  ifndef EM_ARM
> + #    define EM_ARM 40
> +-- 
> +2.16.2
> +
> -- 
> 2.16.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#153501): https://lists.openembedded.org/g/openembedded-core/message/153501
> Mute This Topic: https://lists.openembedded.org/mt/83947428/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
