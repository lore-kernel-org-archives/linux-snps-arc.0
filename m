Return-Path: <SRS0=FGIk=3E=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18706C33CB1
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Jan 2020 09:09:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9DF92081E
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Jan 2020 09:09:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VnQHs7kY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9DF92081E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6yjdvQYBy+31yzoxBg1ItcnbNnpdg4kdaLw3dCpv7Go=; b=VnQHs7kYBIqn+V
	0Ti6GT6pdH+mfr3evkIoAPKmcP0HeT10Y6iRm7Ta1Ommmfe+p4FMEprz1QQM134pIwozBCtoMWvDV
	bKuzjCBWRPQpJX7CkZojWX2mQqRtGbvVC/MQaERnOlu2Wk8PLgQ5GmjMA94+cShCbEc+QmyUyJMYO
	g7H45TVZVQH0DLneROpU0w1T4/3AK4PCZdL2SYX097nQhEaHgG/HNkiyAT7bBOJDyBcbEX+0hh4z2
	4ESU/8Cxq309T2e4qjSVQCrhYOYlomoLV6Wd7pAIYvm5KTtctY/dQxYgCb44hL5ioQrU+CrkIVz2a
	TIMjOmHSWgny5TfflRUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irefz-0006i7-FP; Wed, 15 Jan 2020 09:09:23 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irefU-0006BW-Rh
 for linux-snps-arc@lists.infradead.org; Wed, 15 Jan 2020 09:08:57 +0000
