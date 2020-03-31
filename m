Return-Path: <SRS0=nidH=5Q=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A11C43331
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 10:06:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09220206DB
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Mar 2020 10:06:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CPG0JavI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jqR8WGSO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09220206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Q0fkH6r8MId6PehF4lp754UsUtdrn5QC+wDvBg8jeo=; b=CPG0JavIFlIFfh
	sz+oxrnEw129him5ZOw6RV/14d4lTVwMgz/s/0h4L35heLJ8JmuXgzw7/o1cpPHRB0bpkMwwRFgjv
	0OAI3zya4Ue15hzDklWNe5onLdhOklGuUvJFE9QeD2f09gmalAq3IR3cP4eSOkUq+TpPzWkJEqUTU
	LzjNHBicuqK8LM008v0ELBL98LLjUPiC/r7JHISO1pMWjYHLNBfh0WI1ZGaOd109YTcZOKSCOxeoh
	MKN/pCq3X0WoqOJ8+GS1fyA9XYauyHz79T3V0B3EA8hbbJq6OxDMic+bLXN3L43aswbf+gvcOwnJo
	aaT+/Mpv/kLfizruGK0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJDnH-0001VF-9o; Tue, 31 Mar 2020 10:06:51 +0000
Received: from mail-vk1-xa44.google.com ([2607:f8b0:4864:20::a44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJDnE-0001Ug-Qx
 for linux-snps-arc@lists.infradead.org; Tue, 31 Mar 2020 10:06:50 +0000
Received: by mail-vk1-xa44.google.com with SMTP id n128so5527505vke.5
 for <linux-snps-arc@lists.infradead.org>; Tue, 31 Mar 2020 03:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aQyhCGhngOr0l+aWuGw5lIHvIwiF6DlCEpfNgr6slIw=;
 b=jqR8WGSOCAGh/iH/uYmVGZn0WKIY8HgSAWp0TbfXyqjMgN1ZbxcP0dFyPUwCiw2AgA
 +DH7xW30OzUnjRznExIJ6UMwKx2FvgPP1L8ziHZdAZtRIGcts1/ztCRA6zvE9TMirgfr
 /cHxgLMi51ZdZi+/aX3SPSOwzxQD4Rw00/ZWAtMaUer2myMFhR9zwfWmqb4Q+/YF0rby
 cLarcgkYU3p/nuGGquIjntrUuuBKxMDd8pGTLd2zyynuP0lAO/Uhx7jknqUi2gdewahS
 elCnSKgFHFu2BXtevKVF+XNXmV1XQjXOJMeRm+2okcESMdWlkW2aFZQueJn8NHAeM5fr
 MBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aQyhCGhngOr0l+aWuGw5lIHvIwiF6DlCEpfNgr6slIw=;
 b=UWBVjq8eK+vFKPJypzcPILdWk/KPuQj5bpfV54BhrdqLPHr+4k5GX953we7sktb2D6
 N/ML1ZolgbuHwJILgKHSeETF4IA6VOx8kEQKbK6G2UGViRoIReKHQEwlGd4ABfFZaVr5
 Nv4qKTngxSOtXoM7m9zsTCrXkZDhmi/6nRfsUbjvrZDhZzuJ3RxbdRYnOO6qR4Mpx3RW
 u1LDhgYM2Pe2rqGyYRy/aPQWzx14+SBNu4iMqVX0K71PIgbv4xfFazNC4YMYS7UCLBo1
 R7WFVOnwe1Z2GEQ9ZCjxYLbnzhnHfOhsE+wdXdtrEjQWCMvMdv//wnjNkn7ycHDZtv3D
 F4Eg==
X-Gm-Message-State: AGi0PuYSUltA5qJk4expheu+EtdyjjQaXUFFsuBTE6eHS1MVDMOAvC3d
 JniJDmcYhlNdsCi4Wzv5ZhzznGaHWHhhDZTb3R/abAhw
X-Google-Smtp-Source: APiQypLSpAqgavIGMPuICBcs0o8vacsOgKRA3hBfD+XbF3qFr0RYksTfp4T25zdkJ4lwujHb7AcrV2LyMr0sSu7llUk=
X-Received: by 2002:a1f:9046:: with SMTP id s67mr11426105vkd.7.1585649207154; 
 Tue, 31 Mar 2020 03:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200329000503.27897-1-vgupta@synopsys.com>
In-Reply-To: <20200329000503.27897-1-vgupta@synopsys.com>
From: Claudiu Zissulescu Ianculescu <claziss@gmail.com>
Date: Tue, 31 Mar 2020 13:06:35 +0300
Message-ID: <CAL0iMy0f0tt6UtBRyT1hn=FsvF5tBYVKmcxHq57rDbc9YEtO0A@mail.gmail.com>
Subject: Re: [PATCH] [ARC] Allow more ABIs in GLIBC_DYNAMIC_LINKER
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_030648_873221_0C868796 
X-CRM114-Status: GOOD (  11.84  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: linux-snps-arc@lists.infradead.org, gcc-patches@gcc.gnu.org,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Pushed.

Thank you,
Claudiu

On Sun, Mar 29, 2020 at 2:05 AM Vineet Gupta via Gcc-patches
<gcc-patches@gcc.gnu.org> wrote:
>
> Enable big-endian suffixed dynamic linker per glibc multi-abi support.
>
> And to avoid a future churn and version pairingi hassles, also allow
> arc700 although glibc for ARC currently doesn't support it.
>
> gcc/
> xxxx-xx-xx  Vineet Gupta <vgupta@synopsys.com>
> +
> +       * config/arc/linux.h: GLIBC_DYNAMIC_LINKER support BE/arc700
>
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
>  gcc/ChangeLog          | 4 ++++
>  gcc/config/arc/linux.h | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/gcc/ChangeLog b/gcc/ChangeLog
> index 86ad683a6cb0..c26a748fd51b 100644
> --- a/gcc/ChangeLog
> +++ b/gcc/ChangeLog
> @@ -1,3 +1,7 @@
> +2020-03-28  Vineet Gupta <vgupta@synopsys.com>
> +
> +       * config/arc/linux.h: GLIBC_DYNAMIC_LINKER support BE/arc700
> +
>  2020-03-28  Jakub Jelinek  <jakub@redhat.com>
>
>         PR c/93573
> diff --git a/gcc/config/arc/linux.h b/gcc/config/arc/linux.h
> index 0b99da3fcdaf..1bbeccee7115 100644
> --- a/gcc/config/arc/linux.h
> +++ b/gcc/config/arc/linux.h
> @@ -29,7 +29,7 @@ along with GCC; see the file COPYING3.  If not see
>      }                                          \
>    while (0)
>
> -#define GLIBC_DYNAMIC_LINKER   "/lib/ld-linux-arc.so.2"
> +#define GLIBC_DYNAMIC_LINKER   "/lib/ld-linux-arc%{mbig-endian:eb}%{mcpu=arc700:700}.so.2"
>  #define UCLIBC_DYNAMIC_LINKER  "/lib/ld-uClibc.so.0"
>
>  /* Note that the default is to link against dynamic libraries, if they are
> --
> 2.20.1
>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
