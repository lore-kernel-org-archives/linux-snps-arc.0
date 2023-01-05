Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A1EC4708E
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Jan 2023 22:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FpKN9j3chy22cLeFNlcrCXR+2lC7GxSC716uklpsxBY=; b=apbDmLM3usVwpt
	aZLvy2en/lrhcundH8z7DElFjNFwl7KU04LaBWDFS0xkluqe3BVVm0MYOxN0MXUAmNPFrt3aaYdxE
	KD+nsJNIofdwfKm7HnVPaHdLVc7yGDzaXFhlghlTH9kPXJtXbSXsYgndGOSe/2IjY5+HW+/tkNJ0H
	wWdP/3psrqwltqZRnqTVDk/pMikv+iU0gIuC9uPuP64gnomtxYKZj8QaRRhsHui22klMOcW9e3BGa
	1cEZ1j7UMXlKYu+Keo2RphH00Lbs0v1uwnvBBTV4zzivfhRSNmVlj4Z/JZdTezvbB3UYZxcB2lv0C
	en8o4fjuDU6RIFu6ofuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDYvg-00FiED-84; Thu, 05 Jan 2023 22:41:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDVL6-00DqZD-1a
	for linux-snps-arc@bombadil.infradead.org; Thu, 05 Jan 2023 18:51:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hriix7PNjl3Fx5Lwj5vGvmpV6J+F4oqIBHmzWDNV1zY=; b=A8eHbdBUPh/YCfSaH/yMoyEvrl
	r9FfcZLXrsb5GPtjiJZmPYLleAmhCoeo8Tr0qjIM4AT4wCybp8c7Wz8r+ueW3EmFpHdNiC1sPhP2Q
	U44tNnUdY/KzT1WWUEpnl+Y91Z/18rSXl6cbLi8eA72bESp039LyRxMk9W3aELmMaaE/Y1W+BOTKx
	JX+MGpB7k95hLVg4uMVi4AHpop4gpMcaDP6HBQELqPKuMry6VcYTuMMvV1ZsFmVMaw2M8kwmhwI2w
	EcM3qt3/xWEfnBLSU/jzqdrU33mP0QUtQwzNav37SfiQbx8umzNsyxd7cVe4VsnY+G0NXSE3nv9ei
	hDA+us3g==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDT7m-001U2r-1o
	for linux-snps-arc@lists.infradead.org;
	Thu, 05 Jan 2023 16:29:54 +0000
Received: by mail-wr1-x42c.google.com with SMTP id co23so36692879wrb.4
        for <linux-snps-arc@lists.infradead.org>; Thu, 05 Jan 2023 08:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hriix7PNjl3Fx5Lwj5vGvmpV6J+F4oqIBHmzWDNV1zY=;
        b=Xkf28zaruVrLmqa0GfGmuAvqQQX+dB8u4vBIZu3Zqzswl7V0McjDKsYjGqvgAnDPVt
         JAfXVw2P8vm4NtD5ER0v9cpo5fq34lBw+gZ7lyOmQSBDrvgtT42XqrYiXIz43PC1aoqp
         dm4offnZy34FIeCS0B3FEa0zUz3dEn5dYFCKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hriix7PNjl3Fx5Lwj5vGvmpV6J+F4oqIBHmzWDNV1zY=;
        b=wwIDH+aGCb3sh2yVfwHaob22irNBVyde+lvUxjZ8Sb/hZ8xGN4fxe3C4/9p7wE5vXC
         DpwIHdY9jq3jFOVQH8cJuOmpNACgZl31wjjvwU7eHijGAi4Fw/I2l3VtIrziLfHP42Op
         +mOfq/A+iNqP7EOSZvJRFJRQ4b9DzWaVDIjkL3JKnDJiKuzWuYTILwZqAf7DdLp6TeLi
         CgrcbcStm97khaQxuXiAIttGuNFaP/e9EO+P9jXOlZlrQvCMVlHQcWrW53sN3/5Dd3Ux
         qApzIKIbynQDhCEclDicjWYgZN7ZNZv1CneQ4urZksF2L8pac6TPDDV4h3oQ0i3bBYZL
         p85g==
X-Gm-Message-State: AFqh2krsOqMuyp+FBlC+QJ8sDaXSE0e/uxoHg+pYYftz8VdYSOC8pr3u
	WjdIkpqRsNyVA1QhW1M/I8xEvw==
X-Google-Smtp-Source: AMrXdXvytt3BictUpSrNMsVMjqYxBg9ULQXEcgl2Nkqae4pxiPmHRRghamOTQFr1zyRYajkEyGj8ag==
X-Received: by 2002:adf:f9cb:0:b0:285:d0ba:92e2 with SMTP id w11-20020adff9cb000000b00285d0ba92e2mr22521193wrr.47.1672936194547;
        Thu, 05 Jan 2023 08:29:54 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id x15-20020a5d490f000000b00236883f2f5csm36488463wrq.94.2023.01.05.08.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 08:29:53 -0800 (PST)
