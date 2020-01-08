Return-Path: <SRS0=NSlt=25=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4218EC3F68F
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jan 2020 11:56:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16E31205F4
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jan 2020 11:56:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AnCuaiFf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16E31205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PV+Uan/Mfkwq5WelOakWyrHULpkUVZf0PlVgKrt25I8=; b=AnCuaiFfX2UgXq
	HOBapo2BhfYXmi/9jtUppMuoBW1II9VU8u4JHN4NANS8Fn4CSiS+1ko8DD3JgumS9ZYD1hOq6Qdqh
	ZzoY9IF23WycOuMFMOHOz8fTohHHIEUfXNyrfG70aisYzRjAwIYrcfDu+yRzmqHIJA5IiuW0y8v6X
	KeIkKOszMIN2BlKv/Qm3y8WwU01UG1F5xcxJwUU3X8udCEy/hOs0ZDWTD3MgLteecH+Vz2uStoWKj
	YcsfH4ureWXN0ZaGesxXjLkFL0K/CM2hfgvhEHfTyo/5Pwfy2n92WI+1zCw/8/HvGC0rortDkESNk
	vVL5wsDmhwWuvU0ZNFow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ip9wQ-0003WW-5Y; Wed, 08 Jan 2020 11:56:02 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ip9wN-0003W8-P5
 for linux-snps-arc@lists.infradead.org; Wed, 08 Jan 2020 11:56:01 +0000