Received: from mail-qt1-f173.google.com ([209.85.160.173]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M9Ib1-1ilrFP3oMJ-006Rhz for <linux-snps-arc@lists.infradead.org>; Wed, 15
 Jan 2020 10:08:49 +0100
Received: by mail-qt1-f173.google.com with SMTP id e5so15131139qtm.6
 for <linux-snps-arc@lists.infradead.org>; Wed, 15 Jan 2020 01:08:48 -0800 (PST)
X-Gm-Message-State: APjAAAXA1ao68DCBY3k7XVAdBwS1nZGOkrCWYuMelnaBo3/lw/3G299H
 Ag4WG03eGNQgoxmfOuNiDCrGRI64BzURvNoWZOI=
X-Google-Smtp-Source: APXvYqx/ZPFvs8wMmfr0ffdvulPxbba2XG5TuOUCrt171EJtrRJtlrHppjn0oEiOSkVGfedyftsTi0baZQl8aPF8mWA=
X-Received: by 2002:ac8:768d:: with SMTP id g13mr2537307qtr.7.1579079327857;
 Wed, 15 Jan 2020 01:08:47 -0800 (PST)
MIME-Version: 1.0
References: <20200114200846.29434-1-vgupta@synopsys.com>
 <20200114200846.29434-2-vgupta@synopsys.com>
 <CAHk-=wjChjfOaDnGygOJpC36R6mtT7=Xf6wWTzD_wLJm=quu0Q@mail.gmail.com>
In-Reply-To: <CAHk-=wjChjfOaDnGygOJpC36R6mtT7=Xf6wWTzD_wLJm=quu0Q@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 15 Jan 2020 10:08:31 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2ao=xBuy3XHBkdo03KEjpMHGe9ahwj-uogtkZBXsMkGw@mail.gmail.com>
Message-ID: <CAK8P3a2ao=xBuy3XHBkdo03KEjpMHGe9ahwj-uogtkZBXsMkGw@mail.gmail.com>
Subject: Re: [RFC 1/4] asm-generic/uaccess: don't define inline functions if
 noinline lib/* in use
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Provags-ID: V03:K1:XqJxGcmEPwklqY9gOiWIO/B1CCp+Ph1knOY8vbuDtcu8VrIN+Wz
 2jcThCLKGGKfTaYHHipM7Zl5nKREAbkCZ5IwrwkRF3F8zdzN7U/4GXyRhMpUYLGPuhQWUrS
 3noC7/HKqvSdUyWIQStIeye7kvip/ln2WMyopozRbP0L8hXf4UYGePbA07P/F1BTR8T3Yxv
 qWHceec437nQRfvwOVd5A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Myagz8PHmFo=:D0tZ7BZ0lnS4Ect5rHU2tK
 l3RldKyG4uyxwu4PSCirpqzCGniuVYA5vr1tnUpAD/viA1GTRS+Ckzok48JxTm+eOJHT7Vq+K
 xleDEztqtdgkofO2fQXlyYJ922GdmDx0LGoxyaKX8aifXJhYPUicagngkLIKJwSNWa43Vng8n
 eHYekhNG3AKtE1KjdvdfRFNsqokO5ZMzXnX/8+wYo6il+I8xJxFouSXR2EJVX0O6w81d5FV0+
 bLYyN11POjd7cSBgrJSFSPMW4JHF+/jaHTRXwj0+ExVXo5hweU7yL3t+WrpeDOPzzz0gfEVdZ
 UbKX5gjA0Q8ANg18wj/myikj5kqOszbrIMse+lSRggFjCMOelcOCCIw6sfIY3g/1HjkkONpkr
 TKUZpeIhxPmk3mxsgcaqXuza/2FCEJiKNrDwCimjhQZsXAbGa2iVFON0N+Mpc38BiiVBVJSxx
 f976mUL06Jtpnna8g3HeNB4Lp7UA2bQ7YzBnINYdGmRtEfa3cQde2M6G/A+8dZaGGe0tSQuUg
 tt1oVTCS8l/TMaRodpJVjUAjJkcfudZKjEATfnfyJnzcBCk4VRx07xaqfrUA0Jq4HIs/np7iu
 W6tfU8zXxQWgseTvz3+2fP0FrTptCSacTCkg0Trj7D1/jud0OXDQODzDjBmv8+fFrYT4Um1Zl
 1JTczomWvi979XVg/Bx2E/g3WIgGNxcqAlrAUu+1kHs8fPy5Ti6gmp7tIDwYV+w3s1yWD2e+3
 VXx4oq1PL4PX21JhWNgJ3aKaXQr9UnsL5jnp3ePst2gmcqjB8x6TCAds3V5exhCNvLIMROsDi
 WrxLctR0rCtgTuRo9fDkC50CTYO8LA/EiO/56Zyh9X5NFCNaIK0xf7+ndLclyQUIejZ7/fQ6C
 cYyafdKmjHxmPSH8PMCA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_010853_234059_B1B3FF1A 
X-CRM114-Status: GOOD (  18.28  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Andrey Konovalov <andreyknvl@google.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>, Aleksa Sarai <cyphar@cyphar.com>,
 Ingo Molnar <mingo@kernel.org>, Khalid Aziz <khalid.aziz@oracle.com>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Jan 14, 2020 at 10:33 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Jan 14, 2020 at 12:09 PM Vineet Gupta
> <Vineet.Gupta1@synopsys.com> wrote:
> >
> > There are 2 generic varaints of strncpy_from_user() / strnlen_user()
> >  (1). inline version in asm-generic/uaccess.h
>
> I think we should get rid of this entirely. It's just a buggy garbage
> implementation that nobody should ever actually use.
>
> It does just about everything wrong that you *can* do, wrong,
> including doing the NUL-filling termination of standard strncpy() that
> "strncpy_from_user()" doesn't actually do.
>
> So:
>
>  - the asm-generic/uaccess.h __strncpy_from_user() function is just
> horribly wrong

I checked who is actually using it, and the only ones I found
are c6x and rv32-nommu. It shouldn't be hard to move them over
to the generic version.

>  - the generic/uaccess.h version of strncpy_from_user() shouldn't be
> an inline function either, since the only thing it can do inline is
> the bogus one-byte access check that _barely_ makes security work (you
> also need to have a guard page to _actually_ make it work, and I'm not
> atr all convinced that people do).

That would be arc, hexagon, unicore32, and um. Hexagon already has
the same bug in strncpy_from_user and should be converted to the
generic version as you say. For unicore32 the existing asm imlpementation
may be fine, but it's clearly easier to use the generic code than moving
the range check in there.

I don't know what the arch/um implementation needs, but since it's in C,
moving the access_ok() in there is easy enough.

> I would suggest that anybody who uses asm-generic/uaccess.h needs to
> simply use the generic library version.

Or possibly just everybody altogether: the remaining architectures that
have a custom implementation don't seem to be doing any better either.

     Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