Date: Thu, 5 Jan 2023 17:29:51 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-m68k@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	Boqun Feng <boqun.feng@gmail.com>, linux-xtensa@linux-xtensa.org,
	Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
	openrisc@lists.librecores.org, loongarch@lists.linux.dev,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 00/19] Introduce __xchg, non-atomic xchg
Message-ID: <Y7b6/7coJEVlTVxK@phenom.ffwll.local>
Mail-Followup-To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-m68k@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	Boqun Feng <boqun.feng@gmail.com>, linux-xtensa@linux-xtensa.org,
	Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
	openrisc@lists.librecores.org, loongarch@lists.linux.dev,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
References: <20221222114635.1251934-1-andrzej.hajda@intel.com>
 <20221222092147.d2bb177c67870884f2e59a9b@linux-foundation.org>
 <6e727952-3ad0-fcc3-82f1-c465dcffd56f@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6e727952-3ad0-fcc3-82f1-c465dcffd56f@intel.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_162950_904000_36AB984A 
X-CRM114-Status: GOOD (  40.10  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, Dec 29, 2022 at 10:54:50AM +0100, Andrzej Hajda wrote:
> Forgive me late response - Holidays,
> =

> On 22.12.2022 18:21, Andrew Morton wrote:
> > On Thu, 22 Dec 2022 12:46:16 +0100 Andrzej Hajda <andrzej.hajda@intel.c=
om> wrote:
> > =

> > > Hi all,
> > > =

> > > I hope there will be place for such tiny helper in kernel.
> > > Quick cocci analyze shows there is probably few thousands places
> > > where it could be useful.
> > So to clarify, the intent here is a simple readability cleanup for
> > existing open-coded exchange operations.
> =

> And replace private helpers with common one, see the last patch - the
> ultimate goal
> would be to replace all occurrences of fetch_and_zero with __xchg.
> =

> > The intent is *not* to
> > identify existing xchg() sites which are unnecessarily atomic and to
> > optimize them by using the non-atomic version.
> > =

> > Have you considered the latter?
> =

> If you mean some way of (semi-)automatic detection of such cases, then no.
> Anyway this could be quite interesting challenge.

My take is that unless there is very clear demand for this macro from
outside of i915, it's not worth it. All that fetch_and_zero zero achieved
is make i915 code a lot more confusing to read for people who don't know
this thing. And it replaces 2 entirely standard lines of 0, every often
clearing pointers in data structures where you really want the verbosity
to have a reminder and thinking about the locking.

Plus it smells way too much like the cmpxchg family of atomic functions,
addig further to the locking confuion.

Imo the right approach is to just open code this macro in i915 and then
drop it. Again, unless enough people outside of i915 really really want
this, and want to lift this to a kernel idiom.
-Daniel

> =

> > =

> > > I am not sure who is good person to review/ack such patches,
> > I can take 'em.
> > =

> > > so I've used my intuition to construct to/cc lists, sorry for mistake=
s.
> > > This is the 2nd approach of the same idea, with comments addressed[0].
> > > =

> > > The helper is tiny and there are advices we can leave without it, so
> > > I want to present few arguments why it would be good to have it:
> > > =

> > > 1. Code readability/simplification/number of lines:
> > > =

> > > Real example from drivers/net/ethernet/mellanox/mlx5/core/esw/qos.c:
> > > -       previous_min_rate =3D evport->qos.min_rate;
> > > -       evport->qos.min_rate =3D min_rate;
> > > +       previous_min_rate =3D __xchg(evport->qos.min_rate, min_rate);
> > > =

> > > For sure the code is more compact, and IMHO more readable.
> > > =

> > > 2. Presence of similar helpers in other somehow related languages/lib=
s:
> > > =

> > > a) Rust[1]: 'replace' from std::mem module, there is also 'take'
> > >      helper (__xchg(&x, 0)), which is the same as private helper in
> > >      i915 - fetch_and_zero, see latest patch.
> > > b) C++ [2]: 'exchange' from utility header.
> > > =

> > > If the idea is OK there are still 2 qestions to answer:
> > > =

> > > 1. Name of the helper, __xchg follows kernel conventions,
> > >      but for me Rust names are also OK.
> > I like replace(), or, shockingly, exchange().
> > =

> > But...   Can we simply make swap() return the previous value?
> > =

> > 	previous_min_rate =3D swap(&evport->qos.min_rate, min_rate);
> =

> As Alexander already pointed out, swap requires 'references' to two
> variables,
> in contrast to xchg which requires reference to variable and value.
> So we cannot use swap for cases:
> =A0=A0=A0 old_value =3D __xchg(&x, new_value);
> =

> Regards
> Andrzej
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