Received: from mail-lj1-f180.google.com ([209.85.208.180]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MMXDj-1j5ri628Pf-00JX1r for <linux-snps-arc@lists.infradead.org>; Wed, 08
 Jan 2020 12:55:57 +0100
Received: by mail-lj1-f180.google.com with SMTP id h23so2998432ljc.8
 for <linux-snps-arc@lists.infradead.org>; Wed, 08 Jan 2020 03:55:57 -0800 (PST)
X-Gm-Message-State: APjAAAX005CDUTRFS24lmdfsIbh5pJ6/yoHLZDA4F/FIhdeTt6txkb/4
 QnHJ+2ZMOijFy2IHWTSV1I3waSPGnCbvIpUIhhA=
X-Google-Smtp-Source: APXvYqx76A/E4Ch8oNBJvonZ2jianfqelDGhZdcoyIiElnwI+5tX58xf2+wQq15Hqyr3lM5AXUWKqh7e7QV64xZG5mc=
X-Received: by 2002:a2e:9095:: with SMTP id l21mr2608508ljg.175.1578484556968; 
 Wed, 08 Jan 2020 03:55:56 -0800 (PST)
MIME-Version: 1.0
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <CAMuHMdW4ek0OYQDrrbcpZjNUTTP04nSbwkmiZvBmKcU=PQM9qA@mail.gmail.com>
 <CAMuHMdUBmYtJKtSYzS_5u67hVZOqcKSgFY1rDGme6gLNRBJ_gA@mail.gmail.com>
 <CAJKOXPfq9vS4kSyx1jOPHBvi9_HjviRv0LU2A8ZwdmqgUuebHQ@mail.gmail.com>
 <2355489c-a207-1927-54cf-85c04b62f18f@c-s.fr>
 <CAK8P3a21yPrmp4ik3Ei1BZfeqZNf0wL5NZNF3uXqb4FLRDyUPw@mail.gmail.com>
 <20200108091549.GB10145@pi3>
In-Reply-To: <20200108091549.GB10145@pi3>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 8 Jan 2020 12:55:39 +0100
X-Gmail-Original-Message-ID: <CAK8P3a19ZgLhKJ016Mt_FyZrqnKaWwJyiaauMiUDAHV=DB9_2w@mail.gmail.com>
Message-ID: <CAK8P3a19ZgLhKJ016Mt_FyZrqnKaWwJyiaauMiUDAHV=DB9_2w@mail.gmail.com>
Subject: Re: [RFT 00/13] iomap: Constify ioreadX() iomem argument
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:Jh4aSERFyuMvi2p0cpvYJjDEWJuqtB3BQWCXhX3TvvL+MaxQdgE
 DmX+MVBPVZzkLcqlvJ+zCJFB0xEHkNKmMIAfLCqmszqolTwT4yQZLoZycjqZTtMUiowhVFy
 fJbRHOe8qp/sAWczZuWVzqH08zU/K90VL2ruGjsNiiAz/lJbgBTUf1kKfqQXJ9IFKiAYbDd
 aql+Jl3saWJYgI48LonBg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wCkE0CD/3PM=:IPEawwgVY5WSZ4kDYJOzml
 fQRnqjWZ+uw8HFj1LNMDhwmCH2fDi7opD8DzcrzmAK8wnXAQjZTpow4zLnb3FojFz+94n689L
 mCB5AUVyYxTmN3UwBcRLxzNNocOa2SWQ86stFDHvHAmCUIhtsPva07m5fkm1XFBVm9G8BKg42
 ZBdipa2qZLWkXf1lJK9dnOoB9iejeczF8ROcJF3QTOKDKoHdTU+i9qACqUe9i5bjBMXjWdcny
 gKfE4EzI7DMXV1ps1SDhhqX/RMceEhfYi4eHlT5rINXb9x9kEanV4kcVz4446JclIcfLARFJK
 C75aoKWZG1U1Lxyx4GVK+T4x4cf3RNpPiBkTjYAP2UgHFp+lkFi9qN75X2zxt3nf/UoRYmDL2
 coRBebxhq91Y88E0bpZ0xseolM5sCFjZQnvCirrU+lBpQSSmVZ5uFKhietir+CWWv13S9Bqu2
 Vs94DKWWwhRiXdyjYk7l6GLVqnSTc9Jn25q7l0Br+o8UA1Xl7gmspVX49TqJ0mqZhqydTAtef
 VF9JqJkpJrfSu9NgTje28QbkNcQtXHMVm7D61peXklNqbASBueWoerREy8T4yq6ehdjgJkgac
 nx8mvAKanFhCZKJFfSiGtMct8bFsLPsYpqbKWcYYPkVyWfL8gMLvOJwoy3CQ2B8j7koR9kvbF
 vGEl/wBzFUi2fuSyWAxXt2vl8Cd57exAErvyUPaaCU0tiDIkF17vm7o8eS3TdlzxCsqU16W3S
 EaTq5MygAWNLSaYZmQnVfp8znSiMx9lJ0aA3SY40fW5HIvMORyJS0ua4hl4gCxKQ3mm4RJpce
 g4Mg5wDSFz9ITw70D1LJBpGM93dMSe0KnLXhmWwothdLko95vKaqkk36m9dLbZBpPlMAg+/36
 KmQCQH/1kH7fOv/RDYUw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_035600_109247_7849A53C 
X-CRM114-Status: GOOD (  15.40  )
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
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 ML nouveau <nouveau@lists.freedesktop.org>, Jason Wang <jasowang@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, Linux-Arch <linux-arch@vger.kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Helge Deller <deller@gmx.de>, Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Matt Turner <mattst88@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Jon Mason <jdmason@kudzu.us>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Parisc List <linux-parisc@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 Daniel Vetter <daniel@ffwll.ch>, alpha <linux-alpha@vger.kernel.org>,
 linux-ntb@googlegroups.com, Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Jan 8, 2020 at 10:15 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> > The __force-cast that removes the __iomem here also means that
> > the 'volatile' keyword could be dropped from the argument list,
> > as it has no real effect any more, but then there are a few drivers
> > that mark their iomem pointers as either 'volatile void __iomem*' or
> > (worse) 'volatile void *', so we keep it in the argument list to not
> > add warnings for those drivers.
> >
> > It may be time to change these drivers to not use volatile for __iomem
> > pointers, but that seems out of scope for what Krzysztof is trying
> > to do. Ideally we would be consistent here though, either using volatile
> > all the time or never.
>
> Indeed. I guess there are no objections around const so let me send v2
> for const only.

Ok, sounds good. Maybe mention in the changelog then that the
'volatile' in the interface is intentionally left out, and that only users
of readl/writel still have it to deal with existing drivers.

    Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
