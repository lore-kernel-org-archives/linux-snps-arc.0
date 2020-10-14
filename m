Return-Path: <SRS0=Sdks=DV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C84EAC433E7
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Oct 2020 21:21:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1E30221FF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Oct 2020 21:21:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WfTgUWAy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1E30221FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vsRKeODDEYpUasRzM2T5y/NBmxdM/R8biPdXUOcRzxY=; b=WfTgUWAyaVp6bkiXNU3+Ob42i
	d/goKNDVfII38mLtBPidEUeq85MJSS1F9haaF//BCP3SODmhGiiMYPgN1LspZzLDHsQTwRng0L25P
	8DaheiCW11MRPuNbVIRD/TYFfKBnHGb3yKUnVHb/AP3YzAVqzNo5BEGXmqpDHRnO7ymqd2IrnBpOR
	MRxtL9iKuTg9gntufiSoKOy/aA6TOyI01QT93WB2+mt5wviK59z1WWUNLaMtQ6LrgxbJjAn6Vb+Oq
	we/DqOdZaGnzqt3nbHFR3kAbJtBFwoPRXsLszqhwQpQUt+jAJa9Xe1gGOxEFvqrA1ZhnYTjGtgcID
	DSWs0pRzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSoD4-0005wN-Ju; Wed, 14 Oct 2020 21:21:22 +0000
Received: from mail.baikalelectronics.com ([87.245.175.226]
 helo=mail.baikalelectronics.ru)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSoCy-0005vB-Hn; Wed, 14 Oct 2020 21:21:17 +0000
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id E97D7803017E;
 Wed, 14 Oct 2020 21:21:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SjWfFKnHGm7N; Thu, 15 Oct 2020 00:21:13 +0300 (MSK)
Date: Thu, 15 Oct 2020 00:21:09 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 18/20] arch: dts: Fix EHCI/OHCI DT nodes name
Message-ID: <20201014212109.f2rssn5kil67hwnk@mobilestation>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-19-Sergey.Semin@baikalelectronics.ru>
 <ed0221ee-c586-b8f8-a7d1-4a2a190dc41b@gmail.com>
 <20201014181136.5hwsu77rv3wbxw7w@mobilestation>
 <932c52de-c2f1-ceea-e436-1471830700e9@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <932c52de-c2f1-ceea-e436-1471830700e9@gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_172116_853500_6AFAED82 
X-CRM114-Status: GOOD (  27.60  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>, Paul Mackerras <paulus@samba.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 linux-stm32@st-md-mailman.stormreply.com,
 Michael Ellerman <mpe@ellerman.id.au>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Wei Xu <xuwei5@hisilicon.com>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Kevin Hilman <khilman@baylibre.com>, linux-snps-arc@lists.infradead.org,
 devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Mathias Nyman <mathias.nyman@intel.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>,
 Felipe Balbi <balbi@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vineet Gupta <vgupta@synopsys.com>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Oct 14, 2020 at 11:41:17AM -0700, Florian Fainelli wrote:
> On 10/14/20 11:11 AM, Serge Semin wrote:
> > On Wed, Oct 14, 2020 at 11:00:45AM -0700, Florian Fainelli wrote:
> >> On 10/14/20 3:14 AM, Serge Semin wrote:
> >>> In accordance with the Generic EHCI/OHCI bindings the corresponding node
> >>> name is suppose to comply with the Generic USB HCD DT schema, which
> >>> requires the USB nodes to have the name acceptable by the regexp:
> >>> "^usb(@.*)?" . Let's fix the DTS files, which have the nodes defined with
> >>> incompatible names.
> >>>
> >>> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> >>>
> >>> ---
> >>>
> >>> Please, test the patch out to make sure it doesn't brake the dependent DTS
> >>> files. I did only a manual grepping of the possible nodes dependencies.
> >>
> > 
> >> Not sure how you envisioned these change to be picked up, but you may
> >> need to split these changes between ARM/ARM64, MIPS and PowerPC at
> >> least. And within ARM/ARM64 you will most likely have to split according
> >> to the various SoC maintainers.
> > 
> > Hmm, I don't really know how it's going to be done in this case, but there must
> > be a way to get the cross-platform patches picked up in general. For
> > instance, see the patches like:
> > 714acdbd1c94 arch: rename copy_thread_tls() back to copy_thread()
> > 140c8180eb7c arch: remove HAVE_COPY_THREAD_TLS
> > They touched the files from different files, but still have been merged in.
> 

> That situation is different, when a new facility is added and someone
> has gone through the work of adding support for all architectures (or
> nearly all of them), you want them to be merged in a way that limits
> merge conflicts with other architecture changes.
> 
> Here you are fixing warnings, and each file you touch can clearly be
> independently change from other files in the series without causing
> merge conflicts. You are however creating the potential for merge
> conflicts with other changes that the various SoC maintainers have
> queued up.
> 
> > Maybe I should have copied these three patches to the "linux-arch@vger.kernel.org"
> > list or some other mailing list...
> 
> Maybe Rob can queue them through his device tree repository, with the
> ack of the various SoC maintainers...

That's what I hoped for in the first place. But AFAICS now Rob does the splitting
of his patches himself, while the repo is used either for the
Documentation/devicetree/ patches or for the Rob'es own work. So it seems to me
I'll have to split the series up and resubmit... (

Hope I am wrong. So, @Rob, will you be able to merge this and the next two patches
in via your repo or you'd rather suggest for me to split it up and resubmit?

-Sergey

> -- 
> Florian

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
