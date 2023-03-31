Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514F3C761AF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 31 Mar 2023 11:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mrNpPPHWZen6cMzoj9FRkSyYb39LUH/h+Tj43rcfMi0=; b=CpjV4lZ5gcbeLM
	oNKCoeibqKqUsal5vakI0OfIxvVvlri496xIT2d8089PGiXXJZuAgzGFqg+p2EjcxrRqqH2eW2PBS
	ylf38BqrrVzu749cI3h+pdkHM8LxC4SrTk5hbnnEBtC719TmAYIcPsSTm7xYgxaGv9LXJhFiy5iZ0
	+NhIqqwE9+lu1TRTuxgM8hz4mtWqdDiS2CMsPWyMffjoK+c7WZ9HtrYTGamU85NBEKYiszJiTXP10
	7CfhwkeC0he8kgYnaVscPjSPbKczXPFYFAYLQmKheTaziLTuI4ewf83mHMmA+mmAfMWNxdklfRd/D
	f+cZWpQl9JuC2EyGnOKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piCWP-0072Fl-15;
	Fri, 31 Mar 2023 11:02:17 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piCWM-0072C6-0d
	for linux-snps-arc@lists.infradead.org;
	Fri, 31 Mar 2023 11:02:15 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-61-KKeVLz0_Nn2s0KMUR0InMw-1; Fri, 31 Mar 2023 12:02:05 +0100
X-MC-Unique: KKeVLz0_Nn2s0KMUR0InMw-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 31 Mar
 2023 12:01:54 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Fri, 31 Mar 2023 12:01:54 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnd Bergmann' <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@kernel.org>
CC: Rich Felker <dalias@libc.org>, "linux-sh@vger.kernel.org"
	<linux-sh@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, "Linus
 Walleij" <linus.walleij@linaro.org>, John Paul Adrian Glaubitz
	<glaubitz@physik.fu-berlin.de>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, Conor.Dooley
	<conor.dooley@microchip.com>, guoren <guoren@kernel.org>,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "Will
 Deacon" <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Helge Deller
	<deller@gmx.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta
	<vgupta@kernel.org>, "linux-snps-arc@lists.infradead.org"
	<linux-snps-arc@lists.infradead.org>, "linux-xtensa@linux-xtensa.org"
	<linux-xtensa@linux-xtensa.org>, Brian Cain <bcain@quicinc.com>, "Lad,
 Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Michal Simek <monstr@monstr.eu>, "Thomas
 Bogendoerfer" <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org"
	<linux-parisc@vger.kernel.org>, "linux-openrisc@vger.kernel.org"
	<linux-openrisc@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "linux-hexagon@vger.kernel.org"
	<linux-hexagon@vger.kernel.org>, "linux-oxnas@groups.io"
	<linux-oxnas@groups.io>, Robin Murphy <robin.murphy@arm.com>, "David S .
 Miller" <davem@davemloft.net>
Subject: RE: [PATCH 15/21] ARM: dma-mapping: always invalidate WT caches
 before DMA
Thread-Topic: [PATCH 15/21] ARM: dma-mapping: always invalidate WT caches
 before DMA
Thread-Index: AQHZY70jODQmP+MmIk+VbheoRzXsQa8Ut5Vg
Date: Fri, 31 Mar 2023 11:01:54 +0000
Message-ID: <a5f226ee509b4968a4c85784aedbedf4@AcuMS.aculab.com>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-16-arnd@kernel.org>
 <ZCai0FmZiOqsMkzc@shell.armlinux.org.uk>
 <ZCapXlrqMOpRxkSu@shell.armlinux.org.uk>
 <a8a90181-a003-47a1-8257-fcbf55752249@app.fastmail.com>
In-Reply-To: <a8a90181-a003-47a1-8257-fcbf55752249@app.fastmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_040214_590556_1D9CDDC3 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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

From: Arnd Bergmann
> Sent: 31 March 2023 11:39
...
> Most architectures that have write-through caches (m68k,
> microblaze) or write-back caches but no speculation (all other
> armv4/armv5, hexagon, openrisc, sh, most mips, later xtensa)
> only invalidate before DMA but not after.
> 
> OTOH, most machines that are actually in use today (armv6+,
> powerpc, later mips, microblaze, riscv, nios2) also have to
> deal with speculative accesses, so they end up having to
> invalidate or flush both before and after a DMA_FROM_DEVICE
> and DMA_BIDIRECTIONAL.

nios2 is a simple in-order cpu with a short pipeline
(it is a soft-cpu made from normal fpga logic elements).
Definitely doesn't do speculative accesses.
OTOH any one trying to run Linux on it needs their head examined.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
