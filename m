Return-Path: <SRS0=45Fv=LO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8269C48BDF
	for <linux-snps-arc@archiver.kernel.org>; Sun, 20 Jun 2021 21:45:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A5B660720
	for <linux-snps-arc@archiver.kernel.org>; Sun, 20 Jun 2021 21:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A5B660720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bVYqaQi07iTVvQztXvshJi0V1Ak9RFKZwMAG0GZof6s=; b=IL0UsiMPeFknjp
	2R99sJnEXOLUyQ3WMNLGTQ7TATxv91nEG+48tzktKBfhcd28rBohS9P+gmKb7I5lsBMI2jx9wdpmu
	BdI/5HuHtT7xNG3YYhIpiGgXcoNDxR1waC8WuN34/L90GKZ4OrEPGgO0BXXhV7H1ksjHguVydjj9B
	g7+AJybvPxmGHqSYGDu3ZA47dbm73WDqNOnIyNSh8INzdrYC+LH/LWdF0baTM4EYqILivW0FmMdhq
	r2WX3qFShPtB88H4cwExmNMjQYPfb3Oz7TH6inFINLfk862aggBQRuIx6ADEp80lGVmg72QCaVrzB
	EJjHdfQHORS/G6SchPJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lv5FV-001edo-Mw; Sun, 20 Jun 2021 21:45:01 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lv5FS-001edE-Nf
 for linux-snps-arc@lists.infradead.org; Sun, 20 Jun 2021 21:45:00 +0000
Received: by mail-qt1-x833.google.com with SMTP id d9so2540652qtx.8
 for <linux-snps-arc@lists.infradead.org>; Sun, 20 Jun 2021 14:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NMywLkUyXaWI1hVkmzn4pylrvFhgsgDffX1J36Otxq0=;
 b=CRQ7Z7i03LwRIYS3lDRGT1g5yee73rmC40F7KK26gDwuCKMdA+SUCWebNNRwKJp36k
 8+rZJ84s7M5m4ddaXt1abNIwNsYqWX5C5D9BwOGxAsVFNog49I56Gz8aLiwj6pJta27A
 rqEFpZ7elhf3gxG4VVM6AhpkrYeHWEYspoazMVDGKMYFvcmABVuKpFWeB2dJo82Y9gkH
 4QoBHaC7fZoU2/1fIl+eymSlR2bKo+/sxVTBPlUfI/OUVQ/1ytN/aSy1g2djWmcPmj6I
 BA7pCRemX9IHjtg1OXCGbIfEUeGtrV7GX0NjdTqYG0/44TYKcWD6CcnbYvxbhXGEg3uN
 Hl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NMywLkUyXaWI1hVkmzn4pylrvFhgsgDffX1J36Otxq0=;
 b=lEbKalbYXI8Q+rixjvtE6QS8O7PnxgL9uHfyPO8huYbvHxg8DYTQT39KTYO3wdnWZ+
 WuHEk+DOFvd68XSzyxGINaTxK+PMWurXYXi0clK03VXGdALfmNQorFLYw0MnvECsourR
 mMJ3ehUY8fm4XnLUS3nRahmEg3hG+/IHDLdG0AcuctQayo1NcnjKhHntT+lS0wTyg1Pb
 yBzVNd/yyjmm0NJNE27Pm8hsS5Un2lJClFlZTSlUfw99G969osoYq086yBMUZObLo5o3
 IebSyGOSC4cpX7YJL5XReb8coUbHBERL/GpeNJGnpniXHEFhGjaTLNGTrwj2KYPd2Cyv
 KBdg==
X-Gm-Message-State: AOAM531E1WMImK5i2VycYPtTp+OlrLR5pWyLb2ECY2PV/9K3zxCYLxkp
 yqRQAc9UliWVMN/dlwgsUSGvjYKoRQt0nsKvnlk=
