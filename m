Return-Path: <SRS0=vxQV=4A=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFDD5C352A4
	for <linux-snps-arc@archiver.kernel.org>; Wed, 12 Feb 2020 18:25:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CF0A20714
	for <linux-snps-arc@archiver.kernel.org>; Wed, 12 Feb 2020 18:25:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nClMGs3u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CF0A20714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IabKL3NXrrAM1CptQrpLgwKOJON7PSueOTYok+iaJXs=; b=nClMGs3uiSRTR5
	LC7wh+No6veHBvNGOS72lAP/Ks4Pv6emlHsxVX6kjYmCAhUmVLzGW1/jrzKBSY+ZN4uQCfIui+6kQ
	CxM9pYE456YctZinhVb03lKveFkbEgjl6iGfAsQWyYH/tn6AlKCWhDgp0DETCBun74mO0rmupltfH
	ww8U7+rhEVjRNnZDkQsMfPT5NnarMye6t7ASpzaZI+GoX3yogm+mwIa7JG8htty5NGuPqwdj7E8s2
	5FF5cEKhYgVzUXUBZjYgLAx7JdWvz+bd/1JX8myqA25nW8qvsZskxMcMD/DM32YK10FaSCqowjq7H
	FWpCT6IBFxdTulriffwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1whF-000847-3u; Wed, 12 Feb 2020 18:25:13 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1whC-0007xw-DL
 for linux-snps-arc@lists.infradead.org; Wed, 12 Feb 2020 18:25:11 +0000
Received: by mail-ot1-f66.google.com with SMTP id 59so2873473otp.12
 for <linux-snps-arc@lists.infradead.org>; Wed, 12 Feb 2020 10:25:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dQSPlBfsEd2wAypjHlcqXA/a/ZUcl1Otw36cJXyEZOY=;
 b=gWvmaMx7AzPDNMcvRPRf+bqa+5eWyaNWFTIom0K2wz51HnC7SOCHv2mbeTs3yhqdL7
 tH5P2dFArsibbnCXh7FV4iLEgvTukwIz3SCNs8aYLcS4sq30xY4lXv36abRe2jZf3pDR
 OGXFkKI2eey0x5CIaSCtl7cD1rDLP306Uo7Uh8R4216Uf3kcbREAx4j5gC0Zzw+UvQb7
 7fycw+gz25YTcAdSeNRJGzFbWbCwMIRpZdkvEcNszfkJeOmDH8ywLrcZo9ob2OB7iCF+
 VouwtbY4nA7xLPW1aDgpES7EGICdQ0bK/+LJNtVofzOI6lGxY7m/ck3Zu3OD+B1jzPz1
 nbzA==
X-Gm-Message-State: APjAAAXyuzb5zdG6qkMSsQmeGTtAOozpBrX2jN88dLLweV2K9ZzuTV9G
 PHYQ6HFfKmIwBURbQJ9sYNlRjZHeJq3LFLojjvM=
X-Google-Smtp-Source: APXvYqwOCRWQPSAtw26bXb40u6ym1UwgBhm9rv03JRcVMF+mL86f5KFLBEEOsA7KRpS01Cn8ihwfY2VRuJHgRz3w2kI=
X-Received: by 2002:a9d:8f8:: with SMTP id 111mr9820405otf.107.1581531908721; 
 Wed, 12 Feb 2020 10:25:08 -0800 (PST)
MIME-Version: 1.0
References: <20200212100047.18642-1-geert+renesas@glider.be>
 <adba9217-352b-97a0-b1f7-d6895eb0c0d5@synopsys.com>
In-Reply-To: <adba9217-352b-97a0-b1f7-d6895eb0c0d5@synopsys.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Feb 2020 19:24:56 +0100
Message-ID: <CAMuHMdUvtbkTOQEdZ0J52CktOC7Q0gwVYos+VYv_Yet=57DvHg@mail.gmail.com>
Subject: Re: [PATCH] ARC: Replace <linux/clk-provider.h> by <linux/of_clk.h>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_102510_454092_9C9BC525 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Vineet,

On Wed, Feb 12, 2020 at 6:30 PM Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
> On 2/12/20 2:00 AM, Geert Uytterhoeven wrote:
> > The ARC platform code is not a clock provider, and just needs to call
> > of_clk_init().
> >
> > Hence it can include <linux/of_clk.h> instead of <linux/clk-provider.h>.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Thx for this Geert. Do you want me to pick this up.

Yes please. Thanks!

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
