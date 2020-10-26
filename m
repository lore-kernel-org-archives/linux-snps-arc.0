Return-Path: <SRS0=RMGV=EB=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEBD6C4363A
	for <linux-snps-arc@archiver.kernel.org>; Mon, 26 Oct 2020 09:49:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D6E720704
	for <linux-snps-arc@archiver.kernel.org>; Mon, 26 Oct 2020 09:49:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pKGfuhz4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D6E720704
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KGtgzMrM3j9c+Cfc8h4P9EhgNW1lQdFNW/SzhgGehD8=; b=pKGfuhz4/Io//nBEmzoD/Mm+0
	QDaOl/A1A0cpIiol8yurzd3s2FWp7xH7+9ZqTF7/WU7AVC87DonJwKZL+ZmDjg/iBiMn40aSL0kb4
	4XaIA0lLjF4Bl8yK5PEou3972oHD9SNyT8CkHxYKzrAE+We/s60Jw9af+K0/T10P84Qgw83hMEkZz
	gSr5DqOaRkv90Tqampcy98UOUIaXDVw72+1s9hlbj9Nuiv8UsSrE9p0dCKAbUjgRW6+gB5JO+tFWw
	YP0bt8lfwhsNEQMgqvY6n/qrPK2wQwKkO73zqOwlz0DGQS5XegXiQmWc4BB64jn/KdU/eyrB96RCs
	Pdrw+oPTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWz7n-0002db-QS; Mon, 26 Oct 2020 09:49:11 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWz7j-0002ck-Ix; Mon, 26 Oct 2020 09:49:09 +0000
Received: by mail-ot1-f67.google.com with SMTP id k3so6863185otp.1;
 Mon, 26 Oct 2020 02:49:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=314b+EPeJu8ztEUHKiEyh7Fe1KfnldWCCkTh7+28WEo=;
 b=lnY9gExovQvx+4NWfucgwYSID0+X0XPGOp7DqrQdBTitggJ0QhWGAePwW3VtRSUc5p
 yOyAa8camd7thA9xSGUdrDMf+p1Ta6OeXDDS8I5PTHszlUEcBjgf64QiYqKyoNu0x4PT
 vhJDZShrpR1eb1KW/6/jdygj5qEUkswXU5X8mxKTvDyKZbiGZTyGvnXtfCIxZbWV7/au
 4IXx5CvZXfyp4l8BwddLTzrZwct8wK9v34bQWbP+OQBc1s0CviVPbp2bhpXF5SBU2UmW
 E5ITk7yvloOzhguwIlh/ExjhI6yKON8vLO2n0fMjdGo+gDjs6c51qKP2/QdQXzNpsKds
 x7FA==
X-Gm-Message-State: AOAM530P3MAWJ54Qsml646XEzx/3WkludCQ/G4TQ8ojP95cSJZ9UOKNS
 meX/mWhkkNN82+6Aa6XKGJ2tKJKmAyvuq2MKPP8=
X-Google-Smtp-Source: ABdhPJz6Ac16eELMejGpA5pfteZH0S7xI3pqTk1GnO4kjTNW0lVeo7lq9J4RZJkz7zdoJDPT2VEy2pOJNu0QSN+3lS0=
X-Received: by 2002:a9d:3b76:: with SMTP id
 z109mr13819173otb.250.1603705746354; 
 Mon, 26 Oct 2020 02:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <20201026081811.3934205-1-geert@linux-m68k.org>
In-Reply-To: <20201026081811.3934205-1-geert@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Oct 2020 10:48:55 +0100
Message-ID: <CAMuHMdXbsJPnsXg6bA_e32zJkBG1Zzqj-ja5WzHDKL0d9OcfPg@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.10-rc1
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_054907_692308_DB0B0FBC 
X-CRM114-Status: GOOD (  11.42  )
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 linux-um <linux-um@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Mon, Oct 26, 2020 at 10:46 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Below is the list of build error/warning regressions/improvements in
> v5.10-rc1[1] compared to v5.9[2].
>
> Summarized:
>   - build errors: +3/-7
>   - build warnings: +26/-28
>
> Happy fixing! ;-)
>
> Thanks to the linux-next team for providing the build service.
>
> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/3650b228f83adda7e5ee532e2b90429c03f7b9ec/ (all 192 configs)
> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/bbf5c979011a099af5dc76498918ed7df445635b/ (all 192 configs)
>
>
> *** ERRORS ***
>
> 3 error regressions:
>   + /kisskb/src/arch/um/kernel/skas/clone.c: error: expected declaration specifiers or '...' before string constant:  => 24:16

um-all{mod,yes}config

>   + error: hotplug-memory.c: undefined reference to `of_drconf_to_nid_single':  => .text+0x5e0)

powerpc-gcc5/pseries_le_defconfig+NO_NUMA

>   + {standard input}: Error: inappropriate arguments for opcode 'adc':  => 170

arc-gcc10/axs101_defconfig

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