X-Google-Smtp-Source: ABdhPJwW+ihuqFTGFUQVNJq6hm/NRLvsu0TQ2rOTlNt3EgzC5vCGDu6HdCsna6uddBGxC/+eHafskL/5a84XIyeqFaA=
X-Received: by 2002:ac8:4b4b:: with SMTP id e11mr10029370qts.289.1624225497060; 
 Sun, 20 Jun 2021 14:44:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210620185156.10634-1-abrodkin@synopsys.com>
In-Reply-To: <20210620185156.10634-1-abrodkin@synopsys.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 20 Jun 2021 14:44:31 -0700
Message-ID: <CAMKF1sqxeM1JbM3Q=ExcCgQvdHTisujdYb1WfQhHg-89oM8FAw@mail.gmail.com>
Subject: Re: [PATCH] gcc: Apply multilib fix to ARC as well
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, 
 linux-snps-arc@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210620_144458_835431_39B80BB8 
X-CRM114-Status: GOOD (  24.79  )
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

this looks fine,

On Sun, Jun 20, 2021 at 11:52 AM Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:
>
> W/o that hack target GCC assume existence of per-mcpu folders,
> which are missing.
>
> In particular G++ failed to find "bits/c++config.h":
> ------------------>8------------------
>  root@hsdk:~# cat test.cc
>  #include <cstdlib>
>
>  int myfunc(void)
>  {
>  }
>
>  root@hsdk:~# g++ -c test.cc -v
>  Using built-in specs.
>  COLLECT_GCC=g++
>  Target: arc-oe-linux
>  Configured with: ../../../../../../work-shared/gcc-11.1.0-r0/gcc-11.1.0/configure --build=x86_64-linux --host=arc-oe-linux --target=arc-oe-linux --prefix=/usr --exec_prefix=/usr -x
>  Thread model: posix
>  Supported LTO compression algorithms: zlib
>  gcc version 11.1.1 20210523 (GCC)
>  COLLECT_GCC_OPTIONS='-c' '-v' '-shared-libgcc' '-mcpu=hs38_linux'
>   /usr/libexec/gcc/arc-oe-linux/11.1.1/cc1plus -quiet -v -imultilib hs38_linux -D_GNU_SOURCE test.cc -quiet -dumpbase test.cc -dumpbase-ext .cc -mcpu=hs38_linux -version -o /tmp/ccs
>  GNU C++17 (GCC) version 11.1.1 20210523 (arc-oe-linux)
>          compiled by GNU C version 11.1.1 20210523, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version none
>  GGC heuristics: --param ggc-min-expand=99 --param ggc-min-heapsize=129242
>  ignoring nonexistent directory "/usr/lib/gcc/arc-oe-linux/11.1.1/../../../../include/c++/11.1.1/arc-oe-linux/hs38_linux"
>  ignoring nonexistent directory "/usr/lib/arc-oe-linux/11.1.1/include"
>  ignoring nonexistent directory "/usr/local/include"
>  ignoring nonexistent directory "/usr/lib/gcc/arc-oe-linux/11.1.1/../../../../arc-oe-linux/include"
>  #include "..." search starts here:
>  #include <...> search starts here:
>   /usr/lib/gcc/arc-oe-linux/11.1.1/../../../../include/c++/11.1.1
>   /usr/lib/gcc/arc-oe-linux/11.1.1/../../../../include/c++/11.1.1/backward
>   /usr/lib/gcc/arc-oe-linux/11.1.1/include
>   /usr/lib/gcc/arc-oe-linux/11.1.1/include-fixed
>   /usr/include
>  End of search list.
>  GNU C++17 (GCC) version 11.1.1 20210523 (arc-oe-linux)
>          compiled by GNU C version 11.1.1 20210523, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version none
>  GGC heuristics: --param ggc-min-expand=99 --param ggc-min-heapsize=129242
>  Compiler executable checksum: 6df2f07a822bfbbb80a61414b712b75d
>  In file included from test.cc:1:
>  /usr/include/c++/11.1.1/cstdlib:41:10: fatal error: bits/c++config.h: No such file or directory
>     41 | #include <bits/c++config.h>
>        |          ^~~~~~~~~~~~~~~~~~
>  compilation terminated.
> ------------------>8------------------
>
> Note "ignoring nonexistent directory "/usr/lib/gcc/arc-oe-linux/11.1.1/../../../../include/c++/11.1.1/arc-oe-linux/hs38_linux"
> message which is being used by GCC due to the fact of implicit "-mcpu=hs38_linux".
>
> In fact this header "bits/c++config.h" is located in "/usr/lib/gcc/arc-oe-linux/11.1.1/../../../../include/c++/11.1.1/arc-oe-linux"
> on target.
>
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>  .../gcc/gcc/0004-64-bit-multilib-hack.patch        | 23 +++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch b/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch
> index 789f57343b..8184e68743 100644
> --- a/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch
> +++ b/meta/recipes-devtools/gcc/gcc/0004-64-bit-multilib-hack.patch
> @@ -1,4 +1,4 @@
> -From 28e7c312b1292ca216d4b54ec9f6b7ac055907a8 Mon Sep 17 00:00:00 2001
> +From 2fa5c93641b75a662839c1b6eee172b6c481c70e Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 29 Mar 2013 09:10:06 +0400
>  Subject: [PATCH] 64-bit multilib hack.
> @@ -19,7 +19,7 @@ and be able to patch these entries with a complete set of correct paths but this
>  don't have such code at this point. This is something the target gcc recipe should do
>  and override these platform defaults in its build config.
>
> -Do same for riscv64 and aarch64
> +Do same for riscv64, aarch64 & arc
>
>  RP 15/8/11
>
> @@ -30,11 +30,12 @@ Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
>  Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>  ---
>   gcc/config/aarch64/t-aarch64-linux |  8 ++++----
> + gcc/config/arc/t-multilib-linux    |  4 ++--
>   gcc/config/i386/t-linux64          |  6 ++----
>   gcc/config/mips/t-linux64          | 10 +++-------
>   gcc/config/riscv/t-linux           |  6 ++++--
>   gcc/config/rs6000/t-linux64        |  5 ++---
> - 5 files changed, 15 insertions(+), 20 deletions(-)
> + 6 files changed, 17 insertions(+), 22 deletions(-)
>
>  diff --git a/gcc/config/aarch64/t-aarch64-linux b/gcc/config/aarch64/t-aarch64-linux
>  index 241b0ef20b6..a7dadb2d64f 100644
> @@ -53,6 +54,22 @@ index 241b0ef20b6..a7dadb2d64f 100644
>
>  -MULTILIB_OSDIRNAMES += mabi.ilp32=../libilp32$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu_ilp32)
>  +#MULTILIB_OSDIRNAMES += mabi.ilp32=../libilp32$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu_ilp32)
> +diff --git a/gcc/config/arc/t-multilib-linux b/gcc/config/arc/t-multilib-linux
> +index fc3fff640a2..d58e28f6df8 100644
> +--- a/gcc/config/arc/t-multilib-linux
> ++++ b/gcc/config/arc/t-multilib-linux
> +@@ -16,9 +16,9 @@
> + # along with GCC; see the file COPYING3.  If not see
> + # <http://www.gnu.org/licenses/>.
> +
> +-MULTILIB_OPTIONS = mcpu=hs/mcpu=archs/mcpu=hs38/mcpu=hs38_linux/mcpu=arc700/mcpu=nps400
> ++#MULTILIB_OPTIONS = mcpu=hs/mcpu=archs/mcpu=hs38/mcpu=hs38_linux/mcpu=arc700/mcpu=nps400
> +
> +-MULTILIB_DIRNAMES = hs archs hs38 hs38_linux arc700 nps400
> ++#MULTILIB_DIRNAMES = hs archs hs38 hs38_linux arc700 nps400
> +
> + # Aliases:
> + MULTILIB_MATCHES += mcpu?arc700=mA7
>  diff --git a/gcc/config/i386/t-linux64 b/gcc/config/i386/t-linux64
>  index d288b093522..7b5980a9d21 100644
>  --- a/gcc/config/i386/t-linux64
> --
> 2.16.2
>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
