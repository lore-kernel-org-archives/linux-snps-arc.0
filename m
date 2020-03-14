Return-Path: <SRS0=0pgM=47=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24D4C1975A
	for <linux-snps-arc@archiver.kernel.org>; Sat, 14 Mar 2020 10:59:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 875252076D
	for <linux-snps-arc@archiver.kernel.org>; Sat, 14 Mar 2020 10:59:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iJYvlF3n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 875252076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JKySEYvLwrC/g8jP+2XOAEpt8rl3eZ2GodTx7H2RyoE=; b=iJYvlF3nG5oIp2
	5P0doamzRdIB2PLRNyRxXttNO0XmNfifvEC/0NFsiHS+fylm555GGl0Kq6DjnFWdLvgHowGRD1FbA
	CZY8jdyAr+mB8Ga+TD5pHdWhCrg2tP2zs9WHfSnRdrDi1peBg7Jru33mA2LdQ1jKYXMPmJEiq/5MY
	hr6p02LOarOYpiqZv5w91/3NnlZEReqY46OuGU8jbxaV39aCGhTMUS8d61oKmvoihdzI1YVB51YoF
	4hNPimKKZyuv/VfCsywEKEv7yollaZ4y+1OYYc8awDb1MNPEAT6pfnRWxInXcTPbGIiFbcxp78QJ1
	8FlHQEORv2UiV563lYqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jD4WI-0000VW-Ef; Sat, 14 Mar 2020 10:59:54 +0000
Received: from mail-ed1-f67.google.com ([209.85.208.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jD4WF-0000VC-U3
 for linux-snps-arc@lists.infradead.org; Sat, 14 Mar 2020 10:59:53 +0000
Received: by mail-ed1-f67.google.com with SMTP id b23so15286366edx.4
 for <linux-snps-arc@lists.infradead.org>; Sat, 14 Mar 2020 03:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=g01xlTcHoCeW8HA/Zoij0G1oenw325gwe1o5DluyjVk=;
 b=FmCgH/ruISC23qW6imFCSC/MsAYPa7SDMUjYeOxLlbbHQnRNon6aedSmIpXfQ7SJA+
 K8ycgWF/ljohtDhqWP6mzj6j0J98+bsMcbnNiAe4xPlyyX2Z+FtPVqr6lQzi6M/uL8E3
 ACLeG8y0PfhzW/Mv/NfKfdxuHYoLPYz/KSbI+HpzQYdxyoLRN+du1WtnF077JJVjU8Vf
 jUT/KD6rninc55h6rMshUio+GsNiMyIcLaCN8aUAMjP0gcPd+DChhKoi1Lgshx+rvwim
 uxedtimqmnz0eHMoivANl3koR/eRuQ/JlwKBHhIGkO5ZXhzbOWIyI/exufKfdNfXLzeF
 cUiQ==
X-Gm-Message-State: ANhLgQ1ePGBLTqKLv/l/paKEAACjS0vQ9z/NguJfoKBIO2erW/YXwrL0
 R1kahQVWpV8kuAZn5hPFSxw=
X-Google-Smtp-Source: ADFU+vv1WkKB0u07WBdUm4ghC+dsxjEf7g/P9HdfFTe2RSYc3zQrfQ3xU1TFNHiCqZRBtceL52pXBQ==
X-Received: by 2002:a17:906:2181:: with SMTP id
 1mr15328632eju.131.1584183589584; 
 Sat, 14 Mar 2020 03:59:49 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
 by smtp.googlemail.com with ESMTPSA id f21sm1538993ejx.41.2020.03.14.03.59.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 14 Mar 2020 03:59:48 -0700 (PDT)
Date: Sat, 14 Mar 2020 11:59:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [RESEND PATCH v2 6/9] drm/mgag200: Constify ioreadX() iomem
 argument (as in generic implementation)
Message-ID: <20200314105944.GA16044@kozik-lap>
References: <20200219175007.13627-1-krzk@kernel.org>
 <20200219175007.13627-7-krzk@kernel.org>
 <90baef2d-25fe-fac4-6a7e-b103b4b6721e@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <90baef2d-25fe-fac4-6a7e-b103b4b6721e@suse.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200314_035951_971355_5C6C6068 
X-CRM114-Status: UNSURE (   8.96  )
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
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jason Wang <jasowang@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 netdev@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linux-arch@vger.kernel.org, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 linux-sh@vger.kernel.org, Alexey Brodkin <abrodkin@synopsys.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, Nick Kossifidis <mickflemm@gmail.com>,
 Allen Hubbe <allenbh@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>, linux-parisc@vger.kernel.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Jon Mason <jdmason@kudzu.us>,
 linux-ntb@googlegroups.com, Andrew Morton <akpm@linux-foundation.org>,
 linux-media@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, Mar 12, 2020 at 11:49:05AM +0100, Thomas Zimmermann wrote:
> Hi Krzysztof,
> 
> I just received a resend email from 3 weeks ago :/
> 
> Do you want me to merge the mgag200 patch into drm-misc-next?

Thanks but it depends on the first patch in the series so either it
could go with your ack through other tree or I will send it later (once
1st patch gets to mainline).


Best regards,
Krzysztof


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
